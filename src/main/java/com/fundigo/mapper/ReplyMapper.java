package com.fundigo.mapper;

import java.util.List;

import com.fundigo.domain.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> rGetFAQList(Long bno);	//고객 게시판 댓글 리스트
	public List<ReplyVO> rGetCOMMList(Long bno); //상품커뮤니티 게시판 댓글 리스트
	public List<ReplyVO> rGetNOTIList(Long bno); //공지 게시판 댓글 리스트
	
	public void rInsertFAQ(ReplyVO reply); //bno 넘버 처리 어떻게 할 것인지
	public void rInsertCOMM(ReplyVO reply);
	public void rInsertNOTI(ReplyVO reply);
	
	public int rDelete(Long rno);
	
	public int rUpdate(ReplyVO reply);
}
