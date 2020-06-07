/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.time.LocalDate;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tran phu phat
 */
public class Transaction {
    private String tID;
    private String uID;
    private List<Order> Cart= new ArrayList<>() ;
    private boolean Status;
    private Date tDate;

    public Transaction(String tID, String uID, boolean Status, Date tDate) {
        this.tID = tID;
        this.uID = uID;
        this.Status = Status;
        this.tDate = tDate;
    }

    public String gettID() {
        return tID;
    }

    public void settID(String tID) {
        this.tID = tID;
    }

    public String getuID() {
        return uID;
    }

    public void setuID(String uID) {
        this.uID = uID;
    }

    public List<Order> getCart() {
        return Cart;
    }

    public void setCart(List<Order> Cart) {
        this.Cart = Cart;
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
        return "Transaction{" + "tID=" + tID + ", uID=" + uID + ", Cart=" + Cart + ", Status=" + Status + ", tDate=" + tDate + '}';
    }

}