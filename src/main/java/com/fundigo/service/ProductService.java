package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.ProductVO;

public interface ProductService {

	
	public void register(ProductVO product);
	
	public ProductVO get(Long pno);
	
	public boolean modify(ProductVO product);
	
	public boolean remove(Long bno);
	
	public List<ProductVO> getList();
}
