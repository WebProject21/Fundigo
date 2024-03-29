package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.FundhistoryVO;
import com.fundigo.domain.LoginVO;
import com.fundigo.domain.ProductVO;

public interface LoginService {
	//펀딩 기록 조회하기
	public List<FundhistoryVO> getFundList(FundhistoryVO login);
	//favorite 관심목록 조회
	public List<FundhistoryVO> getFavoriteList(FundhistoryVO login);
	
	public void ClientJoin(LoginVO login);
	
	public LoginVO LoginCheck(LoginVO login);
	
	public int idCheck(String id);
	
	public void FavoriteInsert(FundhistoryVO fund);
	//search for the update
	public LoginVO Clientselect(String id);
	
	public LoginVO clientCheck (LoginVO login);
	
	public void Clientupdate(LoginVO login);
	
	public int Clientwithdraw (LoginVO login);
	
	public void FavoriteDelete(String id, Long pno);
	
	public LoginVO phonecheck(LoginVO login);
	//favorie + fundhistory search
	public void PnoSelect(ProductVO product);
}