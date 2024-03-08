/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Volume;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thinkpad
 */
public class VolumeDAO extends DBConnection {

    public Vector<Volume> getAll() throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Volume> volume = new Vector<>();
        String sql = "select * from [Volume]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String capacity = rs.getString("capacity");
                int productID = rs.getInt("productID");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                int sold = rs.getInt("sold");

                volume.add(new Volume(id, capacity, productID, price, stock, sold));
            }
            return volume;

        } catch (SQLException ex) {
            Logger.getLogger(VolumeDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                closeResultSet(rs);
                closePreparedStatement(stm);
                closeConnection(connection);

            } catch (SQLException ex) {
                Logger.getLogger(VolumeDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public Vector<Volume> filterByPrice(String filter, Vector<Volume> volumes) {
        Vector<Volume> VolumeAfterFilter = new Vector<>();

        switch (filter) {
            case "price-500-750":
                VolumeAfterFilter = filterPrice(500, 750, volumes);
                break;
            case "price-750-1000":
                VolumeAfterFilter = filterPrice(750, 1000, volumes);
                break;
            case "price-1000-1500":
                VolumeAfterFilter = filterPrice(1000, 1500, volumes);
                break;
            case "price-1500up":
                VolumeAfterFilter = filterPrice(1500, Double.MAX_VALUE, volumes);
                break;
            default:
                return volumes;
        }

        return VolumeAfterFilter;
    }

    private Vector<Volume> filterPrice(double min, double max, Vector<Volume> volumes) {
        Vector<Volume> VolumeAfterFilter = new Vector<>();

        for (Volume volume1 : volumes) {
            if (volume1.getPrice() < max && volume1.getPrice() > min) {
                VolumeAfterFilter.add(volume1);
            }
        }
        return VolumeAfterFilter;
    }

    public Volume getVolumeByPidAndCap(String id, String capacity) {
        try {

            String sql = "SELECT * FROM Volume WHERE productID = 1 and capacity = '30'";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                int idd = rs.getInt("id");
                String capacityy = rs.getString("capacity");
                int productID = rs.getInt("productID");
                double price = rs.getDouble("price");
                int stock = rs.getInt("stock");
                int sold = rs.getInt("sold");

                Volume v = new Volume(idd, capacityy, productID, price, stock, sold);
                return v;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
