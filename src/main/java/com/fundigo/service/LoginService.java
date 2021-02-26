package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.LoginVO;

public interface LoginService {
	
	public List<LoginVO> getList();

	public void insert(LoginVO board);

	public void select(LoginVO board);

	public void update(LoginVO board);

	public String delete(LoginVO board);
	
}