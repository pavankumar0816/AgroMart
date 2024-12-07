package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.util.List;

@Entity
@Table(name = "customer_table")
public class Customer {
   
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_id")
    private int id;
    
    @Column(name = "customer_name", nullable = false, length = 50)
    private String name;
    
    @Column(name = "customer_gender", nullable = false, length = 50)
    private String gender;
    
    @Column(name = "customer_dob", nullable = false, length = 50)
    private String dob;
    
    @Column(name = "customer_email", nullable = false, length = 50)
    private String email;
    
    @Column(name = "customer_password", nullable = false, length = 50)
    private String password;
    
    @Column(name = "customer_location", nullable = false, length = 50)
    private String location;
    
    @Column(name = "customer_contact", nullable = false, length = 50)
    private String contact;
    
    @Column(name = "customer_status", nullable = false, length = 50)
    private String status;
    
      @OneToMany(mappedBy = "customerid")  
    private List<Cart> cartItems;  
    
    
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Cart> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<Cart> cartItems) {
        this.cartItems = cartItems;
    }
}
