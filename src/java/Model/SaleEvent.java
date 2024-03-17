/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Thinkpad
 */
public class SaleEvent {
     private int sidevent;
    private String title;
    private Date startdate;
    private Date enddate;

    public SaleEvent() {
    }

    public SaleEvent(int sidevent, String title, Date startdate, Date enddate) {
        this.sidevent = sidevent;
        this.title = title;
        this.startdate = startdate;
        this.enddate = enddate;
    }

    public int getSid() {
        return sidevent;
    }

    public void setSid(int sid) {
        this.sidevent = sid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
    
    
}
