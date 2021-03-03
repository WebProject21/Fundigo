package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.FundhistoryVO;
import com.fundigo.domain.ListVO;

public interface FundhistoryService {

	public List<FundhistoryVO> getList(Long pno);

	public void register(String id, String unkno, Long code);

	public FundhistoryVO get(String id, Long pno);
	
	public boolean remove(String id, Long pno);

}
