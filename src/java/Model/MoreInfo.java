/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thinkpad
 */
public class MoreInfo {
    private int id;
    private String phone;
    private String addressnew;
    private String deffault;
    private int UserID;

    public MoreInfo() {
    }

    public MoreInfo(int id, String phone, String addressnew, String deffault, int UserID) {
        this.id = id;
        this.phone = phone;
        this.addressnew = addressnew;
        this.deffault = deffault;
        this.UserID = UserID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddressnew() {
        return addressnew;
    }

    public void setAddressnew(String addressnew) {
        this.addressnew = addressnew;
    }

    public String getDeffault() {
        return deffault;
    }

    public void setDeffault(String deffault) {
        this.deffault = deffault;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }
    
}
