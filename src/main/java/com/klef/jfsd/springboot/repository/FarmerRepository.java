package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Farmer;
import com.klef.jfsd.springboot.model.Products;

import jakarta.transaction.Transactional;

@Repository
public interface FarmerRepository extends JpaRepository<Farmer, Integer>
{
	@Query("select f from Farmer f where f.email=?1 and f.password=?2")
    public Farmer checkfarmerlogin(String email, String pwd); 
	
	@Query("update Farmer f set f.status=?1 where f.id=?2 ")
	@Modifying
	@Transactional
	public int updateFarmerStatus(String status, int fid);
	
   @Query("select f from Farmer f where f.productsProduced=?1 ")
   public List<Farmer> productsProduced(String products);
 
    @Query("select f from Farmer f where f.email=?1")
    public Farmer findByEmail(String email);
 
    @Query("select f from Farmer f where f.contact=?1")
    public Farmer findByContact(String contact);
	
	 
	 
}
