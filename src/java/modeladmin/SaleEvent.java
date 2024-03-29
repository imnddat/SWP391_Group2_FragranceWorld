/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeladmin;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NguyenDucDat
 */
public class SaleEvent {
    private int sid;
    private String title;
    private String eventcontent;
    private Date startdate;
    private Date enddate;
    private List<Products> products = new ArrayList<>();
    
    public SaleEvent() {
    }

    public SaleEvent(int sid, String title, String eventcontent, Date startdate, Date enddate) {
        this.sid = sid;
        this.title = title;
        this.eventcontent = eventcontent;
        this.startdate = startdate;
        this.enddate = enddate;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getEventcontent() {
        return eventcontent;
    }

    public void setEventcontent(String eventcontent) {
        this.eventcontent = eventcontent;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public List<Products> getProducts() {
        return products;
    }

    public void setProducts(List<Products> products) {
        this.products = products;
    }
}
