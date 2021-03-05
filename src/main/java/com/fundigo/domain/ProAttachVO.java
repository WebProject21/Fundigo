package com.fundigo.domain;

import lombok.Data;

@Data
public class ProAttachVO {
	
	private Long uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long pno;
}
