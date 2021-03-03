package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.FundhistoryVO;
import com.fundigo.domain.LoginVO;

public interface LoginService {
	//펀딩 기록 조회하기
	public List<FundhistoryVO> getFundList(String id);
	//favorite 관심목록 조회
	public List<FundhistoryVO> getFavoriteList(String id);
	
	public void ClientJoin(LoginVO login);
	
	public void FavoriteInsert(FundhistoryVO fund);
	
	public void Clientselect(String string);
	
	public void Clientupdate(LoginVO login);

	public boolean Clientwithdraw (LoginVO login);
	
	public boolean FavoirteDelete(String id, Long pno);
	
}