package com.fundigo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fundigo.domain.BoardVO;
import com.fundigo.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl  implements BoardService{

	@Setter(onMethod_ = @Autowired)
	private BoardMapper bmapper;
	
	@Override
	public void FAQregister(BoardVO board) {
		log.info("register........."+board);
		bmapper.FAQinsertSelectKey(board);	
	}
	@Override
	public void COMMregister(BoardVO board) {
		log.info("register........."+board);
		bmapper.COMMinsertSelectKey(board);	
	}
	@Override
	public void NOTIregister(BoardVO board) {
		log.info("register........."+board);
		bmapper.NOTIinsertSelectKey(board);	
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get.........."+bno);
		return bmapper.selectOne(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify.........."+board);
		return bmapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove.........."+bno);
		return bmapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getFAQList() {
		log.info("getList...........");
		
		return bmapper.getFAQList();
	}
	@Override
	public List<BoardVO> getCOMMList(Long pno) {
		log.info("getList...........");
		
		return bmapper.getCOMMList(pno);
	}
	@Override
	public List<BoardVO> getNOTIList(Long pno) {
		log.info("getList...........");
		
		return bmapper.getNOTIList(pno);
	}
	@Override
	public boolean countup(BoardVO board) {
		log.info("countup.....");
		return bmapper.countup(board) == 1;
	}
	@Override
	public boolean updateDate(BoardVO board) {
		log.info("updateDate......");
		return bmapper.updateDate(board) == 1;
	}
	@Override
	public long getListcount() {
		log.info("count..........");
		return bmapper.getListcount();
	}
	
	@Transactional//트랜젝션 처리 메소드로 설정
	public void create(BoardVO board) throws Exception {
		String title = board.getTitle();
		String content = board.getContent();
		String id = board.getId();
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		id = id.replace("<", "&lt;");
		id = id.replace("<", "&gt;");
		title = title.replace(" ", "&nbsp;&nbsp;");
		id = id.replace(" ", "&nbsp;&nbsp;");
		content = content.replace("\n", "<br>");
		board.setTitle(title);
		board.setContent(content);
		board.setId(id);
		Model model = new Model();
	}

}
