package com.assignment.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO{

private static final List<Product> myProducts = new ArrayList<>();
    
    static int id = 1;
    
    @Override
    public  void insert(Product p) {
        p.setProductId(++id);
        myProducts.add(p);
    }
    @Override 
    public  void remove(int id) {

    			myProducts.stream()
                .filter(p -> p.getProductId()==id)
                .findFirst()
                .map(p -> myProducts.remove(p));

    }
    @Override
    public void update(Product product) {
    		myProducts.stream()
            .filter(p -> p.getProductId() == product.getProductId())
            .findFirst()
            .map(newP -> {
                newP.setQuantity(product.getQuantity());
                newP.setSalesRep(product.getSalesRep());
                newP.setItemID(product.getItemID());
                return newP;
            });
       
    }
    @Override
    public  List<Product> getAllProducts(){
        return myProducts;
    }
	
}
