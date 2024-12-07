package com.klef.jfsd.springboot.service;

import java.util.List; 
 
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Products;
 
public interface CustomerService 
{
   public String CustomerRegistartion(Customer c);
   public Customer checkcustomerlogin(String email, String pwd);
   
   public String updateCustomerProfile(Customer customer);
   public Customer displayCustomerbyId(int cid);
   
   public List<Products> ViewAllProducts();
   
   public boolean checkEmailExists(String email);	 
   public boolean checkContactExists(String contact);
   
   public Customer getCustomerByEmail(String email);
  
}
