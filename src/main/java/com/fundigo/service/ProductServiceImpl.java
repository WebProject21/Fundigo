package com.fundigo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundigo.domain.Criteria;
import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;
import com.fundigo.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Override
	public void pRegister(ProductVO product) {
		
		log.info("product - register......"+product);
		mapper.pInsertSelectKey(product);
		
		if(product.getAttachList() == null || product.getAttachList().size() <= 0) {
			System.out.println("product--null이 들어가 있음.");
			return;
		}
		
		product.getAttachList().forEach(attach ->{
			attach.setPno(product.getPno());
			mapper.pInsertImg(attach);
		});
		
	}
	
	@Override
	public void lRegister(ListVO list) {
		log.info("list - register......"+list);
		mapper.lInsertSelectKey(list);
		
	}
	
	
	@Override
	public ProductVO get(Long pno) {
	
		log.info("get......"+pno);
		
		mapper.pUpdateCount(pno);		//해당 상품 볼 시에 조회수 증가
		
		return mapper.pRead(pno);
	}

	@Override
	public boolean modify(ProductVO product, List<ListVO> lists) {
		
		log.info("modify....."+product);
		 
		for(int i = 0; i<lists.size(); i++) {
			mapper.lUpdate(lists.get(i));
		}
		
		return mapper.pUpdate(product)==1;
	}

	@Override
	public boolean remove(Long pno) {
		// TODO Auto-generated method stub
		
		log.info("remove....."+pno);
		
		return mapper.pDelete(pno) == 1;
	}//리스트와 프로덕트 한꺼번에 지움

	@Override
	public boolean listRemove(Long code) {
		
		log.info("list remove...."+code);
		
		return false;
	}//리스트만 따로 지움
	
	@Override
	public List<ProductVO> getProducts() {
		// TODO Auto-generated method stub
		
		log.info("get List......");
		
		return mapper.pGetList();
	}
	
	@Override
	public List<ProductVO> getTagList(String tag){
		
		log.info("get Tag List......");
		
		return mapper.pGetTagList(tag);
	}

	@Override
	public List<ListVO> getList(Long pno) {
		// TODO Auto-generated method stub
		
		log.info("get List......");
		
		return mapper.lGetList(pno);
	}

	@Override
	public List<ProductVO> searchList(Criteria cri) {
		// TODO Auto-generated method stub
		
		log.info("search List....");
		
		return mapper.getSearchListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		
		log.info("get total product Count");
		
		return mapper.pGetTotalCount(cri);
	}

	@Override
	public ListVO getOneList(Long code) {
		// TODO Auto-generated method stub
		return mapper.lRead(code);
	}
}
