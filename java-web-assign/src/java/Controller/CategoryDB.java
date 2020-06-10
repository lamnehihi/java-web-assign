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
import Model.Category;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class CategoryDB implements DatabaseInfo {
    public static ArrayList<Category> getAll() {
        Category cat = null;
        ArrayList<Category> catList = new ArrayList<Category>();
        try {
            Class.forName(driverName);
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("Select catID, catName from Categories");
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    String catID = rs.getString(1);
                    String catName = rs.getString(2);
                    cat = new Category(catID, catName);
                    catList.add(cat);
                }
                con.close();
            }
            return catList;
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(CategoryDB.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
    //-------------------------------------------------------------------------
    public static Category getById(String catid) {
        Category cat = null;
        try {
            Class.forName(driverName);
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("Select catID, catName from Categories where catID = ?");
                stmt.setString(1, catid);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    String catID = rs.getString(1);
                    String catName = rs.getString(2);
                    cat = new Category(catID, catName);
                }
                con.close();
            }
            return cat;
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(CategoryDB.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
    //--------------------------------------------------------------------------------
    public static ArrayList<Category> getByName(String name) {
        Category cat = null;
        ArrayList<Category> catList = new ArrayList<Category>();
        try {
            Class.forName(driverName);
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                String sql = "Select catID, catName from Categories ";
                if (name.length() > 0) {
                    sql += "where catName like '%" + name + "%' ";
                }
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    String catID = rs.getString(1);
                    String catName = rs.getString(2);
                    cat = new Category(catID, catName);
                    catList.add(cat);
                }
                con.close();
            }
            return catList;
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(CategoryDB.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
    public static void main(String[] args) {
        Category cat = new Category();
        ArrayList<Category> cat1,cat2 = new ArrayList<>();
        cat = CategoryDB.getById("C005");
        cat1=CategoryDB.getAll();
        cat2 = CategoryDB.getByName("fairy");
        System.out.println(cat.getCatName());
    }
}
