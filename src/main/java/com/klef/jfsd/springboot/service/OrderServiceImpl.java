package com.klef.jfsd.springboot.service;

import java.time.LocalDate; 
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Cart;
import com.klef.jfsd.springboot.model.OrderAddress;
import com.klef.jfsd.springboot.model.OrderRequest;
import com.klef.jfsd.springboot.model.OrderStatus;
import com.klef.jfsd.springboot.model.ProductOrder;
import com.klef.jfsd.springboot.repository.CartRepository;
import com.klef.jfsd.springboot.repository.ProductOrderRepository;
import com.klef.jfsd.springboot.repository.ProductRepository;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;

@Service
public class OrderServiceImpl implements OrderService
{
	@Autowired
	private ProductOrderRepository orderRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CartRepository cartRepository;
	
	@Value("${razorpay.key.id}")
	private  String razorPayKey;
	
	@Value("${razorpay.secret.key}")
	private String razorPaySecret;
	
	private RazorpayClient client;

	@Override
	public void saveOrder(int cid, OrderRequest orderRequest) throws Exception {
	    // Retrieve carts for the customer
	    List<Cart> carts = cartRepository.findByCustomerId(cid);

	    for (Cart cart : carts) {
	        ProductOrder order = new ProductOrder();
 
	        order.setOrderId(UUID.randomUUID().toString());
	        order.setOrderDate(LocalDate.now());
	        order.setProduct(cart.getProductid());
	        order.setPrice(cart.getProductid().getCost() * cart.getQuantity());
	        order.setQuantity(cart.getQuantity());
	        order.setCustomer(cart.getCustomerid());
	        order.setStatus(OrderStatus.IN_PROGRESS.getName());
	        order.setPaymentType(orderRequest.getPaymentType());
 
	        OrderAddress address = new OrderAddress();
	        
	        address.setFullname(orderRequest.getFullname());
	        address.setEmail(orderRequest.getEmail());
	        address.setMobileNo(orderRequest.getMobileNo());
	        address.setAddress(orderRequest.getAddress());
	        address.setCity(orderRequest.getCity());
	        address.setState(orderRequest.getState());
	        address.setPincode(orderRequest.getPincode());
	        order.setOrderAddress(address);

	        
	        JSONObject orderReq = new JSONObject();
	        orderReq.put("amount", (int) (order.getPrice() * 100));  
	        orderReq.put("currency", "INR");
	        orderReq.put("receipt", orderRequest.getEmail());  

	         this.client = new RazorpayClient(razorPayKey, razorPaySecret);
	        Order razorPayOrder = client.orders.create(orderReq);
	        
	        System.out.println(razorPayOrder);
 
	        order.setRazorpayOrderId(razorPayOrder.get("id"));
	        order.setStatus(razorPayOrder.get("status"));
 
	        orderRepository.save(order);
	    }
	}


	@Override
	public List<ProductOrder> getOrderBycustomer(int cid)
	{
	  List<ProductOrder> orders =   orderRepository.findByCustomerId(cid);
		return orders;
	}

	@Override
	public boolean updateOrderStatus(String id, String status) 
	{
	    try 
	    {
	       
	        int orderId = Integer.parseInt(id);  
	        Optional<ProductOrder> findById = orderRepository.findById(orderId);
	        
	        if (findById.isPresent()) 
	        {
	            ProductOrder productOrder = findById.get();
	            productOrder.setStatus(status);
	            orderRepository.save(productOrder);
	            return true;
	        }
	    } 
	    catch (NumberFormatException e) 
	    {
	         
	        System.out.println("Invalid Order ID format: " + e.getMessage());
	    }
	    
	    return false;
	}

	@Override
	public List<ProductOrder> getAllOrders()
	{	 
		 return orderRepository.findAll();
	}


	@Override
	public ProductOrder updateOrder(Map<String, String> responsePayLoad)
	{
		String razorPayOrderId = responsePayLoad.get("razorpay_order_id");
		ProductOrder order = orderRepository.findByRazorpayOrderId(razorPayOrderId);
		
		order.setStatus("PAYMENT_COMPLETED");
	    ProductOrder updateOrder = orderRepository.save(order);
	    
	    return updateOrder;
	}


	 

}
