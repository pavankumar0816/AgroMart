package com.klef.jfsd.springboot.repository;

import java.util.List; 

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart,Integer>
{
	@Query("SELECT c FROM Cart c WHERE c.productid.id = :productid AND c.customerid.id = :customerid")
	public Cart findByProductIdAndCustomerId(@Param("productid") int productid, @Param("customerid") int customerid);

	@Query("SELECT c FROM Cart c WHERE c.customerid.id = :customerid")
    public List<Cart> findByCustomerId(@Param("customerid") int customerid);
	
	
	  @Query("SELECT COUNT(c) FROM Cart c WHERE c.customerid.id = :customerid")
	  public int countByCustomerId(@Param("customerid") int customerid);

}
