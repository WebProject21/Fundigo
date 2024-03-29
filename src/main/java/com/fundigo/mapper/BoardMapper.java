package com.fundigo.mapper;

import java.util.HashMap;
import java.util.List;

import com.fundigo.domain.BoardVO;
import com.fundigo.domain.Criteria;

public interface BoardMapper {
//	리스트 조회, 질문, 커뮤니티, 공지
	public List<BoardVO> getFAQList();
	public List<BoardVO> getCOMMList();
	public List<BoardVO> getNOTIList();

	public List<BoardVO> getCOMMList(Long pno);
	public List<BoardVO> getNOTIList(Long pno);
	
	public List<BoardVO> getFAQListWithPaging(Criteria cri);
	public List<BoardVO> getCOMMListWithPaging(Criteria cri);
	public List<BoardVO> getNOTIListWithPaging(Criteria cri);
	
//	게시글 1개에 대한 조회
	public List<BoardVO> selectOne();
	public long getListcount();

// insertSelectKey
	public void insertSelectkey(BoardVO board);
	
//	게시글 작성 질문, 커뮤니티, 공지
	public void FAQinsert(BoardVO board);
	public void COMMinsert(BoardVO board);
	public void NOTIinsert(BoardVO board);
// 	
	public void FAQinsertSelectKey(BoardVO board);
	public void COMMinsertSelectKey(BoardVO board);
	public void NOTIinsertSelectKey(BoardVO board);

// 게시글 상세 보기
	public BoardVO selectOne(Long bno);

//	게시글 삭제
	public int delete(Long bno);
	
// 게시글 수정
	public int update(BoardVO board);
	public int countup(Long bno);
	public int updateDate(BoardVO board);
//첨부파일
	public void addAttach(String fullName);
//페이징
	public int getTotalCount(HashMap<String, Object>map);
	public int getFAQTotalCount(HashMap<String, Object>map);
}
