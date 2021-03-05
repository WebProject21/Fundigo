package com.fundigo.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class LoginControllerTests {

	@Setter(onMethod_ = { @Autowired })
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

//	@Test
//	public void LoginCheckControllerTests() throws Exception{
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/mypage/memberLogin")
//				.param("id", "yacobl")
//				.param("password", "010401"))
//				.andReturn().getModelAndView().getModelMap()); 
//	}

//	@Test
//	public void LoginJoinControllerTests () throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/mypage/JoinPage")
//				.param("id", "yac")
//				.param("name", "김민지")
//				.param("password", "010401")
//				.param("address", "강남구")
//				.param("phone", "01040529406")
//				.param("nickname", "별묭")
//				.param("tag", "gmae")
//				).andReturn().getModelAndView().getModelMap());
//	
//	}
	// not yet
//	@Test
//	public void WithdrawControllertests() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/mypage/memberLogin")
//				.param("id", "yacoblee")
//				.param("password", "010401")
//				).andReturn().getModelAndView().getModelMap());
//	}

	@Test
	public void FundListContrllerTests() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/mypage/favorite")
				.param("password", "010401")
				.param("address", "강남구")
				.param("phone", "01040529406")
				.param("nickname", "별묭")
				.param("tag", "gmae")
				.param("id", "yacobl")
				).andReturn().getModelAndView().getModelMap());
	}
}
