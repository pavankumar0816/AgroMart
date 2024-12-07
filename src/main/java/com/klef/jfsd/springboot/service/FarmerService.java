package com.klef.jfsd.springboot.service;

import java.util.List; 

import com.klef.jfsd.springboot.model.Farmer;
import com.klef.jfsd.springboot.model.Products;

public interface FarmerService 
{
	public Farmer checkfarmerlogin(String email, String pwd);
	public String AddProducts(Products products);
	public List<Products> ViewAllProducts();
	public long productcount();
	
	public String updateFarmerProfile(Farmer farmer);
	public Farmer displayFarmerbyID(int fid);
	
	public Products ViewProductById(int pid);
	public List<Products> viewallproductsbycategory(String category);
	
	public List<Farmer> displayProductsbyFarmer(String products);

}
