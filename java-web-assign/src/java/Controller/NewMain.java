/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Transaction;
import static java.lang.System.out;
import java.util.ArrayList;

/**
 *
 * @author tran phu phat
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        ArrayList<Transaction> ls = TransactionDB.getByStatus(false);
                for (Transaction l : ls) {
                    String product = l.getCart().get(0).getBook().getbName();
                    if (l.getCart().size() > 1) {
                        product += "   and " + (l.getCart().size() - 1) + " others";
                    }
                    out.print("<tr>" + "<td>" + l.gettID() + "</td>" + "<td>" + l.gettDate() + "</td>" + "<td>" + product + "</td>" + "<td>" + l.getTotal() + "</td>" + "<td>" + l.isStatus() + "</td>" + "</tr>");
                }
    }
    
}
