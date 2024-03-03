/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Cart;
import Model.Item;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBConnection {
    public void createOrder(String address, Cart cart) {
        float totalPrice = 0;
        int orderId;

        String query = "INSERT INTO [dbo].[Order] ([orderDate],[totalPrice],[status],[address],[paymentMedthod],[userID],[DeliverID],[discountID]) "
                + "VALUES (?,?,?,?,NULL,NULL,NULL,NULL) "
                + "SELECT SCOPE_IDENTITY() AS ID;";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, getToday().toString());
            preparedStatement.setString(2, Float.toString(totalPrice));
            preparedStatement.setString(3, "pending overview");
            preparedStatement.setString(4, address);
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
    }

    public void createOrderDetail(Cart cart, int orderId) {
  
        for (Item i : cart.getItemList()) {
            String query = "INSERT INTO [dbo].[OrderDetails] ([quantity],[productID],[orderID]) VALUES (?,?,?)";
            //System.out.println("1:"+i.toString());
            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, Integer.toString(i.getQuantity()));
                preparedStatement.setString(2, Integer.toString(i.getProduct().getId()));
                preparedStatement.setString(3, Integer.toString(orderId));
                preparedStatement.executeUpdate();
            } catch (Exception e) {
                System.err.println("In create order detail: " + e.toString());
            }
        }
    }

    LocalDate getToday() {
        LocalDate today = LocalDate.now(); //toString: yyyy-mm-dd
        return today;
    }
}
