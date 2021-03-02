package com.fundigo.service;

import java.text.SimpleDateFormat;
import java.util.Date;

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
public class BoardServiceTests {
	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
//	
//	@Test
//	public void testFAQRegister() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로운 서비스");
//		board.setContent("신규 내용");
//		board.setId("test");
//		
//		service.FAQregister(board);
//		log.info("생서된 게시물의 번호 : "+ board.getBno());
//	}
//	@Test
//	public void testCOMMInsert() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로운 커뮤니티");
//		board.setContent("testCOM");
//		board.setId("test");
//		board.setPno("P1");
//		
//		service.COMMregister(board);
//		log.info(board);
//	}
//	@Test
//	public void testNOTIInsert() {
//		BoardVO board = new BoardVO();
//		board.setTitle("새로운 공지");
//		board.setContent("testNOTI");
//		board.setId("test");
//		board.setPno("P1");
//		
//		service.NOTIregister(board);
//		log.info(board);
//	}
//	@Test
//	public void testGetFAQList() {
//		service.getFAQList().forEach(board -> log.info(board));
//	}
//	@Test
//	public void testGetCOMMList() {
//		service.getCOMMList().forEach(board -> log.info(board));
//	}
//	@Test
//	public void testGetNOTIList() {
//		service.getNOTIList().forEach(board -> log.info(board));
//	}
	@Test
	public void testGet() {
		BoardVO board = service.get(23L);
		if(board == null) {
			return;
		}
		service.countup(board);
		log.info(service.get(23L));
	}
//
//	@Test
//	public void testDelete() {
//		log.info("Remove Result: "+service.remove(5L));
//	}
//	@Test
//	public void testUpdate() {
//		BoardVO board = service.get(6L);
//		
//		if(board == null) {
//			return;
//		}
//		
//		board.setTitle("제목을 수정하였습니다.");
//		log.info("Modify Result:"+service.modify(board));
//	}
//	@Test
//	public void testReadCount() {
//		BoardVO board = service.get(16L);
//		if(board == null) {
//			return;
//		}
//		log.info("updateCount"+service.countup(board));
//	}
	@Test
	public void testUpdateDate() {
		BoardVO board = service.get(20L);
		if(board == null) {
			return;
		}
		Date today = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
		String updatedate = format.format(today);
		board.setUpdateDate(updatedate);
		log.info("updateDate"+service.updateDate(board));
	}
}