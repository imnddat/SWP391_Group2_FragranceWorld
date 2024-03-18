/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelAdmin;

/**
 *
 * @author NguyenDucDat
 */
public class Products {
    private int id;
    private String description;
    private Gender gender;
    private String nameProduct;
    private String codeProduct;
    private String scent;
    private Brand brand;
    private String defaultImg;

    public Products() {
    }

    public Products(int id, String description, Gender gender, String nameProduct, String codeProduct, String scent, Brand brand, String defaultImg) {
        this.id = id;
        this.description = description;
        this.gender = gender;
        this.nameProduct = nameProduct;
        this.codeProduct = codeProduct;
        this.scent = scent;
        this.brand = brand;
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

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
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

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public String getDefaultImg() {
        return defaultImg;
    }

    public void setDefaultImg(String defaultImg) {
        this.defaultImg = defaultImg;
    }

    @Override
    public String toString() {
        return "Products{" + "id=" + id + ", description=" + description + ", gender=" + gender + ", nameProduct=" + nameProduct + ", codeProduct=" + codeProduct + ", scent=" + scent + ", brand=" + brand + ", defaultImg=" + defaultImg + '}';
    }

    
    
}
