package com.fundigo.mapper;

import java.util.List;

import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProAttachVO;
import com.fundigo.domain.ProductVO;

public interface ProductMapper {
	
	//productMapper
	public List<ProductVO> pGetList();
	
	public List<ProductVO> pGetTagList(String tag);
	
	public void pInsertSelectKey(ProductVO product);
	
	public void pInsert(ProductVO product);
	
	public ProductVO pRead(Long pno);
	
	public int pDelete(Long pno);
	
	public int pUpdate(ProductVO product);
	
	public int pUpdateCount(Long pno);
	
	public void pInsertImg(ProAttachVO img);
	
	public List<ProAttachVO> pGetImgList(Long pno);
	
	public int pDeleteImg(ProAttachVO img);
	
	//알고리즘 추천 기능
	
	//fundhistory에 맞춘 
	
	
	//listMapper
	public Long lInsertSelectKey(ListVO list);
	
	public List<ListVO> lGetList(Long pno);
	
	public void lInsert(ListVO list);
	
	public ListVO lRead(Long code);
	
	public int lDelete(Long code);
	
	public int lUpdate(ListVO list);
}
