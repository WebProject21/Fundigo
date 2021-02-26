package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.FundhistoryVO;
import com.fundigo.domain.LoginVO;

public interface LoginService {
	//펀딩 기록 조회하기
	public List<FundhistoryVO> getFundList(String id);
	//관심목록 조회
	public List<FundhistoryVO> getFavoriteList(String id);
	
	public void insert(LoginVO login);
	
	public void FavoriteInsert(LoginVO login);
	
	public void select(LoginVO login);
	
	public void update(LoginVO login);

	public boolean delete(LoginVO login);
	
	
	
}