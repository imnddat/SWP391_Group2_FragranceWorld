/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Cart;
import Model.Item;
import Model.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBConnection {
    public int createOrder(Order order, Cart cart, String payment) {
        /*
        Order status:
        unpaid: sau khi chọn thanh toán bằng vnpay nhưng chưa thanh toán thành công (có thể vào "view my order" để thanh toán)
        paid: thanh toán vnpay thành công nhưng vẫn cần phải duyệt (không cần phải chuyển sang pending)
        pending: đang duyệt đơn hàng (cho lựa chọn trả tiền khi nhận hàng và chuyển khoản)
        delivering: hàng đang chuyển phát
        completed: đơn đã hoàn thành (đã chuyển, đã thanh toán)
        */
        int orderId = 0;
        String query = "INSERT INTO [dbo].[Order] ([orderDate],[totalPrice],[status],[address],[paymentMedthod],[userID],[DeliverID],[discountID],[reciverName],[phone],[email],[note]) "
                + "VALUES (?,?,?,?,?,?,NULL,NULL,?,?,?,?) "
                + "SELECT SCOPE_IDENTITY() AS ID;";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, getToday().toString());
            preparedStatement.setString(2, Double.toString(order.getTotalPrice()));
            if(payment.equalsIgnoreCase("VN Pay")){
                preparedStatement.setString(3, "unpaid");
            }else{
                preparedStatement.setString(3, "pending");
            }
            preparedStatement.setString(4, order.getAddress());
            preparedStatement.setString(5, payment);
            preparedStatement.setString(6, Integer.toString(order.getUserId()));
            preparedStatement.setString(7, order.getReciverName());
            preparedStatement.setString(8, order.getPhone());
            preparedStatement.setString(9, order.getEmail());
            preparedStatement.setString(10, order.getNote());
            preparedStatement.executeUpdate();
            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
                //System.out.println("New: " + orderId);
                createOrderDetail(cart, orderId);
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }
        } catch (Exception e) {
            System.err.println("In create order: " + e.toString());
        }
        return orderId;
    }

    public void createOrderDetail(Cart cart, int orderId) {
  
        for (Item i : cart.getItemList()) {
            String query = "INSERT INTO [dbo].[OrderDetails] ([quantity],[productID],[orderID],[volume],[price]) VALUES (?,?,?,?,?)";
            //System.out.println("1:"+i.toString());
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, Integer.toString(i.getQuantity()));
                preparedStatement.setString(2, Integer.toString(i.getProduct().getId()));
                preparedStatement.setString(3, Integer.toString(orderId));
                preparedStatement.setString(4, i.getVolume());
                preparedStatement.setString(5, Double.toString(i.getTotal()));
                preparedStatement.executeUpdate();
                decreaseProductStock(i.getProduct().getId(), i.getVolume());
            } catch (Exception e) {
                System.err.println("Error In create order detail: " + e.toString());
            }
        }
    }
    
    private void decreaseProductStock(int productId, String capacity){
        String query = "UPDATE [dbo].[Volume] SET stock = stock - 1 WHERE productID = ? AND capacity = ?;";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, Integer.toString(productId));
                preparedStatement.setString(2, capacity);
                preparedStatement.executeUpdate();
            } catch (Exception e) {
                System.err.println("Error in decreaseProductStock: \n" + e.toString());
            }
    }
    
    public void orderStatusPaid(int orderId){
        String query = "UPDATE [dbo].[Order] SET [status] = 'paid' WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, Integer.toString(orderId));
                preparedStatement.executeUpdate();
            } catch (Exception e) {
                System.err.println("Error in orderStatusPaid: \n" + e.toString());
            }
    }

    LocalDate getToday() {
        LocalDate today = LocalDate.now(); //toString: yyyy-mm-dd
        return today;
    }
    
}
