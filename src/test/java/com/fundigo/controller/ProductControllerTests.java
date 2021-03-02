package com.fundigo.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;
import com.google.gson.Gson;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class ProductControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	/*
	@Test
	public void testGet() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/product/view")
				.param("pno", "10"))
				.andReturn()
				.getModelAndView().getModelMap());
	}

	@Test
	public void testCOMMList() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/product/community")
				.param("pno", "11"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	*/
	@Test
	public void testRegister() throws Exception{
		
		ProductVO product = new ProductVO();
		product.setTitle("에구구 | 개량 한복의 우아함");
		product.setDescription("전통 한복 명장님과 명인들의 봉제와 침선으로 만들어지는, 우리 옷 한복의 4계절 홈웨어, 일상복 한복집에서 느끼는 섬세함과 디테일을 담아, 우리 옷 한복의 경험을 선물합니다.");
		product.setId("gildong");
		product.setGoalDate("2021-04-26");
		product.setGoalPrice(30000000);
		product.setTag("D");
		

		List<ListVO> lists = new ArrayList<ListVO>();
		
		ListVO list = new ListVO();
		
		for(int i = 0; i< 2; i++) {
			list.setTitle("세트 01");
			list.setContents("- 물품01\r\n- 물품02\r\n- 물품03");
			list.setPrice(22000);
			list.setPno(product.getPno());
			lists.add(i, list);
		}
	
		String json = new Gson().toJson(product);
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/product/register")
				.contentType(MediaType.APPLICATION_JSON)
				.content(json))
				.andExpect(status().isOk())
				.andReturn();
				
		
		log.info(resultPage);
		
	}	 
	/*
	@Test
	public void testSponsor() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/product/sponsor")
				.param("pno", "21"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
	
	@Test
	public void testBoardView() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/product/boardView")
				.param("bno", "1"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	*/
}
