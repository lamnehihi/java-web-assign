/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AdminFunction;

import static Controller.DatabaseInfo.dbURL;
import static Controller.DatabaseInfo.driverName;
import static Controller.DatabaseInfo.passDB;
import static Controller.DatabaseInfo.userDB;
import Model.Book;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class BookDBforAdmin {

    public static boolean addNewBook(Book b) {
        try {
            Class.forName(driverName);
            try (Connection con = DriverManager.getConnection(dbURL, userDB, passDB)) {
                PreparedStatement stmt = con.prepareStatement("insert into Books (bID, bName, catID, bPrice, bQuantity, bAuthor, bDes, bCover ) values(?, ?, ?, ?, ?, ?, ?, ?)");
                stmt.setString(1, b.getbId());
                stmt.setString(2, b.getbName());
                stmt.setString(3, b.getCatId());
                stmt.setFloat(4, b.getbPrice());
                stmt.setInt(5, b.getbQuantity());
                stmt.setString(6, b.getbAuthor());
                stmt.setString(7, b.getbDes());
                stmt.setString(8, b.getbCover());
                stmt.execute();
                con.close();
            }
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(BookDBforAdmin.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    /* ================================================================= */
    public static void updateBook(Book bk) {
        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
            PreparedStatement stmt = con.prepareStatement("Update Books set bName=?, catID=?, bPrice=?, bQuantity=?, bAuthor=?, bDes=?, bCover=? where bID=?");
            stmt.setString(1, bk.getbName());
            stmt.setString(2, bk.getCatId());
            stmt.setFloat(3, bk.getbPrice());
            stmt.setInt(4, bk.getbQuantity());
            stmt.setString(5, bk.getbAuthor());
            stmt.setString(6, bk.getbDes());
            stmt.setString(7, bk.getbCover());
            int rc = stmt.executeUpdate();
            con.close();
            if (rc != 1) {
                throw new RuntimeException("Update failed");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    /* ================================================================= */
    public static void deleteBook(Book bk) {
        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(dbURL, userDB, passDB);
            PreparedStatement stmt = con.prepareStatement("DELETE FROM Books WHERE bID=?");
            stmt.setString(1, bk.getbName());
            stmt.setString(2, bk.getCatId());
            stmt.setFloat(3, bk.getbPrice());
            stmt.setInt(4, bk.getbQuantity());
            stmt.setString(5, bk.getbAuthor());
            stmt.setString(6, bk.getbDes());
            stmt.setString(7, bk.getbCover());
            int rc = stmt.executeUpdate();
            con.close();
            if (rc != 1) {
                throw new RuntimeException("Delete failed");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

        }
    }

    
}
