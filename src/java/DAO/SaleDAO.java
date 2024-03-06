/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;


import Model.Sale;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thinkpad
 */
public class SaleDAO extends DBConnection{
      public ArrayList<Sale> getAll() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Sale> sale = new ArrayList<>();
        String sql = "select * from [Sale]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int sid = rs.getInt("sid");
                int productID = rs.getInt("productID");
                int discount = rs.getInt("discount");
                String content = rs.getString("content");
                sale.add(new Sale(sid, productID, discount, content));
            }
            return sale;
            
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                rs.close();
                connection.close();
                
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
}
