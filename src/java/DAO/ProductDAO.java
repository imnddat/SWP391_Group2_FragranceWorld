/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Gender;
import Model.Brand;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Comparator;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Product;
import Model.Sale;
import Model.SaleEvent;
import Model.Volume;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thinkpad
 */
public class ProductDAO extends DBConnection {

    public Vector<Product> getAll() throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = " select * from [Products] ";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                closeResultSet(rs);
                closePreparedStatement(stm);
                closeConnection(connection);

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    //--------------------PRODUCT  VIEW -------------------------------------------
    //phan trang cua productview
    public ArrayList<Product> getALLProduct() throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Product> products = new ArrayList<>();

        String sql = " select p.id,p.description,p.genderID, p.nameProduct,p.codeProduct, \n"
                + " p.discount,p.scent ,p.brandID,p.defaultImg,v.price, b.makebyFrom, v.capacity \n"
                + " from Volume v \n"
                + " join Products p on v.productID = p.id \n"
                + " join Brand b on b.id = p.brandID \n"
                + " join Gender g on p.genderID = g.id ";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {

                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);
                Gender gender = new Gender();
                gender.setGender(rs.getString("gender"));
                Brand brands = new Brand();
                brands.setName(rs.getString("name"));
                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, brands, gender, listV));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                closeResultSet(rs);
                closePreparedStatement(stm);
                closeConnection(connection);

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public ArrayList<Product> getListByPage(ArrayList<Product> list, int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;

    }

    //searchbyname
    public Vector<Product> getSearchName(String s) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "  select p.id,p.description,p.genderID, p.nameProduct,p.codeProduct, \n"
                + " p.discount,p.scent ,p.brandID,p.defaultImg,v.price, b.makebyFrom, v.capacity \n"
                + " from Volume v \n"
                + " join Products p on v.productID = p.id \n"
                + " join Brand b on b.id = p.brandID \n"
                + " join Gender g on p.genderID = g.id \n"
                + " where p.nameProduct like ? ";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + s + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);
                Gender gender = new Gender();
                gender.setGender(rs.getString("gender"));
                Brand brands = new Brand();
                brands.setName(rs.getString("name"));
                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, brands, gender, listV));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
