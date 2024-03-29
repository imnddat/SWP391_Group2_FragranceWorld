/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderWithItems extends Order{
    List<OrderDetails> orderDetailList;

    public OrderWithItems(List<OrderDetails> orderDetailList, int id, String orderDate, double totalPrice, String status, String address, String paymentMedthod, int userId, int deliverId, int discountId, String reciverName, String phone, String email, String note) {
        super(id, orderDate, totalPrice, status, address, paymentMedthod, userId, deliverId, discountId, reciverName, phone, email, note);
        this.orderDetailList = orderDetailList;
    }

    public List<OrderDetails> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetails> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

}
