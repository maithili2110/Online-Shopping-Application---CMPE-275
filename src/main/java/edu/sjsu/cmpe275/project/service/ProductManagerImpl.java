package edu.sjsu.cmpe275.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.sjsu.cmpe275.project.dao.ProductDAO;
import edu.sjsu.cmpe275.project.entity.ProductEntity;

@Service
public class ProductManagerImpl implements ProductManager{
	
	@Autowired
    private ProductDAO productDAO;

	@Transactional
	public void addProduct(ProductEntity product) {
		productDAO.addProduct(product);
	}

	@Transactional
	public List<ProductEntity> getAllProducts() {
		return productDAO.getAllProducts();
	}

	@Transactional
	public void deleteProduct(Integer productId) {
		productDAO.deleteProduct(productId);
	}

	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	public List getCategorizedProducts(String category) {
		return productDAO.getCategorizedProducts(category);
	}
	public List getSearchedProducts(String productName){
		return productDAO.getSearchedProducts(productName);
	}
	public Object getProductById(int id) {
		return productDAO.getCategorizedProducts(id);
	}
	
	@Transactional
	public List<ProductEntity> getSellProducts() {
		return productDAO.getSellProducts();
	}
	
	@Transactional
	public void adminDisapproval(int id) {
		productDAO.adminDisapproval(id);
	}
	
	@Transactional
	public void adminApproval(int productid) {
		productDAO.adminApproval(productid);
	}

	
}
