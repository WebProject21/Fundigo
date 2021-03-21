package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.FundhistoryVO;

public interface FundhistoryService {

	public List<FundhistoryVO> getList(Long pno);

	public void register(String id, String unkno, Long code);

	public FundhistoryVO get(String id, Long pno);

	public void remove(String id, Long pno);



}
