package com.klef.jfsd.springboot.model;

import java.sql.Blob; 
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "products_table")
public class Products 
{
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name="product_id")
  private int id;
  @Column(name="product_category",nullable = false,length = 100)
  private String category;
  @Column(name="product_name",nullable = false,length = 100)
  private String name;
  @Column(name="product_desc",nullable = false,length = 500)
  private String description;
  @Column(name="product_cost",nullable = false)
  private double cost;
  @Column(name="product_image",nullable = false)
  private Blob image;  
  
 
  
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getCategory() {
			return category;
		}
		public void setCategory(String category) {
			this.category = category;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public double getCost() {
			return cost;
		}
		public void setCost(double cost) {
			this.cost = cost;
		}
		public Blob getImage() {
			return image;
		}
		public void setImage(Blob image) {
			this.image = image;
		}

	 
}
