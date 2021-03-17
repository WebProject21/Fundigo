package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.Criteria;
import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;

public interface ProductService {

	
	public void pRegister(ProductVO product);
	
	public void lRegister(ListVO list);
	
	public ProductVO get(Long pno);
	
	public boolean modify(ProductVO product, List<ListVO> list);
	
	public boolean remove(Long pno);
	
	public boolean listRemove(Long code);
	
	public List<ProductVO> getProducts(); 	//상품 목록
	
	public List<ProductVO> getTagList(String tag); //카테고리별 상품 목록
	
	public List<ListVO> getList(Long pno);	//상품에 따른 리스트 목록
	
	public List<ProductVO> searchList(Criteria cri);
	
	public ListVO getOneList(Long code);
	
	public int getTotal(Criteria cri);
}
