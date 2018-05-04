package com.assignment.model;

import java.util.List;



public interface ProductDAO {

	
    public  void insert(Product p);
    public  List<Product> getAllProducts();
    public  void update(Product product);
    public  void remove(int productId);   
}
