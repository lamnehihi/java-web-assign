/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.BookDB;

/**
 *
 * @author tran phu phat
 */
public class Order {

    private Book book;
    private int tQuatity;

    public Order(String bID, int tQuatity) {
        this.book = BookDB.getById(bID);
        this.tQuatity = tQuatity;
    }

    public Order() {
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int gettQuatity() {
        return tQuatity;
    }

    public void settQuatity(int tQuatity) {
        this.tQuatity = tQuatity;
    }

    @Override
    public String toString() {
        return "Order{" + "bID=" + book + ", tQuatity=" + tQuatity + '}';
    }

}
