package com.klef.jfsd.springboot.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.klef.jfsd.springboot.model.Cart;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Products;
import com.klef.jfsd.springboot.repository.CartRepository;
import com.klef.jfsd.springboot.repository.CustomerRepository;
import com.klef.jfsd.springboot.repository.ProductRepository;

@Service
public class CartServiceImpl implements CartService
{
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private ProductRepository productRepository;

	@Override
	public Cart addcart(int productid, int customerid) 
	{
		 Customer customer = customerRepository.findById(customerid).get();
		 Products product =  productRepository.findById(productid).get();
		 
		 Cart cartstatus = cartRepository.findByProductIdAndCustomerId(productid, customerid);
		 
		 Cart cart = null;
		 
		 if(ObjectUtils.isEmpty(cartstatus))
		 {
			 cart = new Cart();
			 cart.setProductid(product);
			 cart.setCustomerid(customer);
			 cart.setQuantity(1);
			 cart.setTotalprice(1 * product.getCost());
			 
		 }
		 else
		 {
			 cart = cartstatus;
			 cart.setQuantity(cart.getQuantity()+1);
			 cart.setTotalprice(cart.getQuantity() * cart.getProductid().getCost() );
		 }
		  Cart savecart =  cartRepository.save(cart);
		return savecart;
	}

	@Override
	public List<Cart> getCartItemsForCustomer(int customerid) {
	    List<Cart> carts = cartRepository.findByCustomerId(customerid);
  
	    Double totalorderprice = 0.0;

	    List<Cart> updateCarts = new ArrayList<>();
	    for (Cart c : carts) {
	        if (c.getProductid() != null) {
	            double totalprice = c.getProductid().getCost() * c.getQuantity();
	            c.setTotalprice(totalprice);
	            totalorderprice += totalprice;
	            c.setTotalorderprice(totalorderprice);
	            updateCarts.add(c);
	        } else {
	            System.out.println("Cart with missing product: " + c);
	        }
	    }

	    return updateCarts;
	}


		@Override
		public int getCountCart(int customerid) 
		{
     	    int count = cartRepository.countByCustomerId(customerid);
		     return count;
		}

		@Override
		public void updateQuantity(String symbol, int cid)
		{
		    Optional<Cart> optionalCart = cartRepository.findById(cid);
		    
		    if (optionalCart.isPresent())
		    {
		        Cart cart = optionalCart.get();  

		        int updateQuantity;
		        if (symbol.equalsIgnoreCase("de")) 
		        {
		            updateQuantity = cart.getQuantity() - 1;

		            if (updateQuantity <= 0) 
		            {
		                cartRepository.delete(cart);
		            }
		            else
		            {
		            	cart.setQuantity(updateQuantity);
				        cartRepository.save(cart);  
		            }
		        }
		        else
		        {
		            updateQuantity = cart.getQuantity() + 1;
		            cart.setQuantity(updateQuantity);
			        cartRepository.save(cart);  
		        }
		         
		    } 
		    else
		    {
		      
		        System.out.println("Cart not found with id: " + cid);
		        
		    }
		}
		
}



