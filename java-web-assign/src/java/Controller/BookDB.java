/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BookDB implements DatabaseInfo {
    //--------------------------------------------------------------------
    public static Book getBookById(String bid) {
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
                    String bPrice = rs.getString(4);
                    String bQuantity = rs.getString(5);
                    String bAuthor = rs.getString(6);
                    String bDes = rs.getString(7);
                    String bCover = rs.getString(8);
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
    public static Book getAllBook() {
        Book b = null;
        try {
            Class.forName(driverName);
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("Select bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover from Books");
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    String bID = rs.getString(1);
                    String bName = rs.getString(2);
                    String catID = rs.getString(3);
                    String bPrice = rs.getString(4);
                    String bQuantity = rs.getString(5);
                    String bAuthor = rs.getString(6);
                    String bDes = rs.getString(7);
                    String bCover = rs.getString(8);
                }
                con.close();
            }
            return b;
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(BookDB.class.getName()).log(Level.SEVERE, null, e);
            return null;
        }
    }
}
