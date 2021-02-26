package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.BoardVO;

public interface BoardService {
	
	public void FAQregister(BoardVO board);
	public void COMMregister(BoardVO board);
	public void NOTIregister(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	public boolean countup(BoardVO board); 
	public boolean updateDate(BoardVO board);
	
	public boolean remove(Long bno);
	
	
	public List<BoardVO> getFAQList();
	public List<BoardVO> getCOMMList(Long pno);
	public List<BoardVO> getNOTIList(Long pno);
	
	
}
