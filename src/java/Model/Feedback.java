/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Thinkpad
 */
public class Feedback {
    private int id;
    private String content;
    private Date feedbackDate;
    private int star;
    private int userID;
    private int orderID;
    private int productID;
    private String ing;

    public Feedback() {
    }

    public Feedback(int id, String content, Date feedbackDate, int star, int userID, int orderID, int productID, String ing) {
        this.id = id;
        this.content = content;
        this.feedbackDate = feedbackDate;
        this.star = star;
        this.userID = userID;
        this.orderID = orderID;
        this.productID = productID;
        this.ing = ing;
    }

    public Feedback(String content, Date feedbackDate, int star, int userID, int orderID, int productID, String ing) {
        this.content = content;
        this.feedbackDate = feedbackDate;
        this.star = star;
        this.userID = userID;
        this.orderID = orderID;
        this.productID = productID;
        this.ing = ing;
    }
     

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(Date feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getIng() {
        return ing;
    }

    public void setIng(String ing) {
        this.ing = ing;
    }

   
    
    
}
