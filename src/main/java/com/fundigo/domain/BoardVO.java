package com.fundigo.domain;

import java.util.List;
import lombok.Data;

@Data
public class BoardVO {
	
	private String bd_type;
	private Long bno;
	private String title;
	private String content;
	private String id;
	private String regDate;
	private String updateDate;
	private String pno;
	private String readCount;
	private String[] files;
	
	private List<BoardAttachVO> attachList;
}
