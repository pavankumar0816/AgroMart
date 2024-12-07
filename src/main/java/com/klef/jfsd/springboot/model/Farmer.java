package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;  
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;

@Entity
@Table(name = "farmer_table")
public class Farmer 
{
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)  
   @Column(name="farmer_id")
   private int id;
   @Column(name = "farmer_name", nullable = false, length = 50)
   private String name;
   @Column(name = "farmer_email", nullable = false, length = 50)
   private String email;
   @Column(name = "farmer_password", nullable = false, length = 50)
   private String password = "farmer";
   @Column(name = "farmer_address", nullable = false, length = 50)
   private String address;
   @Column(name = "farmer_farmsize", nullable = false)
   private int farmsize;
   @Column(name = "farmer_products", nullable = false, length = 50)
   private String productsProduced;
   @Column(name = "farmer_contact", nullable = false, length = 50)
   private String contact;
   @Column(name = "farmer_status", nullable = false, length = 50)
   private String status;
	   
   
	public int getId() 
	{
		return id;
	}
	public void setId(int id) 
	{
		this.id = id;
	}
	public String getName() 
	{
		return name;
	}
	public void setName(String name) 
	{
		this.name = name;
	}
	public String getEmail() 
	{
		return email;
	}
	public void setEmail(String email) 
	{
		this.email = email;
	}
	public String getPassword() 
	{
		return password;
	}
	public void setPassword(String password) 
	{
		this.password = password;
	}
	public String getAddress() 
	{
		return address;
	}
	public void setAddress(String address) 
	{
		this.address = address;
	}
	public int getFarmsize() 
	{
		return farmsize;
	}
	public void setFarmsize(int farmsize) 
	{
		this.farmsize = farmsize;
	}
	public String getProductsProduced() 
	{
		return productsProduced;
	}
	public void setProductsProduced(String productsProduced) 
	{
		this.productsProduced = productsProduced;
	}
	public String getContact() 
	{
		return contact;
	}
	public void setContact(String contact) 
	{
		this.contact = contact;
	}
	public String getStatus() 
	{
		return status;
	}
	public void setStatus(String status) 
	{
		this.status = status;
	}
	   
}
