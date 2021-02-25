package com.fundigo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private String bd_type;
	private Long rno;
	private String content;
	private String id;
	private Date regDate;
	private Date updateDate;
	
	private Long bno;
}
