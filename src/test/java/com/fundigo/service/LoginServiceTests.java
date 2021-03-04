package com.fundigo.service;

import org.junit.Test;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fundigo.domain.LoginVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LoginServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private LoginService service;
	
//	@Test
//	public void LoginCheckTests() {
//		LoginVO login = new LoginVO();
//		login.setId("yacobl");
//		login.setPassword("010401");
//		service.LoginCheck(login);
//	}
	
//	@Test
//	public void testFundList(){
//		service.getFundList("yacobl");
//	}
	
//	@Test
//	public void getFavoriteList() {
//		service.getFavoriteList("yacobl");
//	}
	
//	@Test
//	public void JoinTest() {
//		LoginVO login = new LoginVO();
//		login.setId("yacoblee");
//		login.setName("이승현");
//		login.setPassword("010401");
//		login.setAddress("경기도 성남시");
//		login.setPhone("01040529405");
//		login.setNickname("nickname");
//		login.setTag("gmas");
//		
//		service.ClientJoin(login);
//		
//	}
	
//	@Test
//	public void ClientSelect() {
//		LoginVO login = new LoginVO();
//		login.setId("yacobl");
//		service.Clientselect(login);
//		
//	}
	
//	@Test
//	public void ClientUpdate() {
//		LoginVO login = new LoginVO();
//		login.setPassword("0104021");
//		login.setAddress("경기도 성남시");
//		login.setPhone("01040529406");
//		login.setNickname("이름입니다");
//		login.setTag("game");
//		login.setId("yacoblee");
//		
//		service.Clientupdate(login);
//		
//		
//	}
	
//	@Test
//	public void ClientDelete() {
//		LoginVO login = new LoginVO();
//		
//		login.setId("yacoblee");
//		login.setPassword("010401");
	
//		service.delete(login);
//		
//	}

//	@Test
//	public void FavInsertTest() {
//		FundhistoryVO fund = new FundhistoryVO();
//		fund.setId("yacobl");
//		fund.setPno(12L);
//		service.FavoriteInsert(fund);
//	}
//	@Test
//	public void getFavoriteDelete() {
//		service.FavoirteDelete("yacoblee", 12L);
//		
//	}
	
}