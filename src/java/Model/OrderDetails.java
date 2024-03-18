/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class OrderDetails {
    int id;
    int quantity;
    int productId;
    int orderId;
    String volume;
    float price;
    String productName;
    String img;

    public OrderDetails() {
    }

    public OrderDetails(int quantity, int productId, int orderId, String volume, float price, String productName, String img) {
        this.quantity = quantity;
        this.productId = productId;
        this.orderId = orderId;
        this.volume = volume;
        this.price = price;
        this.productName = productName;
        this.img = img;
    }

    public OrderDetails(int id, int quantity, int productId, int orderId, String volume, float price) {
        this.id = id;
        this.quantity = quantity;
        this.productId = productId;
        this.orderId = orderId;
        this.volume = volume;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    
}
