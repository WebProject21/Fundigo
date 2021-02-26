package com.fundigo.service;

import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;
import com.fundigo.domain.ReplyVO;

public interface MainService {


	public void pRegister(ProductVO product);
	public void lRegister(ListVO list);
	public ProductVO get(Long pno);
	
}
