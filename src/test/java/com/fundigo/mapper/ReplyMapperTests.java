package com.fundigo.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fundigo.domain.Criteria;
import com.fundigo.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	

	@Test
	public void testList() {
		Criteria cri = new Criteria();
		List<ReplyVO> replies = mapper.rGetListWithPaging(cri, 1000L);
		replies.forEach(reply -> log.info(replies));
	}
	
//	@Test
//	public void getListTest(){
//		mapper.rGetFAQList(1L).forEach(reply -> log.info(reply));
//	}
//	
//	@Test
//	public void testInsertReply() {
//		ReplyVO reply = new ReplyVO();
//		
//		reply.setBno(1L);
//		reply.setContent("이것은 게시물 두번째 댓글입니다.");
//		reply.setId("gildong");
//		
//		mapper.rInsertFAQ(reply);
//		log.info(reply);
//	}
	
	@Test
	public void testUpdateReply() {
		ReplyVO reply = new ReplyVO();
		
		reply.setContent("수정한 내용입니다.");
		reply.setRno(2L);
		
		mapper.rUpdate(reply);
		log.info(reply);
	}
	
	
//	@Test
//	public void testDelete() {
//		
//		log.info("DELETE COUNT - "+mapper.rDelete(2L));
//	}
}
