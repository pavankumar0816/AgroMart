package com.klef.jfsd.springboot.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Farmer;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CustomerRepository;
import com.klef.jfsd.springboot.repository.FarmerRepository;

@Service
public class AdminServiceImpl implements AdminService
{
    @Autowired
	private AdminRepository adminRepository;
    
    @Autowired
    private FarmerRepository farmerRepository;
    
    @Autowired
    private CustomerRepository customerRepository;
	
	@Override
	public Admin checkadminlogin(String username, String password) 
	{
		 return adminRepository.checkadminlogin(username, password);
	}

	@Override
	public String AddFarmer(Farmer f) 
	{
		farmerRepository.save(f);
		return "Farmer Addedd Successfully..";
	}

	@Override
	public List<Farmer> ViewAllFarmers() 
	{
		 return farmerRepository.findAll();
	}

	@Override
	public String deletefarmer(int fid) 
	{
	   farmerRepository.deleteById(fid);
	   return "Farmer Deleted Successfully";
	}

	 

	@Override
	public Farmer displayFarmerbyID(int fid) 
	{	 
		 return farmerRepository.findById(fid).get();
	}

	@Override
	public String updateFarmerStatus(String status, int fid) 
	{
		 farmerRepository.updateFarmerStatus(status, fid);
		 return "Farmer Updated Successfully...";
	}

	@Override
	public long farmercount() 
	{		 
		return farmerRepository.count() ;
	}

	@Override
	public List<Customer> ViewAllCustomers() 
	{
	    return customerRepository.findAll();
	}

	@Override
	public long customercount()
	{
		 return customerRepository.count();
	}

	@Override
	public String deletecustomer(int cid) 
	{
		customerRepository.deleteById(cid);
		
		return "Customer Deleted Successfully";
		 
	}
	
	  public boolean checkEmailExists(String email) 
	  {
	        return farmerRepository.findByEmail(email) != null;
	    }

	   
	    @Override
	    public boolean checkContactExists(String contact) 
	    {
	        return farmerRepository.findByContact(contact) != null;
	    }

	 
}
