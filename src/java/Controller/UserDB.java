/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import static Controller.DatabaseInfo.dbURL;
import static Controller.DatabaseInfo.driverName;
import static Controller.DatabaseInfo.passDB;
import static Controller.DatabaseInfo.userDB;
import Model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class UserDB {

    public static ArrayList<User> getAllUser() {
        try {
            ArrayList<User> list = new ArrayList<User>();
            User s;
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
            PreparedStatement stmt = con.prepareStatement("Select uID, uEmail, uPassword, uName, uPhone, uAddress from Users");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String uID = rs.getString(2);
                String uEmail = rs.getString(3);
                String uPassword = rs.getString(4);
                String uName = rs.getString(5);
                String uPhone = rs.getString(6);
                String uAddress = rs.getString(1);
                s = new User(uID, uEmail, uPassword, uName, uPhone, uAddress);
                list.add(s);
            }
            con.close();
            return list;
        } catch (Exception ex) {
            Logger.getLogger(UserDB.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public static String addNewUser(String uID, String uEmail, String uPassword, String uName, String uPhone, String uAddress) {
        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
            PreparedStatement stmt = con.prepareStatement("Insert Into Users(uID, uEmail, uPassword, uName, uPhone, uAddress) Values(?,?,?,?,?,?) ");
            stmt.setString(1, uID);
            stmt.setString(2, uEmail);
            stmt.setString(3, uPassword);
            stmt.setString(4, uName);
            stmt.setString(5, uPhone);
            stmt.setString(6, uAddress);
            stmt.execute();
            con.close();
        } catch (Exception ex) {
            Logger.getLogger(UserDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static boolean updateUser(User s) {
        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
            //con.setAutoCommit(false);
            PreparedStatement stmt = con.prepareStatement("Update Users set uEmail=?,uPassword=?,uName=?,uPhone=?, uAddress=? where uID=?");
            stmt.setString(1, s.getuEmail());
            stmt.setString(2, s.getuPassword());
            stmt.setString(3, s.getuName());
            stmt.setString(4, s.getuPhone());
            stmt.setString(5, s.getuAddress());
            stmt.setString(6, s.getuID());
            int rc = stmt.executeUpdate();
            //if(rc==1) con.commit(); else con.rollback();
            con.close();
            return rc == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static User getUserById(String uID) {
        User s = null;
        try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("Select uEmail,uPassword,uName,uPhone,uAddress from Users where uID='" + uID + "'");
            if (rs.next()) {
                String uEmail = rs.getString(1);
                String uPassword = rs.getString(2);
                String uName = rs.getString(3);
                String uPhone = rs.getString(4);
                String uAddress = rs.getString(5);
                String userID = uID;
                s = new User(userID, uEmail, uPassword, uName, uPhone, uAddress);
            }
            con.close();
            return s;
        } catch (Exception ex) {
            Logger.getLogger(UserDB.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public static User getUserByName(String uName) {
        User s = null;
        try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("Select uID,uEmail,uPassword,uPhone,uAddress from Users where uName='" + uName + "'");
            if (rs.next()) {
                String uID = rs.getString(1);
                String uEmail = rs.getString(2);
                String uPassword = rs.getString(3);
                String uPhone = rs.getString(4);
                String uAddress = rs.getString(5);
                String userName = uName;
                s = new User(uID, uEmail, uPassword, userName, uPhone, uAddress);
            }
            con.close();
            return s;
        } catch (Exception ex) {
            Logger.getLogger(UserDB.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public static String LogIn(String email, String password) {
        /*
        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
            PreparedStatement stmt = con.prepareStatement("Select uID from Users where uEmail=? and uPassword =?");
            stmt.setString(1, email);
            stmt.setString(2, password);
            String ID = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                ID = rs.getString(1);
            }
            con.close();
            return ID;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
         */
        return "success";
    }

    public static void main(String[] args) {
//        UserDB.addNewUser("U0006", "a@b.c", "123", "assss", "9488555", "Da Nang");
//        UserDB.addNewUser("U0007", "aa@b.c", "d123", "asassss", "09488555", "Da Nang");

//        System.out.println("=   =   =   =   =   =   =   =   =   =       =   =   =   =   =   =   ==");
//        
//        
//        User s = new User("U0006", "aaaa@xxxxx.x", "acdd", "ssd", "1425555", "Ha Noi");
//        UserDB.updateUser(s);
//        
//        
//        System.out.println("=   =   =   =   =   =   =   =   =   =       =   =   =   =   =   =   ==");
//        
//        System.out.println(UserDB.getUserById("U0006").toString());
//        System.out.println("=   =   =   =   =   =   =   =   =   =       =   =   =   =   =   =   ==");
//        
//        System.out.println(UserDB.getUserByName("asassss"));
//          System.out.println(UserDB.getAllUser());
    }
}
