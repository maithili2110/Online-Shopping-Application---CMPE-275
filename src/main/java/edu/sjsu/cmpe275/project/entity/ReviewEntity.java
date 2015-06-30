package edu.sjsu.cmpe275.project.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="review")
public class ReviewEntity {

    @Id
    @Column(name="reviewId")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer reviewId;
    
    @Column(name="buyerId")
    private int buyerId;
 
    @Column(name="productId")
    private int productId;
    
    @Column(name="review")
    private String review;
    
    @Column(name="rate")
    private int rate;
    
    public Integer getReviewId() {
		return reviewId;
	}
    public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}
    public Integer getBuyerId() {
		return buyerId;
	}
    public void setBuyerId(Integer buyerId) {
		this.buyerId = buyerId;
	}
    public Integer getProductId() {
		return productId;
	}
    public void setProductId(Integer productId) {
		this.productId = productId;
    }
    public String getReview() {
		return review;
	}
    public void setReview(String review) {
		this.review = review;
	}
    public Integer getRate() {
		return rate;
	}
    public void setRate(Integer rate) {
		this.rate = rate;
	}
    
}
    
     