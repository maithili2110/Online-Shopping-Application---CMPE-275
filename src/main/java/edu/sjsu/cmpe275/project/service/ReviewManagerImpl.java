package edu.sjsu.cmpe275.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




import edu.sjsu.cmpe275.project.dao.CartDAO;
import edu.sjsu.cmpe275.project.dao.ReviewDAO;
import edu.sjsu.cmpe275.project.entity.CartEntity;
import edu.sjsu.cmpe275.project.entity.ProductEntity;
import edu.sjsu.cmpe275.project.entity.ReviewEntity;

@Service
public class ReviewManagerImpl implements ReviewManager{

	@Autowired
    private ReviewDAO reviewDAO;
	
	public List<ProductEntity> addToReview(ReviewEntity reviewEntity, int productId, int buyerId) {
			
			return reviewDAO.addToReview( reviewEntity, productId, buyerId);
			//return list;
		}
	@Transactional
	public void getReviewRate(ReviewEntity reviewEntity, int productId, int buyerId){
		reviewDAO.getReviewRate( reviewEntity, productId, buyerId);
	}
	
	public Object getReviewById(int id){
		return reviewDAO.getCategorizedReviews(id);
	}
	
	
	
	
}
