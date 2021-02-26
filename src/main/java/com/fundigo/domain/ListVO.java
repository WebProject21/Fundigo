package com.fundigo.domain;

import lombok.Data;

@Data
public class ListVO {
	private Long code;
	private String title;
	private String contents;
	private Integer price;
	private Long pno;
}
