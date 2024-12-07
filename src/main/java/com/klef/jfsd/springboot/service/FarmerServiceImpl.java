package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Farmer;
import com.klef.jfsd.springboot.model.Products;
import com.klef.jfsd.springboot.repository.FarmerRepository;
import com.klef.jfsd.springboot.repository.ProductRepository;

@Service
public class FarmerServiceImpl implements FarmerService
{
	@Autowired
	private FarmerRepository farmerRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public Farmer checkfarmerlogin(String email, String pwd) 
	{
		 return farmerRepository.checkfarmerlogin(email, pwd);
	}

	@Override
	public String AddProducts(Products products) 
	{
	   productRepository.save(products);
	   return "Products Addedd Succesfully";
	}

	@Override
	public List<Products> ViewAllProducts() 
	{
		 
		return (List<Products>) productRepository.findAll();
	}

	@Override
	public Products ViewProductById(int pid) 
	{
	    return productRepository.findById(pid).get();
	}

	@Override
	public List<Products> viewallproductsbycategory(String category) 
	{
		 return productRepository.viewallproductsbycategory(category);
	}

	@Override
	public List<Farmer>  displayProductsbyFarmer(String products) 
	{
	    return farmerRepository.productsProduced(products);
	}

	@Override
	public long productcount() 
	{
	  return productRepository.count();
	}

	@Override
	public String updateFarmerProfile(Farmer farmer)
	{
		Farmer f = farmerRepository.findById(farmer.getId()).get();
		
		f.setName(farmer.getName());
		f.setAddress(farmer.getAddress());
		f.setContact(farmer.getContact());
		f.setFarmsize(farmer.getFarmsize());
		f.setProductsProduced(farmer.getProductsProduced());
		
		farmerRepository.save(f);
	 
		return "Farmer Updated Successfully";
	}

	@Override
	public Farmer displayFarmerbyID(int fid) 
	{
        return farmerRepository.findById(fid).get();
	}

	

}
