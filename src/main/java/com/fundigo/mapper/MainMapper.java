package com.fundigo.mapper;

import java.util.List;

import com.fundigo.domain.ProductVO;

public interface MainMapper {

	public List<ProductVO> pGetList();	
	public List<ProductVO> pGetTagList(String tag);
	
}
