/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Thinkpad
 */
public class Product {
    
    private int id;
    /*Product ID*/
    private String description;
    /*User Name*/
    private String nameProduct;
    
    private String codeProduct;

    /*User Mail*/
    private String scent;
    /*User Name*/
    private String defaultImg;
    /*User mobile*/

    public Product() {
    }

    public Product(int id, String description, String nameProduct, String codeProduct, String scent, String defaultImg) {
        this.id = id;
        this.description = description;
        this.nameProduct = nameProduct;
        this.codeProduct = codeProduct;
        this.scent = scent;
        this.defaultImg = defaultImg;
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

    public String getScent() {
        return scent;
    }

    public void setScent(String scent) {
        this.scent = scent;
    }

    public String getDefaultImg() {
        return defaultImg;
    }

    public void setDefaultImg(String defaultImg) {
        this.defaultImg = defaultImg;
    }
   
    
    
 

}
