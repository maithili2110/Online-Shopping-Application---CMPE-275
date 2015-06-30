package edu.sjsu.cmpe275.project.dao;

import java.util.List;




import edu.sjsu.cmpe275.project.entity.ProductEntity;
//import edu.sjsu.cmpe275.project.entity.CartEntity;
import edu.sjsu.cmpe275.project.entity.ReviewEntity;
public interface ReviewDAO {

	public List<ProductEntity> addToReview(ReviewEntity reviewEntity,int productId, int buyerId);
	public void getReviewRate(ReviewEntity reviewEntity, int productId, int buyerId);
	public Object getCategorizedReviews(int id);
	//public void updateReview(ReviewEntity review);

}
