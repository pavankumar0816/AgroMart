package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Cart;

public interface CartService 
{
     public Cart addcart(int productid, int customerid);
     
     public List<Cart> getCartItemsForCustomer(int customerid);
     
     public int getCountCart(int customerid);
     
     public void updateQuantity(String symbol, int cid);
}
