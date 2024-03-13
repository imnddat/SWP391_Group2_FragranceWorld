/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thinkpad
 */
public class Product {
    
    private int id;
    /*Product ID*/
    private String description;
    private int genderID;
    private String nameProduct;
    private String codeProduct;
    private int discount;
    private String scent;
    private int brandID;
    private String defaultImg;
    Brand brands;
    Gender genders;
    private ArrayList<Volume> volumes;
    private ArrayList<Sale> sales;
    
    public Product() {
    }

    public Product(int id, String description, int genderID, String nameProduct, String codeProduct, int discount, String scent, int brandID, String defaultImg) {
        this.id = id;
        this.description = description;
        this.genderID = genderID;
        this.nameProduct = nameProduct;
        this.codeProduct = codeProduct;
        this.discount = discount;
        this.scent = scent;
        this.brandID = brandID;
        this.defaultImg = defaultImg;
    }

    public Product(int id, String description, int genderID, String nameProduct, String codeProduct, int discount, String scent, int brandID, String defaultImg, Brand brands) {
        this.id = id;
        this.description = description;
        this.genderID = genderID;
        this.nameProduct = nameProduct;
        this.codeProduct = codeProduct;
        this.discount = discount;
        this.scent = scent;
        this.brandID = brandID;
        this.defaultImg = defaultImg;
        this.brands = brands;
    }

    
    
    public Product(int id, String description, int genderID, String nameProduct, String codeProduct, int discount, String scent, int brandID, String defaultImg, Brand brands, ArrayList<Volume> volumes) {
        this.id = id;
        this.description = description;
        this.genderID = genderID;
        this.nameProduct = nameProduct;
        this.codeProduct = codeProduct;
        this.discount = discount;
        this.scent = scent;
        this.brandID = brandID;
        this.defaultImg = defaultImg;
        this.brands = brands;
        this.volumes = volumes;
    }

    public Product(int id, String description, int genderID, String nameProduct, String codeProduct, int discount, String scent, int brandID, String defaultImg, Gender genders, ArrayList<Volume> volumes) {
        this.id = id;
        this.description = description;
        this.genderID = genderID;
        this.nameProduct = nameProduct;
        this.codeProduct = codeProduct;
        this.discount = discount;
        this.scent = scent;
        this.brandID = brandID;
        this.defaultImg = defaultImg;
        this.genders = genders;
        this.volumes = volumes;
    }

 

 
    public Product(int id, String description, int genderID, String nameProduct, String codeProduct, int discount, String scent, int brandID, String defaultImg, ArrayList<Volume> volumes) {
        this.id = id;
        this.description = description;
        this.genderID = genderID;
        this.nameProduct = nameProduct;
        this.codeProduct = codeProduct;
        this.discount = discount;
        this.scent = scent;
        this.brandID = brandID;
        this.defaultImg = defaultImg;
        this.volumes = volumes;
    }

    public Product(int id, String description, int genderID, String nameProduct, String codeProduct, int discount, String scent, int brandID, String defaultImg, ArrayList<Volume> volumes, ArrayList<Sale> sales) {
        this.id = id;
        this.description = description;
        this.genderID = genderID;
        this.nameProduct = nameProduct;
        this.codeProduct = codeProduct;
        this.discount = discount;
        this.scent = scent;
        this.brandID = brandID;
        this.defaultImg = defaultImg;
        this.volumes = volumes;
        this.sales = sales;
    }

    public Product(int id, String description, int genderID, String nameProduct, String codeProduct, int discount, String scent, int brandID, String defaultImg, Brand brands, Gender genders, ArrayList<Volume> volumes) {
        this.id = id;
        this.description = description;
        this.genderID = genderID;
        this.nameProduct = nameProduct;
        this.codeProduct = codeProduct;
        this.discount = discount;
        this.scent = scent;
        this.brandID = brandID;
        this.defaultImg = defaultImg;
        this.brands = brands;
        this.genders = genders;
        this.volumes = volumes;
    }

 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getGenderID() {
        return genderID;
    }

    public void setGenderID(int genderID) {
        this.genderID = genderID;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getCodeProduct() {
        return codeProduct;
    }

    public void setCodeProduct(String codeProduct) {
        this.codeProduct = codeProduct;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getScent() {
        return scent;
    }

    public void setScent(String scent) {
        this.scent = scent;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public String getDefaultImg() {
        return defaultImg;
    }

    public void setDefaultImg(String defaultImg) {
        this.defaultImg = defaultImg;
    }

  
    public ArrayList<Volume> getVolumes() {
        return volumes;
    }

    public void setVolumes(ArrayList<Volume> volumes) {
        this.volumes = volumes;
    }

    public Brand getBrands() {
        return brands;
    }

    public void setBrands(Brand brands) {
        this.brands = brands;
    }

    public ArrayList<Sale> getSales() {
        return sales;
    }

    public void setSales(ArrayList<Sale> sales) {
        this.sales = sales;
    }

    public Gender getGenders() {
        return genders;
    }

    public void setGenders(Gender genders) {
        this.genders = genders;
    }

    


   
    
    
    
}
