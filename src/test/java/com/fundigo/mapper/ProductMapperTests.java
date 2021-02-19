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
	
	
	@Test
	public void testGetList() {
		mapper.pGetList().forEach(product -> log.info(product));
	}
	
	@Test
	public void testInsertSelectKey() {
		
		ProductVO product = new ProductVO();
		product.setTitle("솜씨 | 개량 한복의 우아함");
		product.setDescription("전통 한복 명장님과 명인들의 봉제와 침선으로 만들어지는, 우리 옷 한복의 4계절 홈웨어, 일상복 한복집에서 느끼는 섬세함과 디테일을 담아, 우리 옷 한복의 경험을 선물합니다.");
		product.setId("gildong");
		product.setGoalDate("2021-04-08");
		
		product.setGoalPrice(10000000);
		
		ListVO list = new ListVO();
		list.setTitle("세트 01");
		list.setContents("- 물품01\r\n- 물품02\r\n- 물품03");
		list.setPrice(22000);
		mapper.lInsertSelectKey(list); //리스트 삽입
		
		Long code = mapper.getLastCode(); //방금 삽입된 리스트 코드 get
		
		product.setList01(code);
		
		mapper.pInsertSelectKey(product);
		
		log.info(list);
		log.info(product);
		
	}
}
