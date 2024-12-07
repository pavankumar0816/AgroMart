package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.ProductOrder;

@Repository
public interface ProductOrderRepository extends JpaRepository<ProductOrder, Integer>
{
	
	@Query("SELECT po FROM ProductOrder po JOIN FETCH po.product JOIN FETCH po.customer WHERE po.customer.id = :cid")
	List<ProductOrder> findByCustomerId(@Param("cid") int cid);
}
