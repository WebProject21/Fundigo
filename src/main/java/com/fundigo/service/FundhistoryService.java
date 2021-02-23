package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.FundhistoryVO;


public interface FundhistoryService {

	public List<FundhistoryVO> getList();

	public void insert(FundhistoryVO fund);

	public void select(FundhistoryVO fund);

	public void update(FundhistoryVO fund);

	public String delete(FundhistoryVO fund);
}
