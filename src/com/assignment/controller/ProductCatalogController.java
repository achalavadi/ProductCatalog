package com.assignment.controller;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.assignment.model.Product;
import com.assignment.model.ProductDAO;


@Controller
@EnableWebMvc
public class ProductCatalogController {

	
	private Logger logger = Logger.getLogger(ProductCatalogController.class);

	@Autowired
	ProductDAO productDAO;
	
    @RequestMapping(value = "/products" , method = RequestMethod.GET)
    public String index(ModelMap map) {
        //map.put("users", dAOImpl.getAllPerson());
        map.put("hello", "Hello");
        map.put("allproducts", productDAO.getAllProducts());
        return "products";
    }
	

@RequestMapping( value = "/addProduct" , consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE , method = RequestMethod.POST)
@ResponseBody
public Product addProduct(@RequestBody Product product) {
	
	logger.info("Product : "+product.getItemID());

    if (product.getQuantity()<0) {
        return null;
    }
    productDAO.insert(product);
    
    return product;
}

@RequestMapping(value = "/updateProduct" , method = RequestMethod.PUT)
@ResponseBody
public Product updatePerson(@RequestBody Product product) {
	productDAO.update(product);
    return product;
}

@RequestMapping(value = "/deleteProduct" , method = RequestMethod.DELETE)
@ResponseBody
public void deletePerson(@RequestBody Map<String, String> productId) {
	productDAO.remove(Integer.parseInt(productId.get("productId")));
}


}
