package com.fundigo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fundigo.domain.FundhistoryVO;
import com.fundigo.domain.LoginVO;
import com.fundigo.domain.ProductVO;



public interface LoginMapper {
	//not yet
	public List<LoginVO> getList();
	//client join
	public void cInsert(LoginVO login);
	//null values
//	public void CchoseInsert(LoginVO login);
	//login check
	public void Clogin(LoginVO login);
	//checked
	public void cSelect (LoginVO login);
	//checked
	public int cUpdate (LoginVO login);
	//checked
	public void cDelete(LoginVO login);
	//funding History view
	public List<FundhistoryVO> getFundList (String id);
	//FundHistory insert
	public int Finsert(FundhistoryVO fund);
	//FundHisroty delete
	public int Fdelete (@Param("id") String id, @Param("pno") Long pno);
	
	//PnoSelect go product
	public void PnoSelect(ProductVO product);
	
	//favorite select base in id
	public List<FundhistoryVO> getFavoriteList(String id);
	//favorite insert pno
	public int FpnoInsert(FundhistoryVO fund);
	//favorite delete base in id
	public int FpnoDelete(@Param("id") String id,@Param("pno") Long pno);
	//favorite pno view
	public List<FundhistoryVO> getFpnoList(Long pno);
	//fundItem client List
	public FundhistoryVO fundSelect(@Param("id") String id, @Param("pno") Long pno);
}