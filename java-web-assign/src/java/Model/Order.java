/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author tran phu phat
 */
public class Order {

    private String bID;
    private int tQuatity;

    public Order(String bID, int tQuatity) {
        this.bID = bID;
        this.tQuatity = tQuatity;
    }

    public Order() {
    }

    public String getbID() {
        return bID;
    }

    public void setbID(String bID) {
        this.bID = bID;
    }

    public int gettQuatity() {
        return tQuatity;
    }

    public void settQuatity(int tQuatity) {
        this.tQuatity = tQuatity;
    }
    
    
}
