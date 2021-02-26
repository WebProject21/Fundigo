package com.fundigo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;
import com.fundigo.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MainServicelmpl implements MainService{

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Override
	public void pRegister(ProductVO product) {
		
		
	}
	
	@Override
	public ProductVO get(Long pno) {
	
		log.info("get......"+pno);
		
		mapper.pUpdateCount(pno);		//해당 상품 볼 시에 조회수 증가
		
		return mapper.pRead(pno);
	}

	@Override
	public void lRegister(ListVO list) {
		// TODO Auto-generated method stub
		
	}

	
}
