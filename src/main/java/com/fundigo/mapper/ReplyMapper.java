package com.fundigo.mapper;

import java.util.List;

import com.fundigo.domain.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> rGetList(Long bno); //한 게시판의 댓글 리스트
	
	public ReplyVO rRead(Long rno);
	
	public void rInsert(ReplyVO reply); //bno 넘버 처리 어떻게 할 것인지
	
	public int rDelete(Long rno);
	
	public int rUpdate(ReplyVO reply);
}