//sortby

    public ArrayList<Product> getSearchListProductbySearch(String sortType) {

        if (sortType == null || sortType.isEmpty()) {
            sortType = "-1";// dang loi
        }
        String sortTypeString = "";
        switch (sortType) {
            case "1":
                sortTypeString = " order by p.nameProduct asc ";
                break;
            case "2":
                sortTypeString = " order by p.nameProduct desc ";
                break;
            case "3":
                sortTypeString = " order by v.price asc ";
                break;
            case "4":
                sortTypeString = " order by v.price desc ";
                break;
            default:

        }

        String sql = " select p.id,p.description,p.genderID, p.nameProduct,p.codeProduct,\n"
                + "p.discount,p.scent ,p.brandID,p.defaultImg,v.price, b.makebyFrom, v.capacity\n"
                + "from Volume v \n"
                + " join Products p on v.productID = p.id\n"
                + " join Brand b on b.id = p.brandID\n"
                + " join Gender g on p.genderID = g.id "
                + sortType;
        try {
            ArrayList<Product> list = new ArrayList<>();
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);
                Gender gender = new Gender();
                gender.setGender(rs.getString("gender"));
                Brand brands = new Brand();
                brands.setName(rs.getString("name"));

                list.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, brands, gender, listV));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }
    //Checkbox Brand

    public ArrayList<Product> checkBoxBrand(int[] id) {

        String sql = " select p.id,p.description,p.genderID, p.nameProduct,p.codeProduct, \n"
                + " p.discount,p.scent ,p.brandID,p.defaultImg,v.price, b.makebyFrom, v.capacity \n"
                + " from Volume v \n"
                + " join Products p on v.productID = p.id \n"
                + " join Brand b on b.id = p.brandID \n"
                + " join Gender g on p.genderID = g.id \n"
                + " where 1=1 ";
        if (id != null) {
            sql += " and p.brandID in ( ";
            for (int i = 0; i < id.length; i++) {
                sql += id[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
                sql += " ) ";
            }
        }
        try {
            ArrayList<Product> list = new ArrayList<>();
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setDescription(rs.getString("description"));
                p.setGenderID(rs.getInt("genderID"));
                p.setNameProduct(rs.getString("nameProduct"));
                p.setCodeProduct(rs.getString("codeProduct"));
                p.setDiscount(rs.getInt("discount"));
                p.setScent(rs.getString("scent"));
                p.setBrandID(rs.getInt("brandID"));
                p.setDefaultImg(rs.getString("defaultImg"));
                Brand brands = new Brand();
                p.setBrands(brands);
                Gender gender = new Gender();
                p.setGenders(gender);
                list.add(p);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }

    //Checkbox Price
    public Vector<Volume> filterByPrice(String filter, Vector<Volume> products) {
        Vector<Volume> VolumeAfterFilter = new Vector<>();
        double minP = 0;
        double maxP = 99999;
        switch (filter) {
            case "price-10-100":
                VolumeAfterFilter = filterPrice(500, 750, products);
                minP = 10;
                maxP = 100;
                // set lại min vag max
                break;
            case "price-100-250":
                VolumeAfterFilter = filterPrice(750, 1000, products);
                break;
            case "price-250-500":
                VolumeAfterFilter = filterPrice(1000, 1500, products);
                break;
            case "price-500up":
                VolumeAfterFilter = filterPrice(1500, Double.MAX_VALUE, products);
                break;
            default:
                return products;
        }
        //gọi hàm

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

//    public static void main(String[] args) {
//        ProductDAO dao = new ProductDAO();
//        int[] a = {1, 2, 3};
//        double minP = 0;
//        double maxP = 99999;
//        String filter = "price-100-250";
//        switch (filter) {
//            case "price-10-100":
//                minP = 10;
//                maxP = 100;
//                // set lại min vag max
//                break;
//            case "price-100-250":
//                minP = 100;
//                maxP = 250;
//                break;
//            case "price-250-500":
//                minP = 250;
//                maxP = 500;
//                break;
//            case "price-500up":
//
//                minP = 500;
//                maxP = 99999;
//                break;
//            default:
//                minP = 0;
//                maxP = 99999;
//                break;
//        }
//        System.out.println(
//                dao.getALLProductByGender("", "50", "", "", "", "3", a, "", minP, maxP).size());
//    }
    //--------------------------------PANNER---------------------------
    public ArrayList<Product> getALLProductByGender(String genderSearch, String volumeSearchCapacity,
            String productSearchScent, String brandSortMakebyFrom, String brandSort, String sortType, int[] id, String keyword, double minP, double maxP) {
//        System.out.println("dã vào hàm");
        //ti?n xu li data
        if (sortType == null || sortType.isEmpty()) {
            sortType = "-1";
        }
        String sortTypeString = " order by p.nameProduct asc";
        switch (sortType) {
            case "1":
                sortTypeString = " order by p.nameProduct asc ";
                break;
            case "2":
                sortTypeString = " order by p.nameProduct desc ";
                break;
            case "3":
                sortTypeString = " order by vp.price asc ";
                break;
            case "4":
                sortTypeString = " order by vp.price desc ";
                break;
            default:
        }
        if (volumeSearchCapacity == null || volumeSearchCapacity == "") {
            volumeSearchCapacity = "30";
        }

        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Product> products = new ArrayList<>();

        String sql = "select * from Products p \n"
                + "  join Brand b on p.brandID = b.id "
                + "join Gender g on p.genderID = g.id \n"
                + "  join (select * from  Volume  where capacity = " + volumeSearchCapacity + "  ) vp on p.id = vp.[productID] \n"
                + "  where p.genderID like  '%" + genderSearch + "%' "
                + "  and b.makebyFrom like  '%" + brandSortMakebyFrom + "%' "
                + "  and p.scent like  '%" + productSearchScent + "%' "
                + "  and  b.name like  '%" + brandSort + "%' "
                + "  and p.[nameProduct] like '%" + keyword + "%' "
                + "      \n";
        if (id != null) {
            sql += " and p.brandID in ( ";
            for (int i = 0; i < id.length; i++) {
                sql += id[i] + ",";
            }
            if (sql.endsWith(",")) {
                sql = sql.substring(0, sql.length() - 1);
                sql += " ) ";
            }
        }
        sql += "  and p.id in (select v.[productID] from Volume v where v.[capacity] like '%" + volumeSearchCapacity + "%' and v.price between " + minP + " and " + maxP + " ) " + sortTypeString;
        // + order by
        System.out.println(sql);

        try {
            //set biến
            stm = connection.prepareStatement(sql);

            rs = stm.executeQuery();
            while (rs.next()) {

                int pid = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(pid);
                Gender gender = new Gender();
                gender.setGender(rs.getString("gender"));
                Brand brands = new Brand();
                brands.setName(rs.getString("name"));
                products.add(new Product(pid, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, brands, gender, listV));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

//--------------------------------------------------------------
//------------------------------------SEARCH-------------------------
//search by name
    public Vector<Product> getProductsByKeywords(String s) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "  select p.id,p.description,p.genderID, p.nameProduct,p.codeProduct,\n"
                + "p.discount,p.scent ,p.brandID,p.defaultImg,v.price\n"
                + "  from Products p\n"
                + " inner join Volume v on p.id = v.productID\n"
                + " where [nameProduct] like ?  ";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + s + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

//hot trend
    public Vector<Product> getProductBySold(String keywords) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = " SELECT top(10) p.id,p.description,p.genderID, p.nameProduct,p.codeProduct,\n"
                + "p.discount,p.scent ,p.brandID,p.defaultImg, pr.price\n"
                + "FROM Products p\n"
                + "left JOIN Volume pr ON p.id = pr.productID where capacity = 30 \n"
                + "and p.nameProduct like ? \n"
                + "ORDER BY pr.sold DESC";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keywords + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");

                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, listV));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    // lay san pham vote nhieu nhat

    public Vector<Product> getProductByStar(String keywordd) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = " select top (10) p.id,p.description,p.genderID, p.nameProduct,p.codeProduct,\n"
                + "p.discount,p.scent ,p.brandID,p.defaultImg, v.price, pv.trungbinhsao\n"
                + " from Products p \n"
                + " join Volume v on p.id = v.productID\n"
                + " join (select [ProductId] , avg([star]) as trungbinhsao from [Feedback] group by [ProductId]) pv on p.id = pv.ProductId\n"
                + " where p.nameProduct like ? \n"
                + "order by pv.trungbinhsao desc ";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keywordd + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");

                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, listV));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    //lay san pham sale
    public Vector<Product> getProductBySale(String keyworddd) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = " select top(10) p.id,p.description,p.genderID, p.nameProduct,p.codeProduct,\n"
                + "p.discount,p.scent ,p.brandID,p.defaultImg, v.price, s.discount\n"
                + " from Volume v \n"
                + "join Products p on v.productID = p.id \n"
                + " join Sale s on p.id = s.productID \n"
                + " join SaleEvent sv on s.sid = sv.sid \n"
                + " where v.capacity = 30 and (s.sid in ( select sv.sid from SaleEvent \n"
                + "  where sv.startdate <= CONVERT(date, GETDATE()) and sv.enddate >= CONVERT(date, GETDATE()) \n"
                + ") )\n"
                + "and p.nameProduct like ? \n"
                + "order by s.discount desc ";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyworddd + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");

                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);
                Sale listS = getSaleByProductId(id);
                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, listV, listS));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    //-----------------------BEST SELLER---------------------
