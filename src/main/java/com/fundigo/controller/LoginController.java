package com.fundigo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fundigo.domain.FundhistoryVO;
import com.fundigo.domain.LoginVO;
import com.fundigo.service.FundhistoryService;
import com.fundigo.service.LoginService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sendmessage.SendMessage;


@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class LoginController  {

	private LoginService lService;
	private FundhistoryService fService;
	
	@RequestMapping(value="/memberLogin" , method = {RequestMethod.POST,RequestMethod.GET})
	public void memberLogin(LoginVO login, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		HttpSession session = req.getSession();
		LoginVO member = lService.LoginCheck(login);
		log.info("login "+member);
		if(member ==null){
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",false);
			log.info("fail login");
		}else if (member != null) {
			log.info("login success");
		session.setAttribute("member", login);
		}
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		log.info("logout Success");
		
		return "redirect:/mypage/memberLogin";
	}

	

//	@PostMapping("/memberLogin_login")
//	public String memberLogin(LoginVO login, RedirectAttributes rttr) {
//		log.info("login : " + login);
//		lService.LoginCheck(login);
//		rttr.addFlashAttribute("result", login.getId());
//
//		return "redirect:/mypage/favorite?id=" + login.getId();
//
//	}

	 @RequestMapping(value="/JoinPage" , method = {RequestMethod.POST,RequestMethod.GET})
	public void JoinPage(LoginVO login, RedirectAttributes rttr) throws Exception{
		log.info("Join Page Post");
		int count = lService.idCheck(login.getId());
		try {
			if(count==0)
				lService.ClientJoin(login);
			log.info("회원 가입 되었습니다!!!");
			
		} catch (Exception e) {
			log.info("--------존재하는 아이디 입니다 --------");
		}
		rttr.addFlashAttribute("join Result" + login.getId());
//		return "redirect:/mypage/memberLogin";
		
		
	}
//	 @RequestMapping(value="/JoinPage" , method = RequestMethod.POST)
//	 public String JoinPage(LoginVO login, RedirectAttributes rttr) throws Exception{
//		 log.info("Join Page Post");
////		int count = lService;
//		 lService.ClientJoin(login);
//		 rttr.addFlashAttribute("join Result" + login.getId());
//		 return "redire5554ct:/mypage/favorite?id=" + login.getId();
//	 }
	 
	 @ResponseBody
	 @RequestMapping(value="/idCheck", method=RequestMethod.POST)
	 public int IdCheck(@RequestBody String id) throws Exception {
	        
	        int count = 0;
	        count = lService.idCheck(id);
	        log.info("count : "+count);
	        return count;    
	    }
	 
	//휴대폰 인증번호 발송
		@RequestMapping(value ="/phonecheck", method = RequestMethod.POST)
		public ModelAndView phonecheck(ModelAndView model, LoginVO login) {
			String verifyPhoneNumber = login.getPhone();
			System.out.println("보낸 휴대폰번호 : "+verifyPhoneNumber);
			SendMessage send = new SendMessage();
			if(lService.phonecheck(login) == null) {
				log.info("phone: "+login.toString());
				model.addObject("code",200);
				send.getVerifyNumber(verifyPhoneNumber);
			} else {
				model.addObject("code",204);
			}
			model.setViewName("jsonView");
			return model;
		}
		
		
		//휴대폰 인증번호 입력
		@RequestMapping(value = "/phoneverify", method = RequestMethod.POST)
		public ModelAndView phoneverify(ModelAndView model, HttpServletRequest request) {
			String verifyNumber = request.getParameter("verifyNumber");
			System.out.println("받은 인증번호 : "+verifyNumber);
			SendMessage send = new SendMessage();
			if(request.getSession().getAttribute("verifyfail")!=null) {
				if((int)request.getSession().getAttribute("verifyfail")>2) {
					model.addObject("verifyfullfail", 204);
					model.addObject("code", 204);
					model.setViewName("jsonView");
					return model;
				}
			}
			if(send.confirmNumber(verifyNumber)) {
				if(request.getSession().getAttribute("verifyfail")!=null) {
					request.getSession().removeAttribute("verifyfail");
				}
				model.addObject("code", 200);
			} else {
				int verifyfail;
				if(request.getSession().getAttribute("verifyfail")==null) {
					verifyfail=1;
					request.getSession().setAttribute("verifyfail", 1);
				} else {
					verifyfail = (int)request.getSession().getAttribute("verifyfail")+1;
					request.getSession().setAttribute("verifyfail", verifyfail);
				}
				model.addObject("verifyfail", verifyfail);
				model.addObject("code", 204);
				
			}
			model.setViewName("jsonView");
			return model;
		}

	@PostMapping("/withdraw")
	public String Withdraw(LoginVO login, RedirectAttributes rttr) {
		log.info("withdraw Page: " + login);

		lService.Clientwithdraw(login);
		rttr.addFlashAttribute("result" + "sucess");

		return "/mypage/memberLogin";
	}

	@PostMapping("/modify")
	public String ClientModify(LoginVO login,ModelAndView model ,RedirectAttributes rttr) {

		lService.Clientupdate(login);
		rttr.addFlashAttribute("result", login.getId());

		
		return "redirect:/mypage/favorite?id=" + login.getId();
	}
	@RequestMapping(value="/MemberCheck", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView MemberCheck(LoginVO login ,ModelAndView model, HttpServletRequest request)throws Exception {
		LoginVO loginvo = (LoginVO) request.getSession().getAttribute("member");
		HttpSession session = request.getSession();
		model.addObject("vid", loginvo.getId());
		log.info("member : "+loginvo.getId());
		
	
//		LoginVO modifyMember = lService.Clientselect(login);
//		
//		log.info("member : "+modifyMember);
//		if(modifyMember !=null) {	
//			log.info("client select"+modifyMember);
//			session.setAttribute("client", modifyMember);
//			
//		}
		return model;

	}

	// modify previous section
	@RequestMapping(value="/InfoChangeInput", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView ClientSelect(LoginVO login ,ModelAndView model, HttpServletRequest request)throws Exception {
		
		LoginVO member = (LoginVO) request.getSession().getAttribute("member");
		login.setId(member.getId());
		String id = login.getId();
		LoginVO modifyMember = lService.Clientselect(id);
		 
		model.addObject("id", modifyMember.getId());
		model.addObject("name", modifyMember.getName());
		model.addObject("address", modifyMember.getAddress());
		model.addObject("phone", modifyMember.getPhone());
		model.addObject("nick", modifyMember.getNickname());
		model.setViewName("/mypage/InfoChangeInput");
		
		return model;
	}

	@RequestMapping(value="/Fundhistory", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView getFundList(ModelAndView model,FundhistoryVO login ,HttpServletRequest request) {
		LoginVO loginvo = (LoginVO) request.getSession().getAttribute("member");
		login.setId(loginvo.getId());
		List<FundhistoryVO> getfund = lService.getFundList(login);
		if(getfund.size()<1) {
			getfund=null;
			System.out.println("no favorite data");
		}
		System.out.println("favorite data OK");
		log.info("fund list is : "+getfund);
		model.addObject("getfund",getfund);
		model.setViewName("/mypage/Fundhistory");
		
		return model;
	}

	//fund getList fundSercvice GetList
	@PostMapping("fundlist_pno")
	public String FundgetList(Long pno, Model model) {
		log.info("pno fundList");
		model.addAttribute("pnoList",fService.getList(pno));
		return "redirect:/mypage/favorite?pno="+pno;
	}

	//FundHistory insert Finsert in login mapper
	@PostMapping("fund_insert")
	public void RegisterFundHistory(String id, String unkno, Long code,RedirectAttributes rttr){
		log.info("Fundinsert"+id);
		fService.register(id, unkno, code);
		rttr.addAttribute("result","success");
	}
	
	//Fundservice Get select fpr product
	@PostMapping("/fund_select")
	public void FundSelect(String id, Long pno,RedirectAttributes rttr) {
		log.info("fundSelect");
		rttr.addFlashAttribute("result", "success");
		fService.get(id, pno);
	}
	
	//Fundservice remove at History
	@PostMapping("/fund_remove")
	public void FundRemove (String id, Long pno,RedirectAttributes rttr) {
		log.info("fundRemove");
		
		fService.remove(id, pno);
		rttr.addAttribute("result","success");
	}

	// favorite List Search in Client DB
	@RequestMapping(value = "/Favorite",  method = {RequestMethod.POST,RequestMethod.GET} )
	public ModelAndView FavoriteList(ModelAndView model,FundhistoryVO login ,HttpServletRequest request) {
		LoginVO loginvo = (LoginVO) request.getSession().getAttribute("member");
		login.setId(loginvo.getId());
		List<FundhistoryVO> getfavorite = lService.getFavoriteList(login);
		if(getfavorite.size()<1) {
			getfavorite=null;
			System.out.println("no favorite data");
		}
		System.out.println("favorite data OK");
		log.info("favorite is : "+getfavorite);
		model.addObject("getfavorite",getfavorite);
		model.setViewName("/mypage/Favorite");
//		return "/mypage/Favorite";
		return model;
		
	}

	// favorite DB insert
	@PostMapping("/Favorite_insert")
	public void FavoritepnoInsert(FundhistoryVO fund,RedirectAttributes rttr) {
		
		log.info("Favorite insert"+fund);
		lService.FavoriteInsert(fund);
		rttr.addFlashAttribute("result", "insertSuccess");
	}
	@PostMapping("/Favorite_delete")
	public void FavoriteDelete(@RequestParam("id") String id  , @RequestParam("pno") Long pno,RedirectAttributes rttr) {
		lService.FavoriteDelete(id, pno);
		rttr.addFlashAttribute("result", "success");
	}

}
