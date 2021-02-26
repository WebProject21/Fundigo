package com.fundigo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<LoginVO> getList() {
		log.info("getList: ");
		return null;
	}

	@Override
	public void insert(LoginVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void select(LoginVO board) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String delete(LoginVO board) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(LoginVO board) {
		// TODO Auto-generated method stub
		
	}
	
}
