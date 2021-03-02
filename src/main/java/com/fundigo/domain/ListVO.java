package com.fundigo.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ListVO {
	private Long code;
	private String title;
	private String contents;
	private Integer price;
	private Long pno;
}
