package com.fundigo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fundigo.domain.Criteria;
import com.fundigo.domain.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> rGetListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno); //한 게시판의 댓글 리스트
	
	public List<ReplyVO> rGetList(Long bno);
	
	public ReplyVO rRead(Long rno);
	
	public int rInsert(ReplyVO reply); //bno 넘버 처리 어떻게 할 것인지
	
	public int rDelete(Long rno);
	
	public int rUpdate(ReplyVO reply);
}
