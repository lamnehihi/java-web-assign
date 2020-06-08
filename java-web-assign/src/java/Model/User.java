/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ASUS
 */
public class User {
    private String uID;
    private String uEmail;
    private String uPassword;
    private String uName;
    private String uPhone;
    private String uAddress;

    public User() {
    }

    public User(String uID, String uEmail, String uPassword, String uName, String uPhone, String uAddress) {
        this.uID = uID;
        this.uEmail = uEmail;
        this.uPassword = uPassword;
        this.uName = uName;
        this.uPhone = uPhone;
        this.uAddress = uAddress;
    }

    public String getuID() {
        return uID;
    }

    public void setuID(String uID) {
        this.uID = uID;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }

    public String getuAddress() {
        return uAddress;
    }

    public void setuAddress(String uAddress) {
        this.uAddress = uAddress;
    }

    @Override
    public String toString() {
        return "User{" + "uID=" + uID + ", uEmail=" + uEmail + ", uPassword=" + uPassword + ", uName=" + uName + ", uPhone=" + uPhone + ", uAddress=" + uAddress + '}';
    }
    
}
