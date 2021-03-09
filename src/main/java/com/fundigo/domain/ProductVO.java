package com.fundigo.domain;

import java.util.Date;
import java.util.List;

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
	
	private String tag; //GDLT GAME, DESIGN, LIFE, TECH
	
	private List<ProAttachVO> attachlist;
	
	
}
