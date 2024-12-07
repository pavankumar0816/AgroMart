package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Products;

@Repository
public interface ProductRepository extends CrudRepository<Products, Integer>
{
	@Query("from Products p where p.category=?1 ")
	public List<Products> viewallproductsbycategory(String category);

}
