package com.fundigo.service;

import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;

public interface MainService {


	public void pRegister(ProductVO product);
	public void lRegister(ListVO list);
	public ProductVO get(Long pno);

}
