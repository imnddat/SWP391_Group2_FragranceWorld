/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeladmin;

/**
 *
 * @author NguyenDucDat
 */
public class Brand {
    private int id;
    private String name;
    private String makebyFrom;

    public Brand() {
    }

    public Brand(int id, String name, String makebyFrom) {
        this.id = id;
        this.name = name;
        this.makebyFrom = makebyFrom;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMakebyFrom() {
        return makebyFrom;
    }

    public void setMakebyFrom(String makebyFrom) {
        this.makebyFrom = makebyFrom;
    }
    
    
}
