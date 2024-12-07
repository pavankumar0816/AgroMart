package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Farmer;

public interface AdminService 
{
	public Admin checkadminlogin(String username, String password);
	public String AddFarmer(Farmer f);
	public List<Farmer> ViewAllFarmers();
	public long farmercount();
	
	public String deletefarmer(int fid);
	
	public Farmer displayFarmerbyID(int fid);
	public String updateFarmerStatus(String status, int fid);
	
	public List<Customer> ViewAllCustomers();
	public long customercount();
	
	public String deletecustomer(int cid);
	
	   public boolean checkEmailExists(String email);	 
	   public boolean checkContactExists(String contact);
	
	 
	 
	
}
