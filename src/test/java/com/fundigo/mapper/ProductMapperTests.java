package com.fundigo.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	/*
	@Test
	public void testGetList() {
		mapper.pGetList().forEach(product -> log.info(product));
	}
	*/
	
	@Test
	public void testInsertSelectKey() {
		
		ProductVO product = new ProductVO();
		product.setTitle("아이구 | 개량 한복의 우아함");
		product.setDescription("전통 한복 명장님과 명인들의 봉제와 침선으로 만들어지는, 우리 옷 한복의 4계절 홈웨어, 일상복 한복집에서 느끼는 섬세함과 디테일을 담아, 우리 옷 한복의 경험을 선물합니다.");
		product.setId("gildong");
		product.setGoalDate("2021-04-08");
		product.setGoalPrice(10000000);
		product.setTag("L");
		mapper.pInsertSelectKey(product);
		
		//list01 삽
		ListVO list = new ListVO();
		list.setTitle("세트 01");
		list.setContents("- 물품01\r\n- 물품02\r\n- 물품03");
		list.setPrice(22000);
		list.setPno(product.getPno());
		mapper.lInsertSelectKey(list); //리스트 삽입
		
		
		//list02삽입
		list.setTitle("세트 02");
		list.setContents("- 물품04\r\n- 물품05\r\n- 물품06");
		list.setPrice(34000);
		list.setPno(product.getPno());
		mapper.lInsertSelectKey(list); //리스트 삽입
	
		
		log.info(product);
		
	}
	/*
	@Test
	public void testRead() {
		ProductVO product = mapper.pRead(10L);
		log.info(product);
	}
	
	@Test	
	public void testDelete() {
		ProductVO product = mapper.pRead(15L);
		Long code = product.getList01();
		Long code2 = product.getList02();
		
		log.info("Delete Count "+mapper.pDelete(15L));
		
		mapper.lDelete(code);
		mapper.lDelete(code2);
	}
	
	
	@Test
	public void testUpdate() {
		ProductVO product = mapper.pRead(14L);
		
		product.setTitle("여행 에세이");
		product.setDescription("여행을 가야만 알 수 있는 것들에 대한 이야기입니다.");
		
		Long code1 = product.getList01();
		ListVO list = mapper.lRead(code1);
		list.setContents("이런 내용으로 바꾸겠습니다.");
		list.setTitle("이런 제목으로 바꾸겠습니다.");
		mapper.lUpdate(list);
		
		int count = mapper.pUpdate(product);
		log.info("UPDATE COUNT : "+count);
	}

	
	@Test
	public void testReadCount() {
		log.info("UPDATE COUNT ---- "+mapper.pUpdateCount(11L));
		
	}
	*/
}
