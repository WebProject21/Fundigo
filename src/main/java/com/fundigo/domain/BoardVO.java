package com.fundigo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private String bd_type;
	private Long bno;
	private String title;
	private String content;
	private String id;
	private Date regDate;
	private Date updateDate;
}
