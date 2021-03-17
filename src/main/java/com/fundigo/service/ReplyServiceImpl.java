package com.fundigo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundigo.domain.Criteria;
import com.fundigo.domain.ReplyVO;
import com.fundigo.mapper.BoardMapper;
import com.fundigo.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	private BoardMapper bMapper;
	
	@Override
	public int register(ReplyVO reply) {
		// TODO Auto-generated method stub
		log.info("register...."+reply);
		
		String bd_type = bMapper.selectOne(reply.getBno()).getBd_type();
		
		reply.setBd_type(bd_type);
		
		return mapper.rInsert(reply);
	}

	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		
		return mapper.rRead(rno);
	}

	@Override
	public int modify(ReplyVO reply) {
		// TODO Auto-generated method stub
		
		log.info("modify......"+reply);
		
		return mapper.rUpdate(reply);
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		log.info("remove...."+rno);
		
		return mapper.rDelete(rno);
	}

	@Override
	public List<ReplyVO> rGetList(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		
		log.info("list of board...."+bno);
		
		return mapper.rGetListWithPaging(cri, bno);
	}
	@Override
	public List<ReplyVO> rGetList(Long bno) {
		// TODO Auto-generated method stub
		
		log.info("list of board...."+bno);
		
		return mapper.rGetList(bno);
	}
	
}
