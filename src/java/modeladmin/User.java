/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeladmin;

import java.sql.Date;

/**
 *
 * @author NguyenDucDat
 */
public class User {

    private int id;
    private String username;
    private String password;
    private Position position;
    private String fullname;
    private Date dob;
    private String address;
    private String email;
    private String phone;
    private Role role;
    private boolean banned;
    private boolean status;

    public User() {
    }

    public User(int id, String username, String password, Position position, String fullname, Date dob, String address, String email, String phone, Role role, boolean banned, boolean status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.position = position;
        this.fullname = fullname;
        this.dob = dob;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.banned = banned;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public boolean isBanned() {
        return banned;
    }

    public void setBanned(boolean banned) {
        this.banned = banned;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", password=" + password + ", position=" + position + ", fullname=" + fullname + ", dob=" + dob + ", address=" + address + ", email=" + email + ", phone=" + phone + ", role=" + role + ", banned=" + banned + ", status=" + status + '}';
    }

    
}
