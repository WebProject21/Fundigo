package com.fundigo.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTests {

	
	@Setter(onMethod_ = @Autowired)
	private ReplyService service;
	
	/*
	@Test
	public void insertTest() {
		
		ReplyVO reply = new ReplyVO();
		
		reply.setBno(1L);
		reply.setContent("두번째지만 사실 세번째 댓글");
		reply.setId("gildong");
		
		service.register(reply);
		
		log.info("생성된 댓글의 번호 : "+reply.getRno());
	
	}
	
	@Test
	public void getTest() {
		log.info(service.get(3L));
	}
	
	@Test
	public void modifyTest() {
		
		ReplyVO reply = service.get(3L);
		
		reply.setContent("이것은 바꾼 내용@");
		
		log.info(service.modify(reply));
	}
	
	@Test
	public void getList() {
		service.getList(1L).forEach(reply -> log.info(reply));
	}
	*/
	
	@Test
	public void delete() {
		
		log.info("REMOVE REPLY "+service.remove(3L));
	}
	
	
	
}
