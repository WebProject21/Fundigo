package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.ReplyVO;

public interface ReplyService {

	public void register(ReplyVO reply);
	
	public ReplyVO get(Long rno);
	
	public boolean modify(ReplyVO reply);
	
	public boolean remove(Long rno);
	
	public List<ReplyVO> getList(Long bno);
}
