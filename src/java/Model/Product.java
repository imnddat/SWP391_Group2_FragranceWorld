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
    private ArrayList<Volume> volumes;
    private ArrayList<Brand> brands;
    private ArrayList<Gender> genders;
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

    public Product(int id, String description, int genderID, String nameProduct, String codeProduct, int discount, String scent, int brandID, String defaultImg, ArrayList<Volume> volumes, ArrayList<Brand> brands) {
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
        this.brands = brands;
    }

    public Product(int id, String description, int genderID, String nameProduct, String codeProduct, int discount, String scent, int brandID, String defaultImg, ArrayList<Volume> volumes, ArrayList<Brand> brands, ArrayList<Gender> genders) {
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
        this.brands = brands;
        this.genders = genders;
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

    public ArrayList<Brand> getBrands() {
        return brands;
    }

    public void setBrands(ArrayList<Brand> brands) {
        this.brands = brands;
    }

    public ArrayList<Gender> getGenders() {
        return genders;
    }

    public void setGenders(ArrayList<Gender> genders) {
        this.genders = genders;
    }
    
    
    
}
