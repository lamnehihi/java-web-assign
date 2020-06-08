/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Stack;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tran phu phat
 */
public class TransactionDB implements DatabaseInfo {
//---------------Private Function---------------------------------------------------------------------------------

    private ArrayList<String> getAlltID() {
        try {
            // get All tID in table Transaction from Database
            ArrayList<String> result = new ArrayList<>();
            Class.forName(driverName);
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("select distinct tID from Transactions");
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    //System.out.println(rs.getString(1)+"a");
                    result.add(rs.getString(1));
                }
                con.close();
                return result;
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TransactionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private ArrayList<TransactionforDB> getTransactionbyOneAttribute(int choice, String Attribute) {
        // get Transaction by One Attribute: choice: 1-tID 2-uID 3-bID 4-Status 5- date
        String sql = "select tID,uID,bID,tQuantity,status,tDate from Transactions where ";
        switch (choice) {
            case 1:
                sql = sql + "tID= '" + Attribute + "'";
                break;
            case 2:
                sql = sql + "uID= '" + Attribute + "'";
                break;
            case 3:
                sql = sql + "bID= '" + Attribute + "'";
                break;
            case 4:
                sql = sql + "status= " + Attribute;
                break;
            case 5:
                sql = sql + Attribute;
                break;
        }
        ArrayList<TransactionforDB> result = new ArrayList<>();
        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TransactionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString(2));
                result.add(new TransactionforDB(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getDate(6)));
            }
            con.close();
            for (int i = 0; i < result.size(); i++) {
                //System.out.println(result.get(i).gettID());
            }
            return result;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    private ArrayList<Transaction> convert(ArrayList<TransactionforDB> list) {
        boolean isExist;
        //System.out.println(list.size()+"before");
        if (list.isEmpty()) {
            System.out.println("this is null");
        }
        ArrayList<Transaction> result = new ArrayList<>();
        for (TransactionforDB tr : list) {
            //System.out.println(tr.gettID());
            isExist = false;
            if (!result.isEmpty()) {
                for (Transaction rs : result) {
                    if (rs.gettID().equals(tr.gettID())) {
                        rs.getCart().add(new Order(tr.getbID(), tr.gettQuatity()));
                        isExist = true;
                        //break;
                    }
                }
            }
            if (!isExist) {
                Transaction temp = new Transaction(tr.gettID(), tr.getuID(), tr.isStatus(), tr.gettDate());
                temp.getCart().add(new Order(tr.getbID(), tr.gettQuatity()));
                //System.out.println(temp);
                result.add(temp);
            }

        }
        //System.out.println(result.size()+"after");
        return result;
    }

