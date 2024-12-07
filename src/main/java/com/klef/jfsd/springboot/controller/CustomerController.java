package com.klef.jfsd.springboot.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Cart;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.OrderRequest;
import com.klef.jfsd.springboot.model.OrderStatus;
import com.klef.jfsd.springboot.model.ProductOrder;
import com.klef.jfsd.springboot.model.Products;
import com.klef.jfsd.springboot.service.CartService;
import com.klef.jfsd.springboot.service.CustomerService;
import com.klef.jfsd.springboot.service.FarmerService;
import com.klef.jfsd.springboot.service.OrderService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class CustomerController 
{
	@Autowired
    private CustomerService customerService;
	
	@Autowired
	private FarmerService farmerService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}
	
	@GetMapping("index")
	public ModelAndView index()
	{
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	
	 @Autowired
	 private JavaMailSender mailSender;
	 
	 @PostMapping("sendemail")
	 public ModelAndView sendEmail(HttpServletRequest request) throws Exception 
	 {
	 String name = request.getParameter("name");
	 String toemail = request.getParameter("email");
	 String mobile = request.getParameter("mobile");
	 String subject = request.getParameter("subject");
	 String msg = request.getParameter("message");
	 MimeMessage mimeMessage = mailSender.createMimeMessage();
	 MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
	 
	 int otp = (int)(Math.random() * 99999); // random number generation 
	 helper.setTo("pmpk28231618@gmail.com");
	 helper.setSubject(subject);
	 String htmlContent = 
	 "<h3>Contact Form Details</h3>" +
	 "<p><strong>Name:</strong> " + name + "</p>" +
	 "<p><strong>Email:</strong> " + toemail + "</p>" +
	 "<p><strong>Mobile Number:</strong> " + mobile + "</p>" +
	 "<p><strong>Subject:</strong> " + subject + "</p>" +
	 "<p><strong>Message:</strong> " + msg + "</p>" +
	 "<p><strong>OTP:</strong> " + otp + "</p>";
	 helper.setText(htmlContent, true);
	 mailSender.send(mimeMessage);
	 
	 ModelAndView mv = new ModelAndView("mailsuccess");
	 mv.addObject("message", "Email Sent Successfully");
	 return mv;
	 }

	
	
	@GetMapping("/customerhome")
	public ModelAndView customerhome()
	{
		ModelAndView mv = new ModelAndView("customerhome");
		return mv;
	}
  
 
	
	@PostMapping("insertcustomer")
	public ModelAndView insertcustomer(HttpServletRequest request)
	{
		String name = request.getParameter("cname");
		String gender = request.getParameter("cgender");
		String dob = request.getParameter("cdob");
		String email = request.getParameter("cemail");
		String password = request.getParameter("cpwd");
		String location = request.getParameter("clocation");
		String contact = request.getParameter("ccontact");
		String status = "Registered";
	 

	    ModelAndView mv = new ModelAndView("customerlogin"); 
	    
	    boolean isEmailDuplicate = customerService.checkEmailExists(email);
	    boolean isContactDuplicate = customerService.checkContactExists(contact);

	    if (isEmailDuplicate) 
	    {
	        mv.addObject("message", "This email is already registered.");
	        return mv;   
	    }

	    if (isContactDuplicate) 
	    {
	        mv.addObject("message", "This contact number is already registered.");
	        return mv;   
	    }
	    
		Customer c = new Customer();
		c.setName(name);
		c.setGender(gender);
		c.setDob(dob);
		c.setEmail(email);
		c.setPassword(password);
		c.setLocation(location);
		c.setContact(contact);
		c.setStatus(status);
		
		String msg = customerService.CustomerRegistartion(c);
		
		  mv.setViewName("regsuccess");
		    mv.addObject("message", msg);

		return mv;
		
	}
	
	@GetMapping("customerlogin")
	public ModelAndView customerlogin()
	{
		ModelAndView mv = new ModelAndView("customerlogin");
		return mv;
	}
	
	
	
	@PostMapping("checkcustomerlogin")
	public ModelAndView checkcustomerlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String cemail = request.getParameter("cemail");
		String cpwd = request.getParameter("cpwd");
		
		Customer c = customerService.checkcustomerlogin(cemail, cpwd);
		if(c!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("customer", c);
       	 
       	     mv.setViewName("index");
		}
		else
		{
			mv.setViewName("customerlogin");
       	     mv.addObject("message", "Login Failed");
        }
        
        return mv;
	}
	
	@GetMapping("customerprofile")
	public ModelAndView customerprofile()
	{
		ModelAndView mv = new ModelAndView("customerprofile");
		
		return mv;
	}
	
	@GetMapping("updatecustomer")
	public ModelAndView updatecustomer()
	{
		ModelAndView mv = new ModelAndView("updatecustomer");
		return mv;
	}
	
	@PostMapping("updatecustomerprofile")
	public ModelAndView updatecustomerprofile(HttpServletRequest request) 
	{
	    ModelAndView mv = new ModelAndView();   

	    try 
	    {
	        int id = Integer.parseInt(request.getParameter("cid"));
	        String name = request.getParameter("cname");
	        String gender = request.getParameter("cgender");
	        String dob = request.getParameter("cdob");
	        String email = request.getParameter("cemail");
	        String location = request.getParameter("clocation");
	        String contact = request.getParameter("ccontact");

	        Customer c = new Customer();
	        c.setId(id);
	        c.setName(name);
	        c.setGender(gender);
	        c.setDob(dob);
	        c.setEmail(email);
	        c.setLocation(location);
	        c.setContact(contact);

	        String msg = customerService.updateCustomerProfile(c);
	        
	        Customer customer = customerService.displayCustomerbyId(id);
	        HttpSession session = request.getSession();
	         session.setAttribute("customer", c);
	        
	         mv.setViewName("updcustsucc");
	         mv.addObject("message", msg);
	       
	     }
	     catch(Exception e)
	     {
	       mv.setViewName("updatecusterror");
	       mv.addObject("message", e);
	     }
	       return mv;
	 }
	    

	
	@GetMapping("viewallfarmerproducts")
    public ModelAndView viewallfarmerproducts()
    {
    	List<Products> plist = farmerService.ViewAllProducts();
    	
    	ModelAndView mv = new ModelAndView("viewallfarmerproducts");
    	
    	mv.addObject("plist", plist);
    	
    	return mv;
    }
	
	 @GetMapping("displayfarmerproductimage")
	    public ResponseEntity<byte[]> displayproductimage(@RequestParam int id) throws Exception
	    {
	    	Products products = farmerService.ViewProductById(id);
	    	byte [] imageBytes = null;
	    	imageBytes = products.getImage().getBytes(1,(int) products.getImage().length());
	    	
	    	return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	    	 
	    }
    
	    @RequestMapping("addtocart")
	    public String addToCart(@RequestParam("pid") Integer productId, 
	                            @RequestParam(value = "customerid", required = false) Integer customerId, 
	                            HttpSession session) 
	    {
	        try
	        {
	            if (productId == null)
	            {
	                session.setAttribute("errorMsg", "Missing product ID.");
	                return "redirect:/mycart";  
	            }

	            if (customerId == null) 
	            {
	                session.setAttribute("errorMsg", "Missing customer ID.");
	                return "redirect:/mycart"; 
	            }
 
	            cartService.addcart(productId, customerId);
 
	            session.setAttribute("SuccMsg", "Product added to cart successfully!");
	            return "redirect:/mycart";  
	        }
	        catch (Exception e) 
	        {
	           
	            session.setAttribute("errorMsg", "Error occurred while adding product to cart.");
	            return "redirect:/mycart";  
	        }
	    }

	    @GetMapping("mycart")
	    public String mycart(HttpSession session, Model m) {
	       
	        Customer customer = (Customer) session.getAttribute("customer");
	        
	        if (customer == null) 
	        {
	           
	            return "redirect:/customerlogin";
	        }
 
	        List<Cart> carts = cartService.getCartItemsForCustomer(customer.getId());
	        m.addAttribute("carts", carts);

	        
	        if (!carts.isEmpty()) 
	        {
	            double totalorderprice = carts.get(carts.size() - 1).getTotalorderprice();
	            m.addAttribute("totalorderprice", totalorderprice);
	        } 
	        else 
	        {
	            m.addAttribute("totalorderprice", 0.0);
	        }

	     
	        return "mycart";
	    }
	    
	    public Customer getLoggedInCustomerDetails(Principal p) {
	        if (p == null) {
	            throw new IllegalStateException("User is not authenticated. Principal is null.");
	        }
	        String email = p.getName();
	        return customerService.getCustomerByEmail(email);
	    }

	    
	    @GetMapping("cartquantity")
	    public String updateCartQuantity(@RequestParam String symbol, @RequestParam int cid)
	    {
	    	cartService.updateQuantity(symbol, cid);
	    	 return "redirect:/mycart"; 	    	
 	    }

	    
	    @GetMapping("viewproductdetails")
	    public ModelAndView viewproductdetails(@RequestParam int id) {
	        
	        Products product = farmerService.ViewProductById(id);

	        ModelAndView mv = new ModelAndView("viewproductdetails"); // Reference to the JSP file
	        mv.addObject("product", product);

	        return mv;
	    }
	   
	    @GetMapping("payment")
	    public String payment(HttpSession session, Model m) {
	        Customer customer = (Customer) session.getAttribute("customer");

	        if (customer == null) {
	            return "redirect:/customerlogin";
	        }

	        List<Cart> carts = cartService.getCartItemsForCustomer(customer.getId());
	        m.addAttribute("carts", carts);

	        if (!carts.isEmpty()) {
	        	double orderprice = carts.stream()                      
                        .mapToDouble(Cart::getTotalprice)  
                        .sum();                        
 
	            double totalorderprice = orderprice + 250 + 100;
	             
	            m.addAttribute("orderprice", orderprice);
	            m.addAttribute("totalorderprice", totalorderprice);
	        }

	        return "payment";
	    }


	    
	    @PostMapping("saveorder")
	    public String saveOrder(@ModelAttribute OrderRequest request, HttpServletRequest request1) 
	    {
	        HttpSession session = request1.getSession(false);
 
	        if (session == null || session.getAttribute("customer") == null) 
	        {
	            return "orderfail"; // Redirect to the order failure page
	        }

	        try 
	        {
	             
	            Customer customer = (Customer) session.getAttribute("customer");
 
	            orderService.saveOrder(customer.getId(), request);
 
	            return "ordersuccess";
	        } 
	        catch (Exception e) 
	        
	        {
	            
	            return "orderfail";
	        }
	    }
	    
	    @GetMapping("myorders")
	    public String myorders(Model m, HttpSession session)
	    {
	    	 Customer customer = (Customer) session.getAttribute("customer");

		        if (customer == null) {
		            return "redirect:/customerlogin";
		        }

    	List<ProductOrder> orders = 	orderService.getOrderBycustomer(customer.getId());
	   m.addAttribute("orders", orders);
	    	return "myorders";
	    }
	    
	    @GetMapping("updateorderstatus")
	    public String updateOrderStatus(@RequestParam String id, @RequestParam int status, HttpSession session) 
	    {
	        
	        OrderStatus[] values = OrderStatus.values();
	        String statusName = null;

	        for (OrderStatus oStatus : values) 
	        {
	            if (oStatus.getId() == status) 
	            {
	                statusName = oStatus.getName();
	                break;
	            }
	        }
 
	        boolean updateOrder = orderService.updateOrderStatus(id, statusName);

	        if (updateOrder) 
	        {
	            session.setAttribute("succMsg", "Status Updated");
	        } 
	        else 
	        {
	            session.setAttribute("errorMsg", "Status Not Updated");
	        }

	        return "redirect:/myorders";
	    }
	    
	    
	    
	    @GetMapping("customeressionexpiry")
	    public ModelAndView customeressionexpiry()
	    {
	   	 ModelAndView mv = new ModelAndView();
	   	 mv.setViewName("customeressionexpiry");
	   	 return mv;
	    }
	    
	    @GetMapping("customerlogout")
		  public ModelAndView customerlogout()
		  {
		    ModelAndView mv = new ModelAndView();
		    mv.setViewName("customerlogin");
		    return mv;
		  }
	    
	   
 
}
