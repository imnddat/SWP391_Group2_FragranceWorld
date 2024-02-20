/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Thinkpad
 */
public class Sale {
    private int id;
    private int freeship;
    private String starttime;
    private String endtime;
    private String discount;
    private String content;

    public Sale() {
    }

    public Sale(int id, int freeship, String starttime, String endtime, String discount, String content) {
        this.id = id;
        this.freeship = freeship;
        this.starttime = starttime;
        this.endtime = endtime;
        this.discount = discount;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFreeship() {
        return freeship;
    }

    public void setFreeship(int freeship) {
        this.freeship = freeship;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
          
}
