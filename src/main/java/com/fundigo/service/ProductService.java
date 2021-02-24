package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;

public interface ProductService {

	
	public void pRegister(ProductVO product);
	
	public void lRegister(ListVO list);
	
	public ProductVO get(Long pno);
	
	public boolean modify(ProductVO product, List<ListVO> list);
	
	public boolean remove(Long pno);
	
	public boolean listRemove(Long code);
	
	public List<ProductVO> getProducts(); 	//��ǰ ���
	
	public List<ProductVO> getTagList(String tag); //ī�װ��� ��ǰ ���
	
	public List<ListVO> getList(Long pno);	//��ǰ�� ���� ����Ʈ ���
}