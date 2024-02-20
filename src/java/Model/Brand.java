/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Thinkpad
 */
public class Brand {
    private int id;
    /*Brand ID*/
    private String name;
    /*Brand Name*/
    private String makebtFrom;
    /*Brand makebtFrom*/

    public Brand() {
    }

    public Brand(int id, String name, String makebtFrom) {
        this.id = id;
        this.name = name;
        this.makebtFrom = makebtFrom;
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

    public String getMakebtFrom() {
        return makebtFrom;
    }

    public void setMakebtFrom(String makebtFrom) {
        this.makebtFrom = makebtFrom;
    }
    
    
    
}
