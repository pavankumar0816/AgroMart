package com.klef.jfsd.springboot.service;
           
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
 
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Products;
 
import com.klef.jfsd.springboot.repository.CustomerRepository;
import com.klef.jfsd.springboot.repository.ProductRepository;
  

@Service
public class CustomerServiceImpl implements CustomerService
{
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	 
	@Override
	public String CustomerRegistartion(Customer c) 
	{
		 customerRepository.save(c);
		return "Customer Registered Successfully";
	}

	@Override
	public Customer checkcustomerlogin(String email, String pwd) 
	{
      return  customerRepository.checkcustomerlogin(email, pwd);
	}

	@Override
	public List<Products> ViewAllProducts() 
	{
		return (List<Products>) productRepository.findAll();
	}

	  public boolean checkEmailExists(String email) 
	  {
	        return customerRepository.findByEmail(email) != null;
	    }

	   
	    @Override
	    public boolean checkContactExists(String contact) 
	    {
	        return customerRepository.findByContact(contact) != null;
	    }

		@Override
		public Customer getCustomerByEmail(String email)
		{
			 return customerRepository.findByEmail(email);
		}

		@Override
		public String updateCustomerProfile(Customer customer) 
		{
		    Customer c = customerRepository.findById(customer.getId()).get();
		    
		    c.setName(customer.getName());
		    c.setDob(customer.getDob());
		    c.setGender(customer.getGender());
		    c.setEmail(customer.getEmail());
		    c.setLocation(customer.getLocation());
		    c.setContact(customer.getContact());
		    
		    customerRepository.save(c);
		    
		    return "Customer Updated Successfully";
		}

		@Override
		public Customer displayCustomerbyId(int cid) 
		{
		   return customerRepository.findById(cid).get();	 
		}  
}