    public static String createTransactionID() {
        char[] BookID = new char[4];
        try {
            Class.forName(driverName);
            int rc = 0;
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("select count(distinct tID) from Transactions");
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    rc = rs.getInt(1);
                }
            }
            if (rc <= 998) {
                rc += 1001;
            } else {
                throw new Exception("over Index");
            }
            String tID = "T" + rc;
            StringBuilder temp = new StringBuilder(tID);
            temp.deleteCharAt(1);
            tID = temp.toString();
            return tID;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            try {
                throw new Exception("Create Transaction Id failed !");
            } catch (Exception ex) {
                Logger.getLogger(TransactionDB.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (Exception ex) {
            Logger.getLogger(TransactionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    //--------------------------------- Public function --------------------------------------------------------------

    public ArrayList<Transaction> getAll() {
        ArrayList<Transaction> result = new ArrayList<>();
        ArrayList<String> listTID = getAlltID();
        //if(listTID.isEmpty())System.out.println("null tID");
        for (String tID : listTID) {
            //System.out.println(tID);
            ArrayList<Transaction> ls = getBytID(tID);
            //if(ls.isEmpty())System.out.println("null  2 "+tID);
            for (Transaction temp : ls) {
                result.add(temp);
            }
        }
        return result;
    }

    public ArrayList<Transaction> getBytID(String tID) {
        return convert(getTransactionbyOneAttribute(1, tID));
    }

    public ArrayList<Transaction> getByuID(String uID) {
        ArrayList<Transaction> result = new ArrayList<>();
        ArrayList<Transaction> ls = convert(getTransactionbyOneAttribute(2, uID));
        //if(ls.isEmpty())System.out.println("null  2 "+tID);
        for (Transaction temp : ls) {
            result.add(temp);
        }
        return result;
    }

    public ArrayList<Transaction> getBybID(String bID) {
        ArrayList<Transaction> result = new ArrayList<>();
        ArrayList<Transaction> ls = convert(getTransactionbyOneAttribute(3, bID));
        //if(ls.isEmpty())System.out.println("null  2 "+tID);
        for (Transaction temp : ls) {
            result.add(temp);
        }
        return result;
    }

    public ArrayList<Transaction> getByStatus(boolean status) {
        ArrayList<Transaction> result = new ArrayList<>();
        ArrayList<Transaction> ls = new ArrayList<>();
        if (status) {
            ls = convert(getTransactionbyOneAttribute(4, "1"));// 1 for true and 0 for false
        } else {
            ls = convert(getTransactionbyOneAttribute(4, "0"));
        }
        //if(ls.isEmpty())System.out.println("null  2 "+tID);
        for (Transaction temp : ls) {
            result.add(temp);
        }
        return result;
    }

    public ArrayList<Transaction> getByDate(String Date) {
        ArrayList<Transaction> result = new ArrayList<>();
        //the format of Date : dd-mm-yyyy
        ArrayList<Transaction> ls = convert(getTransactionbyOneAttribute(5, " tDate = '" + Date + "'"));
        for (Transaction temp : ls) {
            result.add(temp);
        }
        return result;
    }

    public ArrayList<Transaction> getByYear(String year) {
        ArrayList<Transaction> result = new ArrayList<>();
        //the format of Date : dd-mm-yyyy
        ArrayList<Transaction> ls = convert(getTransactionbyOneAttribute(5, " YEAR(tDate)= " + year));
        System.out.println(ls.size());
        for (Transaction temp : ls) {
            result.add(temp);
        }
        return result;
    }

    public ArrayList<Transaction> getByMonth(String month, String year) {
        ArrayList<Transaction> result = new ArrayList<>();
        //the format of Date : dd-mm-yyyy
        ArrayList<Transaction> ls = convert(getTransactionbyOneAttribute(5, " MONTH(tDate)= " + month + " and YEAR(tDate)= " + year));
        System.out.println(ls.size());
        for (Transaction temp : ls) {
            result.add(temp);
        }
        return result;
    }

    public void AddnewTransaction(Transaction t) {
        ArrayList<TransactionforDB> list = new ArrayList<>();
        for (int i = 0; i < t.getCart().size(); i++) {
            list.add(new TransactionforDB(t.gettID(), t.getuID(), t.getCart().get(i).getbID(), t.getCart().get(i).gettQuatity(), t.isStatus(), t.gettDate()));
        }
        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TransactionDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (TransactionforDB tran : list) {
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("insert into Transactions(tID,uID,bID,tQuantity,status,tDate) values(?,?,?,?,?,getdate())");
                stmt.setString(1, createTransactionID());
                stmt.setString(2, tran.getuID());
                stmt.setString(3, tran.getbID());
                stmt.setInt(4, tran.gettQuatity());
                stmt.setBoolean(5, tran.isStatus());
                int rc = stmt.executeUpdate();
                System.out.println(rc);
                if (rc == 0) {
                    System.out.println("insert failed");
                }
            } catch (SQLException ex) {
                Logger.getLogger(TransactionDB.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println(ex);
            }
        }
        //return false;
    }

    public void ChangeStatus(String tID) {
        try {
            Class.forName(driverName);
            int rc;
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("Update Transactions set status=1 where tID= ?");
                stmt.setString(1, tID);
                rc = stmt.executeUpdate();
            }
            if(rc==0 ) throw new Exception("Change Status failed");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
