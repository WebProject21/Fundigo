package com.fundigo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundigo.domain.ProductVO;
import com.fundigo.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Override
	public void register(ProductVO product) {
		// TODO Auto-generated method stub

	}

	@Override
	public ProductVO get(Long pno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(ProductVO product) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ProductVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

}
