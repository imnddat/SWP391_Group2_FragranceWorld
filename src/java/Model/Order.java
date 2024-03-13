/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class Order {
    int id;
    String orderDate;
    double totalPrice;
    String status;
    String address;
    String paymentMedthod;
    int userId,deliverId,discountId;
    String reciverName, phone, email, note;

    public Order() {
    }

    public Order(String address, String paymentMedthod) {
        this.address = address;
        this.paymentMedthod = paymentMedthod;
    }

    public Order(int userId, double totalPrice, String address, String reciverName, String phone, String email, String note) {
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.address = address;
        this.reciverName = reciverName;
        this.phone = phone;
        this.email = email;
        this.note = note;
    }
    

    public Order(int id, String orderDate, double totalPrice, String status, String address, String paymentMedthod) {
        this.id = id;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.status = status;
        this.address = address;
        this.paymentMedthod = paymentMedthod;
    }

    public Order(int id, String orderDate, double totalPrice, String status, String address, String paymentMedthod, int userId, int deliverId, int discountId, String reciverName, String phone, String email, String note) {
        this.id = id;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.status = status;
        this.address = address;
        this.paymentMedthod = paymentMedthod;
        this.userId = userId;
        this.deliverId = deliverId;
        this.discountId = discountId;
        this.reciverName = reciverName;
        this.phone = phone;
        this.email = email;
        this.note = note;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPaymentMedthod() {
        return paymentMedthod;
    }

    public void setPaymentMedthod(String paymentMedthod) {
        this.paymentMedthod = paymentMedthod;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getDeliverId() {
        return deliverId;
    }

    public void setDeliverId(int deliverId) {
        this.deliverId = deliverId;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public String getReciverName() {
        return reciverName;
    }

    public void setReciverName(String reciverName) {
        this.reciverName = reciverName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
    
}
