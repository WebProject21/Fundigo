package com.fundigo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private Long pno;
	private String title;
	private String description;
	private String id;
	private Date regdate;
	private Integer sponsorNum;
	private Integer readCount;
	
	private Long totalPrice;
	private Integer goalPrice;
	private String goalDate; //DateFormat = "yyyy-MM-dd"
	
	private Long list01;
	private Long list02;
	private Long list03;
	private Long list04;
	
	private String tag;
	
	private String imgsrc;
}
