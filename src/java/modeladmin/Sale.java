/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeladmin;

/**
 *
 * @author NguyenDucDat
 */
public class Sale {
    private int sid;
    private int pid;
    private int discount;
    private String content;

    public Sale() {
    }

    public Sale(int sid, int pid, int discount, String content) {
        this.sid = sid;
        this.pid = pid;
        this.discount = discount;
        this.content = content;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
