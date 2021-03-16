package com.fundigo.service;

import java.util.HashMap;
import java.util.List;

import com.fundigo.domain.BoardAttachVO;
import com.fundigo.domain.BoardVO;
import com.fundigo.domain.Criteria;

public interface BoardService {
	
	public void FAQregister(BoardVO board);
	public void COMMregister(BoardVO board);
	public void NOTIregister(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	public boolean countup(BoardVO board); 
	public boolean updateDate(BoardVO board);
	
	public boolean remove(Long bno);
	
	public List<BoardVO> getFAQList(Criteria cri);
	public List<BoardVO> getCOMMList(Long pno, Criteria cri);
	public List<BoardVO> getNOTIList(Long pno, Criteria cri);
	long getListcount();
	public List<BoardAttachVO> getAttachList(Long bno);
	
	public int getTotal(HashMap<String, Object>map);
	public int getFAQTotal(HashMap<String, Object>map);
	

}
