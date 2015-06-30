package edu.sjsu.cmpe275.project.service;

import java.util.List;

import edu.sjsu.cmpe275.project.entity.CartEntity;
import edu.sjsu.cmpe275.project.entity.ProductEntity;
import edu.sjsu.cmpe275.project.entity.ReviewEntity;
public interface ReviewManager {

	public List<ProductEntity> addToReview(ReviewEntity reviewEntity, int productId, int buyerId);
	public void getReviewRate(ReviewEntity reviewEntity, int productId, int buyerId);
	public Object getReviewById(int id);
	//public void updateReview(ReviewEntity review); 

}
