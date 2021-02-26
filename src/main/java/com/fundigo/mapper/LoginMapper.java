package com.fundigo.mapper;

import java.util.List;

import com.fundigo.domain.FundhistoryVO;
import com.fundigo.domain.LoginVO;
import com.fundigo.domain.ProductVO;



public interface LoginMapper {
	//not yet
	public List<LoginVO> getList();
	//checked
	public void cInsert(LoginVO login);
	//null values
	public void CchoseInsert(LoginVO login);
	//checked
	public void cSelect (LoginVO login);
	//checked
	public int cUpdate (LoginVO login);
	//checked
	public int cDelete(LoginVO login);
	
	public List<FundhistoryVO> getFundList (String id);
	//checked
	public int Finsert(FundhistoryVO fund);
	//not yet
	public void PnoSelect(ProductVO product);
	//checked
	public List<FundhistoryVO> getFavoriteList(String id);
	
	public int Fdelete (FundhistoryVO fund);
	
	public void getFpnoList(FundhistoryVO fund);
}