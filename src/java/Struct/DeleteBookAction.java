/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Struct;

import Controller.BookDBAdmin;
import Model.Book;
import com.opensymphony.xwork2.ActionContext;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class DeleteBookAction {

    private String id;

    private final String SUCCESS = "success";
    private final String FAIL = "fail";

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public DeleteBookAction() {
    }

    public String execute() throws Exception {
        try {
            String result = this.id;
            System.out.println("params" + result);
            String URL = FAIL;
            return URL;
        } catch (Exception e) {
            return FAIL;
        }
    }

}
