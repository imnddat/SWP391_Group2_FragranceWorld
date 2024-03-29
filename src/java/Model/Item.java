/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author THAISON
 */
public class Item {
    private Product product;
    private int quantity;
    private double price;
    private String volume;

    public Item() {
    }

    public Item(Product product, double price, String volume) {
        this.product = product;
        this.price = price;
        this.volume = volume;
    }
    
    

    public Item(Product product, int quantity, double price, String volume) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.volume = volume;
    }

    
    
    public Item(Product product, int quantity, double price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    public double getTotal(){
        return quantity*price;
    }
    
    public double getTotal(int quantity, double price){
        return quantity*price;
    }
    
}
