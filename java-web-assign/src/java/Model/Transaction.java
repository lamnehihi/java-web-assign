/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.UserDB;
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
    private User us;
    private List<Order> Cart= new ArrayList<>() ;
    private boolean Status;
    private Date tDate;
    private Double Total;

    public Transaction(String tID, String uID, boolean Status, Date tDate) {
        this.tID = tID;
        this.us = UserDB.getUserById(uID);
        this.Status = Status;
        this.tDate = tDate;
        
    }

    public String gettID() {
        return tID;
    }

    public void settID(String tID) {
        this.tID = tID;
    }

    public User getUs() {
        return us;
    }

    public void setUs(User us) {
        this.us = us;
    }

    public Double getTotal() {
        return Total;
    }

    public void setTotal() {
        this.Total=0.0;
        for (Order order : Cart) {
            this.Total+=(order.getBook().getbPrice()*order.gettQuatity()); 
            System.out.println(tID+"/"+order.getBook().getbName()+order.getBook().getbPrice()+"/"+order.gettQuatity());
        }
    }

    

    public List<Order> getCart() {
        return Cart;
    }

    public void setCart(List<Order> Cart) {
        this.Cart = Cart;
        setTotal();
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
        return "Transaction{" + "tID=" + tID + ", uID=" + us + ", Cart=" + Cart + ", Status=" + Status + ", tDate=" + tDate + '}';
    }

}