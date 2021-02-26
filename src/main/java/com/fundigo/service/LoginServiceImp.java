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
	public void insert(LoginVO login) {
		log.info("login insert: "+login);
		mapper.cInsert(login);
	}

	@Override
	public void select(LoginVO login) {
		
		
	}
	
	

	@Override
	public void update(LoginVO login) {
		
		
	}

	@Override
	public boolean delete(LoginVO login) {
		log.info("client delete: "+login);
		return mapper.cDelete(login)==1;
	}

	@Override
	public void FavoriteInsert(LoginVO login) {
		// TODO Auto-generated method stub
		
	}
	


}
