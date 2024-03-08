/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Brand;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Thinkpad
 */
public class BrandDAO extends DBConnection {

    public ArrayList<Brand> getAll() throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Brand> brands = new ArrayList<>();
        String sql = "select * from [Brand]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String makebyFrom = rs.getString("makebyFrom");
                
                brands.add(new Brand(id, name, makebyFrom));
            }
            return brands;
            
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                closeResultSet(rs);
                closePreparedStatement(stm);
                closeConnection(connection);
                
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
    
    public Brand getBrandById(int id) throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Brand brand = null;
        String sql = "select * from [Brand] where id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                brand.setId(rs.getInt("id"));
                brand.setName(rs.getString("name"));
                brand.setMakebtFrom(rs.getString("makebyFrom"));
            }
            return brand;
            
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                closeResultSet(rs);
                closePreparedStatement(stm);
                closeConnection(connection);
                
            } catch (SQLException ex) {
                Logger.getLogger(BrandDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
    
    public  ArrayList<Brand> getSoldVolumeByBrand(){
        
        return null;
    
    }
    
     public Vector<Brand> filterByBrand(String filter, Vector<Brand> brands) {
        Vector<Brand> BrandAfterFilter = new Vector<>();

        if (filter.equals("brand-all")) {
            return brands;
        }
        String[] filterSplits = filter.split("[-]");
        int brandId = Integer.parseInt(filterSplits[1]);
        BrandAfterFilter = filterBrand(brandId, brands);

        return BrandAfterFilter;
    }
     
    private Vector<Brand> filterBrand(int id, Vector<Brand> brands) {

        Vector<Brand> BrandAfterFilter = new Vector<>();
        for (Brand brand : brands) {
              if (brand.getId()== id) {
                BrandAfterFilter.add(brand);
            }
        }
 
        return BrandAfterFilter;
    }
}
