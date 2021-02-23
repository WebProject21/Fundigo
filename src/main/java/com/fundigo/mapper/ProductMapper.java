package com.fundigo.mapper;

import java.util.List;

import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;

public interface ProductMapper {
	
	//productMapper
	public List<ProductVO> pGetList();
	
	public void pInsertSelectKey(ProductVO product);
	
	public void pInsert(ProductVO product);
	
	public ProductVO pRead(Long pno);
	
	public int pDelete(Long pno);
	
	public int pUpdate(ProductVO product);
	
	public int pUpdateCount(Long pno);
	
	//listMapper
	
	public void lInsertSelectKey(ListVO list);
	
	public Long getLastCode();
	
	public List<ListVO> lGetList();
	
	public void lInsert(ListVO list);
	
	public ListVO lRead(Long code);
	
	public int lDelete(Long code);
	
	public int lUpdate(ListVO list);
}
