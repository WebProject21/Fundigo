package com.fundigo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundigo.domain.FundhistoryVO;
import com.fundigo.domain.ListVO;
import com.fundigo.mapper.LoginMapper;
import com.fundigo.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FundhistoryServiceImp implements FundhistoryService{
	
	@Setter(onMethod_ = @Autowired)
	private LoginMapper mapper;
	private ProductMapper pMapper;

	@Override
	public List<FundhistoryVO> getList(Long pno) {
		// TODO Auto-generated method stub
		log.info("get fundhistory by pno"+pno);
		
		return mapper.getFpnoList(pno);
	}

	@Override
	public void register(String id, String unkno, Long code) {
		// TODO Auto-generated method stub
		
		ListVO list = pMapper.lRead(code);
		
		FundhistoryVO fund = new FundhistoryVO();
		fund.setCode(list.getCode());
		fund.setPno(list.getPno());
		fund.setPrice(list.getPrice());
		fund.setUnkno(unkno);
		fund.setId(id);
		
		
		log.info("register......."+fund);
		
		
		mapper.Finsert(fund);
	}

	@Override
	public FundhistoryVO get(String id, Long pno) {
		// TODO Auto-generated method stub
		log.info("select......");
		
		return mapper.fundSelect(id, pno);
	}

	@Override
	public boolean remove(String id, Long pno) {
		// TODO Auto-generated method stub
		log.info("delete.......");
		
		return mapper.Fdelete(id, pno) == 1;
	}


	
}
