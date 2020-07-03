/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Struct;

import Controller.UserDB;
import com.opensymphony.xwork2.ActionContext;
import java.util.Map;


/**
 *
 * @author tran phu phat
 */
public class LoginAction {

    private String email;
    private String password;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LoginAction() {
    }

    public String execute() throws Exception {
        try{
        UserDB uDB = new UserDB();
        String result = uDB.LogIn("a", "b");
        String URL = FAIL;
        if (result!=null) {
            Map session = ActionContext.getContext().getSession();
            session.put("ID", result);
            URL = SUCCESS;
        }
        return URL;
        }catch(Exception e){
        return FAIL;
        }
    }

}
