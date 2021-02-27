package com.fundigo.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fundigo.domain.FundhistoryVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FundhistoryServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private FundhistoryService service;
	
	/*
	@Test
	public void getListTest() {
		service.getList(21L).forEach(fundhistory -> log.info(fundhistory));
	}
	
	@Test
	public void registerTest() {
		service.register("gilsun", "B", 26L);
	}
	
	@Test
	public void getTest() {
		service.get("gilsun", 20L);
	}
	*/
	
	@Test
	public void removeTest() {
		service.remove("gilsun", 20L);
	}
}
