/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelAdmin;

import java.sql.Date;

/**
 *
 * @author NguyenDucDat
 */
public class SaleEvent {
    private int sid;
    private String title;
    private String eventcontent;
    private Date startdate;
    private Date endate;

    public SaleEvent() {
    }

    public SaleEvent(int sid, String title, String eventcontent, Date startdate, Date endate) {
        this.sid = sid;
        this.title = title;
        this.eventcontent = eventcontent;
        this.startdate = startdate;
        this.endate = endate;
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

    public Date getEndate() {
        return endate;
    }

    public void setEndate(Date endate) {
        this.endate = endate;
    }
    
    
}
