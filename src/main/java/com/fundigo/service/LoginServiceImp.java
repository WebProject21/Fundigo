package com.fundigo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundigo.domain.FundhistoryVO;
import com.fundigo.domain.LoginVO;
import com.fundigo.mapper.LoginMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LoginServiceImp implements LoginService {
	
	@Setter(onMethod_= @Autowired)
	private LoginMapper mapper;

	@Override
	public List<FundhistoryVO> getFundList(FundhistoryVO login) {
		log.info("get List-------- ");
		return mapper.getFundList(login);
	}

	@Override
	public List<FundhistoryVO> getFavoriteList(FundhistoryVO login) {
		log.info("get List-------- ");
		return mapper.getFavoriteList(login);
	}

	@Override
	public void ClientJoin(LoginVO login) {
		log.info("login insert: "+login);
		mapper.cInsert(login);
	}

	@Override
	public LoginVO Clientselect(String id) {
		log.info("login select : "+id);
		
		return mapper.cSelect(id);
	}
	
	@Override
	public void Clientupdate(LoginVO login) {
		log.info("login update : "+ login);
		mapper.cUpdate(login);
		
	}

	@Override
	public int Clientwithdraw(LoginVO login) {
		log.info("client delete: "+login);
		
		return mapper.cDelete(login);
	}

	@Override
	public void FavoriteInsert(FundhistoryVO fund) {
		log.info("Client Favorite : "+fund);
		mapper.FpnoInsert(fund);
	}

	@Override
	public LoginVO LoginCheck(LoginVO login) {
		log.info("login check : "+login);
		
		
		return  mapper.Clogin(login) ;
	}
	
	@Override
	public void FavoriteDelete(String id , Long pno) {
		log.info("Favorite Delete");
		
		mapper.FpnoDelete(id, pno);	
	}

	@Override
	public int idCheck(String id) {
		log.info("login id Check"+id);
		return mapper.idCheck(id);
	}

	@Override
	public LoginVO phonecheck(LoginVO login) {
		log.info("phone Check"+login);
		
		return mapper.phonecheck(login);
	}
	
	@Override
	public LoginVO clientCheck(LoginVO login) {
		
		return mapper.cCheck(login);
	}


}
