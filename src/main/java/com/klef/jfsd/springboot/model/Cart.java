package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name = "cart_table")
public class Cart 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cid;
    
	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn(name = "customer_id")
	private Customer customerid;

	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn(name = "product_id")
	private Products productid;

	
	private int quantity;
	
	@Transient
	private double totalprice;
	
	@Transient
	private double totalorderprice;
	 

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public Customer getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Customer customerid) {
		this.customerid = customerid;
	}

	public Products getProductid() {
		return productid;
	}

	public void setProductid(Products productid) {
		this.productid = productid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}

	public double getTotalorderprice() {
		return totalorderprice;
	}

	public void setTotalorderprice(double totalorderprice) {
		this.totalorderprice = totalorderprice;
	}
	
	

	 
	
}
