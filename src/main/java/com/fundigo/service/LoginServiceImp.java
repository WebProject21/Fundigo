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
	public List<FundhistoryVO> getFundList(String id) {
		log.info("get List-------- ");
		return mapper.getFundList(id);
	}

	@Override
	public List<FundhistoryVO> getFavoriteList(String id) {
		log.info("get List-------- ");
		return mapper.getFavoriteList(id);
	}

	@Override
	public void ClientJoin(LoginVO login) {
		log.info("login insert: "+login);
		mapper.cInsert(login);
	}

	@Override
	public void Clientselect(LoginVO login) {
		log.info("login select : "+login);
		mapper.cSelect(login);
	}
	

	@Override
	public void Clientupdate(LoginVO login) {
		log.info("login update : "+ login);
		mapper.cUpdate(login);
		
	}

	@Override
	public boolean Clientwithdraw(LoginVO login) {
		log.info("client delete: "+login);
		return mapper.cDelete(login)==1;
	}

	@Override
	public void FavoriteInsert(FundhistoryVO fund) {
		log.info("Client Favorite : "+fund);
		mapper.FpnoInsert(fund);
		
		
	}

	@Override
	public void FavoirteDelete(FundhistoryVO fund) {
		
		
	}
	
}
