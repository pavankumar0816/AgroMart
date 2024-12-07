package com.klef.jfsd.springboot.controller;

import java.util.List;      

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Farmer;
import com.klef.jfsd.springboot.model.OrderStatus;
import com.klef.jfsd.springboot.model.ProductOrder;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.CustomerService;
import com.klef.jfsd.springboot.service.OrderService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
	@Autowired
   private AdminService adminService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("adminhome")
	  public ModelAndView adminhome()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminhome");
	    
	    long fcount = adminService.farmercount();
	    mv.addObject("farmercount", fcount);
	    
	       long ccount = adminService.customercount();
		   mv.addObject("customercount", ccount);
			
	  
	    return mv;
	  }
	
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView("adminlogin");
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	//@ResponseBody
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		
		ModelAndView mv = new ModelAndView();
		
		String username = request.getParameter("auname");
		String pwd = request.getParameter("apwd");
		
		Admin a = adminService.checkadminlogin(username, pwd);
		if(a!=null)
		{
			//return "Admin Login Success";
			HttpSession session = request.getSession();
			session.setAttribute("admin", a);
			mv.setViewName("adminhome");
		
		}
		else
		{
			mv.setViewName("adminloginfail");
			mv.addObject("message", "Login Failed ! Please Check Your Credentials");
		}
		return mv;
	}
	
	@GetMapping("addfarmer")
	public ModelAndView addfarmer()
	{
		ModelAndView mv = new ModelAndView("addfarmer");
		return mv;
	}
	
	@PostMapping("insertfarmer")
	public ModelAndView insertfarmer(HttpServletRequest request) {
	    // Retrieve form data
	    String name = request.getParameter("fname");
	    String email = request.getParameter("femail");
	    String pwd = request.getParameter("fpwd");
	    String address = request.getParameter("fadd");
	    int farmize = Integer.parseInt(request.getParameter("ffarmsize"));
	    String typeofproducts = request.getParameter("fprod");
	    String contact = request.getParameter("fcontact");
	    String status = "Added";

	    // Check for duplicate email and contact number
	    boolean isEmailDuplicate = adminService.checkEmailExists(email);
	    boolean isContactDuplicate = adminService.checkContactExists(contact);

	    ModelAndView mv = new ModelAndView("addfarmer");  // Default view for errors

	    if (isEmailDuplicate) {
	        mv.addObject("message", "This email is already registered.");
	        return mv;  // Return early if email is duplicate
	    }

	    if (isContactDuplicate) {
	        mv.addObject("message", "This contact number is already registered.");
	        return mv;  // Return early if contact is duplicate
	    }

	    // If no duplicates found, proceed to create the Farmer object
	    Farmer f = new Farmer();
	    f.setName(name);
	    f.setEmail(email);
	    f.setPassword(pwd);
	    f.setAddress(address);
	    f.setFarmsize(farmize);
	    f.setProductsProduced(typeofproducts);
	    f.setContact(contact);
	    f.setStatus(status);

	    // Add the farmer to the database
	    String msg = adminService.AddFarmer(f);

	    // Switch to success view if farmer is added
	    mv.setViewName("addsuccess");
	    mv.addObject("message", msg);

	    return mv;
	}


	
	@GetMapping("viewallfarmers")
	public ModelAndView viewallfarmers()
	{
		ModelAndView mv = new ModelAndView();
		List<Farmer> flist =  adminService.ViewAllFarmers();
		mv.setViewName("viewallfarmers");
		mv.addObject("flist", flist);
		
		 long count = adminService.farmercount();
		  mv.addObject("farmercount", count);
		
		return mv;		
	}
	
	@GetMapping("viewallcustomers")
	public ModelAndView viewallcustomers()
	{
		ModelAndView mv = new ModelAndView("viewallcustomers");
		List<Customer> clist = adminService.ViewAllCustomers();
	    mv.addObject("clist", clist);
	    
	   long count = adminService.customercount();
	   mv.addObject("customercount", count);
		
		return mv;
	}
	 
	@GetMapping("updatefarmerstatus")
	public ModelAndView updatefarmerstatus()
	{
		ModelAndView mv = new ModelAndView();
		List<Farmer> flist =  adminService.ViewAllFarmers();
		mv.setViewName("updatefarmerstatus");
		mv.addObject("flist", flist);
		
		return mv;
	}
	
	
	@GetMapping("updatestatus")
	public String updatestatus(@RequestParam("id") int fid, @RequestParam("status") String status)
	{
		adminService.updateFarmerStatus(status, fid);
		return "redirect:/updatefarmerstatus";
	}
	
	
	@GetMapping("delete")
	public String deletefarmeroperation(@RequestParam("id") int fid)
	{
		adminService.deletefarmer(fid);
		return "redirect:/viewallfarmers";
	}
	
	@GetMapping("deletecustomer")
	public String deletecustomeroperation(@RequestParam("id") int cid)
	{
		adminService.deletecustomer(cid);
		return "redirect:/viewallcustomers";
	}
	
	@GetMapping("allorders")
	public String getAllOrders(Model m) 
	{
		List<ProductOrder> allorders = orderService.getAllOrders();
		m.addAttribute("allorders",allorders);
         return "allorders";
	}

	 @PostMapping("update-orderstatus")
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

	        return "redirect:/allorders";
	    }
	    
	    

 
	@GetMapping("adminsessionexpiry")
	public ModelAndView adminsessionexpiry()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminsessionexpiry");
		return mv;
	}
	
	 @GetMapping("adminlogout")
	  public ModelAndView adminlogout()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("adminlogin");
	    return mv;
	  }
}
