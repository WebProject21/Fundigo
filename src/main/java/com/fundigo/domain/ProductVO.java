package com.fundigo.domain;

import lombok.Data;

@Data
public class ProductVO {
	private Long pno;
	private String title;
	private String description;
	private String id;
	private String regdate;
	private Integer sponsorNum;
	private Integer readCount;
	
	private Long totalPrice;
	private Integer goalPrice;
	private String goalDate; //DateFormat = "yyyy-MM-dd"
	
	
	private String tag;
	
	private String imgsrc;
}
