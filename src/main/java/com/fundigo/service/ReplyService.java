package com.fundigo.service;

import java.util.List;

import com.fundigo.domain.Criteria;
import com.fundigo.domain.ReplyDTO;
import com.fundigo.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO reply);
	
	public ReplyVO get(Long rno);
	
	public int modify(ReplyVO reply);
	
	public int remove(Long rno);
	
	public List<ReplyVO> rGetList(Criteria cri,Long bno);

	public List<ReplyVO> rGetList(Long bno);
	
	public ReplyDTO getListPage(Criteria cri, Long bno);
}
