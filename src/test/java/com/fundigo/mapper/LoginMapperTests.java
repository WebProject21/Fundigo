package com.fundigo.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fundigo.domain.LoginVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class LoginMapperTests {

	@Setter(onMethod_ = @Autowired)
	private LoginMapper mapper;
	
	
	@Test
	public void PhoneCheck() {
		LoginVO login = new LoginVO();
		login.setPhone("01040529406");
		mapper.phonecheck(login);
		log.info("phone check"+login);
	}
	
//	@Test
//	public void LoginCheckTests() {
//		LoginVO login = new LoginVO();
//		login.setId("yacobl");
//		login.setPassword("010401");
//		mapper.Clogin(login);
//		log.info("login check: "+login);
//	}
	
//	@Test
//	public void idCheckTests() {
//	
//		int count = mapper.idCheck("yacobl");
//		log.info("ID Check"+count);
//	}
	/*
	 * @Test public void testGetList() {
	 * mapper.getList().forEach(board->log.info(board)); }
	 * 
	 * // @Test public void testInsert() { BoardVO board = new BoardVO();
	 * board.setTitle("?���? ?��?��?��?�� �?");
	 * board.setContent("?���? ?��?��?��?�� ?��?��"); board.setWriter("newbie");
	 * 
	 * mapper.insert(board);
	 * 
	 * log.info(board); }
	 */

	/*
	 * @Test public void testUpdate() { LoginVO login = new LoginVO();
	 * login.setPassword("1234"); login.setAddress("��⵵ ������ �д籸");
	 * login.setPhone("01040231111"); login.setNickname("�����Դϴ�.");
	 * login.setTag("tagvalue"); login.setId("yacobl");
	 * 
	 * int count = mapper.cUpdate(login); log.info("cUpdate value: "+count);
	 * 
	 * }
	 */

	// confirm success = 1 but fail = 0
	/*
	 * @Test public void testDelete() { LoginVO login = new LoginVO();
	 * login.setId("yacos"); login.setPassword("12343");
	 * 
	 * int count = mapper.cDelete(login); log.info("delete confirm: "+ count);
	 * 
	 * 
	 * }
	 */

	/*
	 * @Test public void testRead() { BoardVO board = mapper.read(5L);
	 * 
	 * log.info(board); }
	 */
	/*
	 * @Test public void testDelete() {
	 * log.info("DELETEcOUNT : "+mapper.delete(3L)); }
	 */

	/*
	 * @Test public void testInsert() { LoginVO login = new LoginVO();
	 * 
	 * login.setId("yacos"); login.setName("�̽���"); login.setPassword("12343");
	 * login.setAddress("��⵵"); login.setPhone("01030221234");
	 * login.setNickname("���D"); login.setTag("");
	 * 
	 * mapper.cInsert(login); log.info(login); }
	 */

//	
//	  @Test public void Cselect() { LoginVO login = new LoginVO();
//	  login.setId("yacobl");
//	  
//	  mapper.cSelect(login); log.info(login); }
//	 

//	@Test
//	public void testFavorite() {
//		FundhistoryVO fund = new FundhistoryVO();
//		fund.setId("yacobl");
//
//		mapper.Fselect(fund);
//		log.info(fund);
//	}

//	@Test
//	public void testFinsert() {
//		FundhistoryVO fund = new FundhistoryVO();
//		fund.setId("yacobl");
//		fund.setPno(12);
//		fund.setDates(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()).toString());
//		fund.setUnkno("nick");
//		fund.setPrice(1002);
//		fund.setCode(code);(1);
//
//		int count = mapper.Finsert(fund);
//
//		log.info("count number : " + count);
//	}

//	@Test
//	public void testFundSelect() {
//		FundhistoryVO fund = new FundhistoryVO();
//		fund.setId("yacobl");
//	
//		 mapper.Fundhselect(fund);
//		log.info("fundHistory : " + fund);
//	}

//	@Test
//	public void pnoSelect() {
//		ProductVO product= new ProductVO();
//		
//		product.setPno(12L);
//		mapper.PnoSelect(product);
//		log.info(product);
//	}
	/*
	 * @Test public void FundPnoSelect() { FundhistoryVO fund = new FundhistoryVO();
	 * fund.setPno(12L);
	 * 
	 * mapper.getFpnoList(fund); log.info("FundHistory Pno Select : "+ fund); }
	 */

//	@Test
//	public void fundSelectTest() {
//		log.info(mapper.fundSelect("gilsun", 20L));
//	}
}