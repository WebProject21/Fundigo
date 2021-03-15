package com.fundigo.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fundigo.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {

	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	/*
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	
	@Test
	public void testRegister() {
		
		ProductVO product = new ProductVO();
		product.setTitle("에구구 | 개량 한복의 우아함");
		product.setDescription("전통 한복 명장님과 명인들의 봉제와 침선으로 만들어지는, 우리 옷 한복의 4계절 홈웨어, 일상복 한복집에서 느끼는 섬세함과 디테일을 담아, 우리 옷 한복의 경험을 선물합니다.");
		product.setId("gildong");
		product.setGoalDate("2021-04-10");
		product.setGoalPrice(10000000);
		product.setTag("D");
		
		service.pRegister(product);
		
		// 어떻게 다중 처리할지 생각하기!!!!!!
		
		//list01
		ListVO list = new ListVO();
		list.setTitle("세트 01");
		list.setContents("- 물품01\r\n- 물품02\r\n- 물품03");
		list.setPrice(22000);
		list.setPno(product.getPno());
		
		service.lRegister(list);
		
		//list02삽입
		list.setTitle("세트 02");
		list.setContents("- 물품04\r\n- 물품05\r\n- 물품06");
		list.setPrice(34000); //리스트 삽입
		list.setPno(product.getPno());
		
		service.lRegister(list);
		
		
		log.info("생성된 상품번호 : "+product.getPno());
		
	}
	
 	@Test
 	public void testGetList() {
 		
 		service.getList().forEach(product -> log.info(product));
 		
 		service.getTagList("G").forEach(product -> log.info(product));
 	}
 
	@Test
	public void testGet() {
		log.info(service.get(16L));
	}

	@Test
	public void testDelete() {
		log.info(service.remove(19L));
	}

	
	@Test
	public void testModify() {
		
		ProductVO product = service.get(21L);
		
		if(product == null) {
			return;
		}
		
		product.setTitle("고쳐졌으면 한다...");
		List<ListVO> lists = service.getList(product.getPno());
		
		ListVO list = lists.get(0);
		list.setContents("바뀌었으면 한다...");
		
		log.info("MODIFY RESULT :"+service.modify(product, lists));
		
	}
	*/
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("구");
		service.searchList(cri).forEach(result->log.info(result));;
	}
}
