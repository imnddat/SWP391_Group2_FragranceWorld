/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Thinkpad
 */
public class Role {
      private int id; /*User role id*/
      private String userRoleName; /*User role Name*/

    public Role() {
    }

    public Role(int id, String userRoleName) {
        this.id = id;
        this.userRoleName = userRoleName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserRoleName() {
        return userRoleName;
    }

    public void setUserRoleName(String userRoleName) {
        this.userRoleName = userRoleName;
    }
    
}