//lay gia tri volumes cho homepage
    public Vector<Product> getProductMaxPrice() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "SELECT top(10) *\n"
                + " FROM Products p\n"
                + " left JOIN Volume pr ON p.id = pr.productID where capacity = 30\n"
                + " ORDER BY pr.price DESC";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");

                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, listV));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    ////------------------------------HOSTSALE---------------------------------
    //hotsale.jsp
    public Vector<Product> getProductHotSaleTopGirl() throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "SELECT top(3) * FROM Products p\n"
                + "left JOIN Volume pr ON p.id = pr.productID\n"
                + "join Gender g on p.genderID = g.id\n"
                + "where capacity = 30 and g.id =2\n"
                + "ORDER BY pr.price DESC";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);
                Gender gender = getGenderByProductId(id);
                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, gender, listV));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                closeResultSet(rs);
                closePreparedStatement(stm);
                closeConnection(connection);

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public Vector<Product> getProductHotSaleTopBoy() throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "SELECT top(3) * FROM Products p\n"
                + "left JOIN Volume pr ON p.id = pr.productID \n"
                + "join Gender g on p.genderID = g.id \n"
                + "where capacity = 30 and g.id = 1 \n"
                + "ORDER BY pr.price DESC";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);
                Gender gender = getGenderByProductId(id);
                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, gender, listV));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                closeResultSet(rs);
                closePreparedStatement(stm);
                closeConnection(connection);

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public Vector<Product> getProductHotSale1() throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "SELECT top(3) * FROM Products p\n"
                + "left JOIN Volume pr ON p.id = pr.productID where capacity = 30\n"
                + "ORDER BY pr.price DESC";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, listV));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                closeResultSet(rs);
                closePreparedStatement(stm);
                closeConnection(connection);

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public Vector<Product> getProductHotSale2() throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Vector<Product> products = new Vector<>();
        String sql = "SELECT top(3) * FROM Products p\n"
                + "left JOIN Volume pr ON p.id = pr.productID where capacity = 30\n"
                + "ORDER BY pr.price DESC";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");
                ArrayList<Volume> listV = getVolumesByProductId(id);

                products.add(new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg, listV));
            }
            return products;

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            try {
                closeResultSet(rs);
                closePreparedStatement(stm);
                closeConnection(connection);

            } catch (SQLException ex) {
                Logger.getLogger(ProductDAO.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    //-------------------------------------
    //--------------------LAY ID CHO TUNG HANG----------------------------
    //lay gia tri volumes cho homepage
    public ArrayList<Volume> getVolumesByProductId(int pid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Volume> volume = new ArrayList<>();
        String sql = "select * from [Volume] where productID=" + pid;
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
        }
        return null;

    }

    //lay ra cac loai brand 
    public Brand getBrandByProductId(int pid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Brand brand = null;
        String sql = "select * from Products where brandID =" + pid;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String makebyFrom = rs.getString("makebyFrom");
                brand = new Brand(id, name, makebyFrom);
            }
            return brand;
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    //lay ra cac loai gender

    public Gender getGenderByProductId(int gid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Gender gender = null;
        String sql = "select * from Products where genderID = " + gid;
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String genders = rs.getString("gender");

                gender = new Gender(id, genders);
            }
            return gender;

        } catch (SQLException ex) {
            Logger.getLogger(GenderDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    } 
 
    public Sale getSaleByProductId(int saleid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
       Sale sale = null;
        String sql = " select * from Sale where productID = ? " ;
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, saleid);
            rs = stm.executeQuery();
            while (rs.next()) {
                int sid = rs.getInt("sid");
                int productID = rs.getInt("productID");
                int discount = rs.getInt("discount");
                String content = rs.getString("content");
            sale = new Sale(sid, productID, discount, content);
            }
            return sale;

        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
//    public static void main(String[] args) {
//            
//              ProductDAO saleDAO = new ProductDAO();
//
//            // Gọi phương thức getSaleByProductId với saleid cần tìm
//            int saleid = 2; // Thay thế số này bằng saleid thực tế của sản phẩm cần tìm
//           Sale  sale = saleDAO.getSaleByProductId(saleid);
//
//            // In thông tin của Sale
//            if (sale != null) {
//                System.out.println("Sale found:");
//                System.out.println("SID: " + sale.getSid());
//                System.out.println("Product ID: " + sale.getProductID());
//                System.out.println("Discount: " + sale.getDiscount());
//                System.out.println("Content: " + sale.getContent());
//            } else {
//                System.out.println("Sale not found for product ID: " + saleid);
//            }
//    }

    public double getProductBasePrice(int productId, String volume) {
        double price = 0.0;

        try {
            // Lấy ngày hiện tại
            LocalDate currentDate = LocalDate.now();

            // Truy vấn cơ sở dữ liệu để lấy giá sản phẩm dựa trên productId và volume
            String query = "SELECT price FROM Volume WHERE productID = ? AND capacity = ?";

            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, productId);
                preparedStatement.setString(2, volume);

                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        price = resultSet.getDouble("price");
                    }
                }
            }
        } catch (Exception e) {
            // System.out.println("Lỗi không lấy được giá sản phẩm");
        }

        return price;
    }

    public double getProductPrice(int productId, String volume) {
        double price = getProductBasePrice(productId, volume);

        try {
            // Lấy ngày hiện tại
            LocalDate currentDate = LocalDate.now();

            // Truy vấn cơ sở dữ liệu để lấy giá sản phẩm dựa trên productId và volume
            String query = "SELECT v.price, s.discount, se.startdate, se.enddate "
                    + "FROM Volume v "
                    + "LEFT JOIN sale s ON v.productID = s.productID "
                    + "LEFT JOIN saleEvent se ON s.sid = se.sid "
                    + "WHERE v.productID = ? AND v.capacity = ? AND (se.startdate IS NULL OR se.startdate <= ?) AND (se.enddate IS NULL OR se.enddate >= ?)";

            try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setInt(1, productId);
                preparedStatement.setString(2, volume);
                preparedStatement.setDate(3, java.sql.Date.valueOf(currentDate));
                preparedStatement.setDate(4, java.sql.Date.valueOf(currentDate));

                try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        double basePrice = resultSet.getDouble("price");
                        Integer discount = (Integer) resultSet.getObject("discount");

                        // Kiểm tra nếu có sự kiện giảm giá và ngày nằm trong khoảng startdate và enddate
                        if (discount == null) {
                            price = basePrice;
                        } else {
                            price = basePrice - (basePrice * (discount / 100));
                        }
                    }
                }
            }
        } catch (Exception e) {
            //System.out.println("lỗi không lấy được giá sản phẩm");
        }

        return price;
    }

    public Product getProductsById(int productId) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product product = null;
        String sql = "select * from [Products] where id = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String description = rs.getString("description");
                int genderID = rs.getInt("genderID");
                String nameProduct = rs.getString("nameProduct");
                String codeProduct = rs.getString("codeProduct");
                int discount = rs.getInt("discount");
                String scent = rs.getString("scent");
                int brandID = rs.getInt("brandID");
                String defaultImg = rs.getString("defaultImg");

                product = new Product(id, description, genderID, nameProduct, codeProduct, discount, scent, brandID, defaultImg);
            }
            return product;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // ------------------- Quang Anh Viet______-------
    public Product getProductById(String id) {
        try {

            String sql = "SELECT * FROM Products WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getInt(8), rs.getString(9));
                return p;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
