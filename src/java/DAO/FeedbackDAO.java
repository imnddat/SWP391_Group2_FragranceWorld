/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import Model.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Thinkpad
 */
public class FeedbackDAO  extends DBConnection  {
     Connection con = getConnection();

    public void addReview(Feedback feedback) {
        String sql = "INSERT INTO Feedback (content, feedbackDate, star, userID, orderID, productID, img) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, feedback.getContent());
            ps.setDate(2, feedback.getFeedbackDate());
            ps.setInt(3, feedback.getStar());
            ps.setInt(4, feedback.getUserID());
            ps.setInt(5, feedback.getOrderID());
            ps.setInt(6, feedback.getProductID());
            ps.setString(7, feedback.getIng());

            ps.executeUpdate();
            ps.close(); // Close PreparedStatement after execution
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public int getCountOfReview(int productId) {
        String sql = "SELECT COUNT(*) FROM FeedBack WHERE productID = ?";
        try ( PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            // Log the error or handle it appropriately
            System.err.println("Error at read review: " + e.getMessage());
        }
        return 0;
    }
    
    public List<Feedback> getAllReviewsById(int id) {
    List<Feedback> lr = new ArrayList<>();
    String sql = "SELECT TOP 3 [id], [content], [feedbackDate], [star], [userID], [orderID], [productID], [img] " +
                 "FROM Feedback WHERE id = ? ORDER BY id DESC";
    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, id);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                lr.add(new Feedback(
                        rs.getInt("id"),
                        rs.getString("content"),
                        rs.getDate("feedbackDate"),
                        rs.getInt("star"),
                        rs.getInt("userID"),
                        rs.getInt("orderID"),
                        rs.getInt("productID"),
                        rs.getString("img")
                ));
            }
        }
    } catch (SQLException e) {
        Logger.getLogger(ProductDAO.class
                .getName()).log(Level.SEVERE, null, e);
    }
    return lr;
}

}
