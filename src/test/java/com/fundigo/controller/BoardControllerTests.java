package com.fundigo.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
					   "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests {
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testListPaging() throws Exception{
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/board/faq")
				.param("pageNum", "2")
				.param("amount","50"))
				.andReturn().getModelAndView().getModelMap());
	}
	
//	@Test
//	public void testFAQList() throws Exception{
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/board/FAQlist"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
//	@Test
//	public void testCOMMList() throws Exception{
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/board/COMMlist"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
//	@Test
//	public void testNOTIList() throws Exception{
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/board/NOTIlist"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
//	@Test
//	public void FAQtestRegister() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/FAQregister")
//				.param("title", "테스트 새글 제목임")
//				.param("content", "테스트 새글 내용임")
//				.param("id", "test")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
//	@Test
//	public void COMMtestRegister() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/COMMregister")
//				.param("title", "테스트 새글 제목임")
//				.param("content", "테스트 새글 내용임")
//				.param("id", "test")
//				.param("pno", "P24")//Pno는 상품페이지에서 받아오는 부분
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
//	@Test
//	public void NOTItestRegister() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/NOTIregister")
//				.param("title", "테스트 새글 제목임")
//				.param("content", "테스트 새글 내용임")
//				.param("id", "test")
//				.param("pno", "P41") //Pno는 상품페이지에서 받아오는 부분
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
// 	
//	1339
//	@Test
//	public void testGet() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/board/get")
//				.param("bno", "12"))
//				.andReturn()
//				.getModelAndView().getModelMap());
//	}
//	@Test
//	public void FAQtestModify() throws Exception{
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/board/FAQmodify")
//				.param("bno", "12")
//				.param("title", "수정해부릇다.")
//				.param("content", "수정해부릇다")
//				.param("id", "test"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
//	@Test
//	public void COMMtestModify() throws Exception{
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/board/COMMmodify")
//						.param("bno", "13")
//						.param("title", "수정해부릇다.")
//						.param("content", "수정해부릇다")
//						.param("id", "test"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
//	@Test
//	public void NOTItestModify() throws Exception{
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/board/NOTImodify")
//						.param("bno", "14")
//						.param("title", "수정해부릇다.")
//						.param("content", "수정해부릇다")
//						.param("id", "test"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testFAQRemove()throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/FAQremove")
//				.param("bno", "24"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
//	@Test
//	public void testCOMMRemove()throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/COMMremove")
//				.param("bno", "6"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
//	@Test
//	public void testNOTIRemove()throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/NOTIremove")
//				.param("bno", "17"))
//				.andReturn().getModelAndView().getViewName();
//		log.info(resultPage);
//	}
//	
	
}
