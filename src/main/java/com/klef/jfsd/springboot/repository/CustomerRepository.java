package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository; 
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Customer;
import com.klef.jfsd.springboot.model.Farmer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer>
{
	@Query("select c from Customer c where c.email=?1 and c.password=?2 ")
    public Customer checkcustomerlogin(String email, String pwd);
	
	
	@Query("select cn from Customer cn where cn.name=?1")
	public Customer getCustomername();
	

    @Query("select c from Customer c where c.email=?1")
    public Customer findByEmail(String email);
 
    @Query("select c from Customer c where c.contact=?1")
    public Customer findByContact(String contact);
	
}
