package com.fundigo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	private BoardMapper mapper;
	
	@Override
	public void FAQregister(BoardVO board) {
		log.info("register........."+board);
		mapper.FAQinsertSelectKey(board);	
	}
	@Override
	public void COMMregister(BoardVO board) {
		log.info("register........."+board);
		mapper.COMMinsertSelectKey(board);	
	}
	@Override
	public void NOTIregister(BoardVO board) {
		log.info("register........."+board);
		mapper.NOTIinsertSelectKey(board);	
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get.........."+bno);
		return mapper.selectOne(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify.........."+board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove.........."+bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getFAQList() {
		log.info("getList...........");
		
		return mapper.getFAQList();
	}
	public List<BoardVO> getCOMMList(Long pno) {
		log.info("getList...........");
		
		return mapper.getCOMMList(pno);
	}
	@Override
	public List<BoardVO> getNOTIList(Long pno) {
		log.info("getList...........");
		
		return mapper.getNOTIList(pno);
	}
	@Override
	public boolean countup(BoardVO board) {
		log.info("countup.....");
		return mapper.countup(board) == 1;
	}
	public boolean updateDate(BoardVO board) {
		log.info("updateDate......");
		return mapper.updateDate(board) == 1;
	}
}
