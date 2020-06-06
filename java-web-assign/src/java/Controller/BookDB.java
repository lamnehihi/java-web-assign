/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BookDB implements DatabaseInfo {

    //--------------------------------------------------------------------
    public static Book getById(String bid) {
        Book b = null;
        try {
            Class.forName(driverName);
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("Select bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover from Books where bID = ?");
                stmt.setString(1, bid);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    String bID = rs.getString(1);
                    String bName = rs.getString(2);
                    String catID = rs.getString(3);
                    float bPrice = Float.parseFloat(rs.getString(4));
                    int bQuantity = Integer.parseInt(rs.getString(5));
                    String bAuthor = rs.getString(6);
                    String bDes = rs.getString(7);
                    String bCover = rs.getString(8);
                    b = new Book(bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover);
                }
                con.close();
            }
            return b;
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(BookDB.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }

    //--------------------------------------------------------------------
    public static ArrayList<Book> getAll() {
        Book b = null;
        ArrayList<Book> bookList = new ArrayList<Book>();
        try {
            Class.forName(driverName);
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("Select bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover from Books");
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    String bID = rs.getString(1);
                    String bName = rs.getString(2);
                    String catID = rs.getString(3);
                    float bPrice = Float.parseFloat(rs.getString(4));
                    int bQuantity = Integer.parseInt(rs.getString(5));
                    String bAuthor = rs.getString(6);
                    String bDes = rs.getString(7);
                    String bCover = rs.getString(8);
                    b = new Book(bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover);
                    bookList.add(b);
                }
                con.close();
            }
            return bookList;
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(BookDB.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }

    //--------------------------------------------------------------------
    public static ArrayList<Book> getByKeyWord(String key) {
        Book b = null;
        ArrayList<Book> bookList = new ArrayList<Book>();
        try {
            Class.forName(driverName);
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                String sql = "Select bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover from Books ";
                if (key.length() > 0) {
                    sql += "where bName like '%" + key + "%' ";
                }
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    String bID = rs.getString(1);
                    String bName = rs.getString(2);
                    String catID = rs.getString(3);
                    float bPrice = Float.parseFloat(rs.getString(4));
                    int bQuantity = Integer.parseInt(rs.getString(5));
                    String bAuthor = rs.getString(6);
                    String bDes = rs.getString(7);
                    String bCover = rs.getString(8);
                    b = new Book(bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover);
                    bookList.add(b);
                }
                con.close();
            }
            return bookList;
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(BookDB.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
   
    //--------------------------------------------------------------------
    public static ArrayList<Book> getByCategoryID(String cateID) {
        Book b = null;
        ArrayList<Book> bookList = new ArrayList<Book>();
        try {
            Class.forName(driverName);
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("Select bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover from Books where catID = ?");
                stmt.setString(1, cateID);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    String bID = rs.getString(1);
                    String bName = rs.getString(2);
                    String catID = rs.getString(3);
                    float bPrice = Float.parseFloat(rs.getString(4));
                    int bQuantity = Integer.parseInt(rs.getString(5));
                    String bAuthor = rs.getString(6);
                    String bDes = rs.getString(7);
                    String bCover = rs.getString(8);
                    b = new Book(bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover);
                    bookList.add(b);
                }
                con.close();
            }
            return bookList;
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(BookDB.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
    
    //--------------------------------------------------------------------
    public static ArrayList<Book> getByPrice(float from, float to) {
        Book b = null;
        ArrayList<Book> bookList = new ArrayList<Book>();
        try {
            Class.forName(driverName);
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("Select bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover from Books where bPrice between ? and ?");
                stmt.setFloat(1, from);
                stmt.setFloat(2, to);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    String bID = rs.getString(1);
                    String bName = rs.getString(2);
                    String catID = rs.getString(3);
                    float bPrice = Float.parseFloat(rs.getString(4));
                    int bQuantity = Integer.parseInt(rs.getString(5));
                    String bAuthor = rs.getString(6);
                    String bDes = rs.getString(7);
                    String bCover = rs.getString(8);
                    b = new Book(bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover);
                    bookList.add(b);
                }
                con.close();
            }
            return bookList;
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(BookDB.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
    
    
    

    public static void main(String[] args) {
        Book b = new Book();
        ArrayList<Book> bl = new ArrayList<>();
        bl = BookDB.getByPrice(700000, 900000);
        System.out.println(bl.size());
        for (int i = 0; i < bl.size(); i++) {
            System.out.println(bl.get(i).getbName());
        }
        b = BookDB.getById("B0001");
        //System.out.println(b.getbName());
    }
}
