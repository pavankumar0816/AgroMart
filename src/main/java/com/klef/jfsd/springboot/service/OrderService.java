package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Map;

import com.klef.jfsd.springboot.model.OrderRequest;
import com.klef.jfsd.springboot.model.ProductOrder;

public interface OrderService 
{
   public void saveOrder(int cid, OrderRequest orderRequest) throws Exception;
   
   public ProductOrder updateOrder(Map<String, String> responsePayLoad);
 
   public List<ProductOrder> getOrderBycustomer(int cid);
   
   public boolean updateOrderStatus(String id, String status);
   
   public List<ProductOrder> getAllOrders();
}
