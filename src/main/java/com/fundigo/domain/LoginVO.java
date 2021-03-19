package com.fundigo.domain;

import lombok.Data;

@Data
public class LoginVO {
	
	private String name;
	private String id;
	private String password;
	private String address;
	private String phone;
	private String nickname;
	
	private String tag;
}