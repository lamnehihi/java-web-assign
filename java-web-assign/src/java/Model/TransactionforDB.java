/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.time.LocalDate;
import java.sql.Date;

/**
 *
 * @author tran phu phat
 */
public class TransactionforDB {

    private String tID;
    private String uID;
    private String bID;
    private int tQuatity;
    private boolean Status;
    private Date tDate;

    public TransactionforDB() {
    }

    public TransactionforDB(String tID, String uID, String bID, int tQuatity, boolean Status, Date tDate) {
        this.tID = tID;
        this.uID = uID;
        this.bID = bID;
        this.tQuatity = tQuatity;
        this.Status = Status;
        this.tDate = tDate;
    }

    
    public String gettID() {
        return tID;
    }

    public void settID(String tID) {
        this.tID = tID;
    }

    public String getbID() {
        return bID;
    }

    public void setbID(String bID) {
        this.bID = bID;
    }

    public String getuID() {
        return uID;
    }

    public void setuID(String uID) {
        this.uID = uID;
    }

    public int gettQuatity() {
        return tQuatity;
    }

    public void settQuatity(int tQuatity) {
        this.tQuatity = tQuatity;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public Date gettDate() {
        return tDate;
    }

    public void settDate(Date tDate) {
        this.tDate = tDate;
    }

   

    @Override
    public String toString() {
        return "TransactionforDB{" + "tID=" + tID + ", uID=" + uID + ", bID=" + bID + ", tQuatity=" + tQuatity + ", Status=" + Status + ", tDate=" + tDate + '}';
    }

}
