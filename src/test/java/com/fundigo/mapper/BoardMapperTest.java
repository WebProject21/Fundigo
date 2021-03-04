package com.fundigo.mapper;

//FAQ(질문), COMM(커뮤니케이션) NOTI(공지)

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fundigo.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	
//	@Test
//	public void testGetListCount() {
//		long count = mapper.getListcount();
//		log.info(count);
//	}
//	
//	@Test
//	public void testGetList() {
//		mapper.getFAQList().forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testFAQInsert() {
//		BoardVO board = new BoardVO();
//		board.setTitle("test2");
//		board.setContent("test2");
//		board.setId("test");
//		
//		mapper.FAQinsert(board);
//		log.info(board);
//	}
//	@Test
//	public void testCOMMInsert() {
//		BoardVO board = new BoardVO();
//		board.setTitle("testCOM");
//		board.setContent("testCOM");
//		board.setId("test");
//		board.setPno("P1");
//		
//		mapper.COMMinsert(board);
//		log.info(board);
//	}
	@Test
	public void testNOTIInsert() {
		
		for(int i = 1; i<= 500; i++) {
			BoardVO board = new BoardVO();
			board.setTitle("testNOTI");
			board.setContent("testNOTI");
			board.setId("test");
			board.setPno("1");
		
			mapper.NOTIinsert(board);
			log.info(board);
		}
	}
	
//	@Test
//	public void testFAQInsertSelectKey() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글 COMM");
//		board.setContent("새로 작성하는 내용");
//		board.setId("test");
//		board.setPno("P1");
//		
//		mapper.COMMinsertSelectKey(board);
//		log.info(board);
//	}
//	@Test
//	public void testCOMMInsertSelectKey() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글 NOTI");
//		board.setContent("새로 작성하는 내용");
//		board.setId("test");
//		board.setPno("P1");
//		
//		mapper.NOTIinsertSelectKey(board);
//		log.info(board);
//	}
//	@Test
//	public void testNOTIInsertSelectKey() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로 작성하는 글");
//		board.setContent("새로 작성하는 내용");
//		board.setId("test");
//		
//		mapper.FAQinsertSelectKey(board);
//		log.info(board);
//	}
	
//	@Test
//	public void testselectOne() {
//		BoardVO board = mapper.selectOne(23L);
//		log.info(board);
//	}
//	
//	@Test
//	public void testDelete() {
//		log.info("DELETE COUNT: "+mapper.delete(4L));
//	}
	
//	@Test
//	public void testUpdate() {
//		BoardVO board = new BoardVO();
//		//실행 전에 존재하는 번호인지 확인할 것
//		board.setBno(7L);
//		board.setTitle("수정되었습니다");
//		board.setContent("내용이 수정되었습니다.");
//		board.setId("test");
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: "+count);
//	}
}
