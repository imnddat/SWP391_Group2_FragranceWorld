/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeladmin;

/**
 *
 * @author NguyenDucDat
 */
public class Gender {
    private int id;
    private String gendername;

    public Gender() {
    }

    public Gender(int id, String gendername) {
        this.id = id;
        this.gendername = gendername;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGendername() {
        return gendername;
    }

    public void setGendername(String gendername) {
        this.gendername = gendername;
    }
    
    
}
