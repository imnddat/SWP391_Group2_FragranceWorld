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

    public Order() {
    }

    public Order(String address, String paymentMedthod) {
        this.address = address;
        this.paymentMedthod = paymentMedthod;
    }

    public Order(int id, String orderDate, double totalPrice, String status, String address, String paymentMedthod) {
        this.id = id;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.status = status;
        this.address = address;
        this.paymentMedthod = paymentMedthod;
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
    
    
}
