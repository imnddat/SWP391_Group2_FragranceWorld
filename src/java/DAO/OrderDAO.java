/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Cart;
import Model.Item;
import Model.Order;
import Model.OrderDetails;
import Model.OrderWithItems;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import ultil.DateUltil;

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
        DateUltil du = new DateUltil();
        String query = "INSERT INTO [dbo].[Order] ([orderDate],[totalPrice],[status],[address],[paymentMedthod],[userID],[DeliverID],[discountID],[reciverName],[phone],[email],[note]) "
                + "VALUES (?,?,?,?,?,?,NULL,NULL,?,?,?,?) "
                + "SELECT SCOPE_IDENTITY() AS ID;";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, du.getToday().toString());
            preparedStatement.setString(2, Double.toString(order.getTotalPrice()));
            if (payment.equalsIgnoreCase("VN Pay")) {
                preparedStatement.setString(3, "unpaid");
            } else {
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
            System.err.println("Error In OrderDAO:create order: " + e.toString());
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
                //decreaseProductStock(i.getProduct().getId(), i.getVolume(), i.getQuantity());
            } catch (Exception e) {
                System.err.println("Error In OrderDAO:create order detail: " + e.toString());
            }
        }
    }

    private void decreaseProductStock(int productId, String capacity, int quantity) {
        String query = "UPDATE [dbo].[Volume] SET stock = stock - ? WHERE productID = ? AND capacity = ?;";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, Integer.toString(quantity));
            preparedStatement.setString(2, Integer.toString(productId));
            preparedStatement.setString(3, capacity);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error in OrderDAO:decreaseProductStock: \n" + e.toString());
        }
    }

    public void orderStatusPaid(int orderId) {
        String query = "UPDATE [dbo].[Order] SET [status] = 'paid' WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, Integer.toString(orderId));
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error in OrderDAO:orderStatusPaid: \n" + e.toString());
        }
    }

    public List getOrdersWithOffset(int userId, int pageOffset, int itemPerPage) {
        
        int offset = (pageOffset - 1) * 5;
        List<OrderWithItems> list = new ArrayList<>();
        ResultSet rs;
        String query = "SELECT *  FROM [Order] WHERE userid = ?  ORDER BY orderDate DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, Integer.toString(userId));
            preparedStatement.setInt(2, offset);
            preparedStatement.setInt(3, itemPerPage);
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                List orderDetailList = getOrderDetail(rs.getInt("id"));;
                DateUltil du = new DateUltil();
                double total = rs.getFloat("totalPrice");
                String status = rs.getString("status");
                String address = rs.getString("address");
                String paymentMedthod = rs.getString("paymentMedthod");
                list.add(new OrderWithItems(orderDetailList, rs.getInt("id"), du.dateDDMMYYYY(rs.getDate("orderDate")), total, status, address, paymentMedthod, userId, 0, 0, rs.getString("reciverName"), rs.getString("phone"), rs.getString("email"), rs.getString("note")));
            }
        } catch (Exception e) {
            System.err.println("Error in OrderDAO:getOrdersWithOffset: \n" + e.toString());
        }
        return list;
    }
    
    public OrderWithItems getOrder(int orderId){
        ResultSet rs;
        OrderWithItems owi = null;
        String query = "SELECT * FROM [dbo].[Order] Where id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, Integer.toString(orderId));
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                List orderDetailList = getOrderDetail(rs.getInt("id"));
                DateUltil du = new DateUltil();
                double total = rs.getFloat("totalPrice");
                String status = rs.getString("status");
                String address = rs.getString("address");
                String paymentMedthod = rs.getString("paymentMedthod");
                owi = new OrderWithItems(orderDetailList, rs.getInt("id"), du.dateDDMMYYYY(rs.getDate("orderDate")), total, status, address, paymentMedthod, 0, 0, 0, rs.getString("reciverName"), rs.getString("phone"), rs.getString("email"), rs.getString("note"));
            }
        } catch (Exception e) {
            System.err.println("Error in OrderDAO:getOrdersWithOffset: \n" + e.toString());
        }
        return owi;
    }

    private List getOrderDetail(int orderId) {
        List<OrderDetails> list = new ArrayList<>();
        ResultSet rs;
        String query = "SELECT OD.*, P.nameProduct as [name], P.defaultImg as img FROM [dbo].[OrderDetails] OD INNER JOIN [dbo].[Products] P ON OD.productID = P.id WHERE OD.orderID = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, Integer.toString(orderId));
            rs = preparedStatement.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetails(rs.getInt("quantity"), rs.getInt("productID"), rs.getInt("orderID"), rs.getString("volume"), rs.getInt("price"), rs.getString("name"), rs.getString("img")));
            }
        } catch (Exception e) {
            System.err.println("Error in OrderDAO:getOrderDetail: \n" + e.toString());
        }
        return list;
    }
    
    public int getNumberPages(int itemsPerPage, int userId){
        int page = 0;
        String query = "SELECT COUNT(*) AS TotalOrders FROM [Order] WHERE userid = ?;";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, Integer.toString(userId));
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            page = rs.getInt("TotalOrders"); 
        } catch (Exception e) {
            System.err.println("Error in OrderDAO:getNumberPages: \n" + e.toString());
        }
        page = getTotalPage(page,itemsPerPage);
        return page;
    }

    public int getTotalPage(int item,int itemsPerPage){
        int page;
        if((item %5) == 0)
            page = item / itemsPerPage;
        else
            page = item / itemsPerPage + 1;
        return page;
    }
    
    public void cancelOrder(int orderId){
        String query = "UPDATE [dbo].[Order] SET [status] = 'cancel' WHERE id = ?;";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, Integer.toString(orderId));
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.err.println("Error in OrderDAO:cancelOrder: \n" + e.toString());
        }
    }
    public static void main(String[] args) {
    }
}
