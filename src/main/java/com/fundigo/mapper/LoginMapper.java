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
	
	public int idCheck(String id);
//	public void CchoseInsert(LoginVO login);
	//login check
	public LoginVO Clogin(LoginVO login);
	//checked
	public LoginVO cSelect (String id);
	//checked
	public int cUpdate (LoginVO login);
	// before the client update 
	public LoginVO cCheck(LoginVO login);
	
	public LoginVO phonecheck (LoginVO login);
	//client delete
	public int cDelete(LoginVO login);
	//funding History view
	public List<FundhistoryVO> getFundList (FundhistoryVO login);
	//FundHistory insert
	public int Finsert(FundhistoryVO fund);
	//FundHisroty delete
	public int Fdelete (@Param("id") String id, @Param("pno") Long pno);
	
	//PnoSelect go product favorite fundhistory
	public void PnoSelect(ProductVO product);

	//favorite select base in id
	public List<FundhistoryVO> getFavoriteList(FundhistoryVO login);
	//favorite insert pno
	public int FpnoInsert(FundhistoryVO fund);
	//favorite delete base in id
	public int FpnoDelete(@Param("id") String id,@Param("pno") Long pno);
	//favorite pno view
	public List<FundhistoryVO> getFpnoList(Long pno);
	//purchased client List in product
	public FundhistoryVO fundSelect(@Param("id") String id, @Param("pno") Long pno);
}