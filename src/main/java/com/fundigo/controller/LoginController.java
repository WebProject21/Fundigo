package com.fundigo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fundigo.domain.FundhistoryVO;
import com.fundigo.domain.LoginVO;
import com.fundigo.service.FundhistoryService;
import com.fundigo.service.LoginService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class LoginController {

	private LoginService lService;
	private FundhistoryService fService;

	@PostMapping("/memberLogin")
	public String memberLogin(LoginVO login, RedirectAttributes rttr) {
		log.info("login : " + login);
		lService.LoginCheck(login);
		rttr.addFlashAttribute("result", login.getId());

		return "redirect:/mypage/favorite?id=" + login.getId();

	}

	@PostMapping("/JoinPage")
	public String JoinPage(LoginVO login, RedirectAttributes rttr) {
		log.info("Join Page : " + login);
		lService.ClientJoin(login);
		rttr.addFlashAttribute("join Result" + login.getId());
		return "redirect:/mypage/favorite?id=" + login.getId();
	}

	@PostMapping("/withdraw")
	public String Withdraw(LoginVO login, RedirectAttributes rttr) {
		log.info("withdraw Page: " + login);

		lService.Clientwithdraw(login);
		rttr.addFlashAttribute("result" + "sucess");

		return "/mypage/memberLogin";
	}

	@PostMapping("/modify")
	public String ClientModify(LoginVO login, RedirectAttributes rttr) {
		log.info("modify Page:" + login);

		lService.Clientupdate(login);
		rttr.addFlashAttribute("result", login.getId());

		return "redirect:/mypage/favorite?id=" + login.getId();
	}
	
	// modify previous section
	@PostMapping("/select")
	public void ClientSelect(LoginVO login , RedirectAttributes rttr) {
		log.info("client select"+login);
		lService.Clientselect(login);
		rttr.addAttribute("result", "success");
	}
	
	@PostMapping("/fundList")
	public void getFundList(@RequestParam("id") String id, RedirectAttributes rttr) {

		log.info("funList result: " + id);
		lService.getFundList(id);
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
	
	//Fundservice Get select
	@PostMapping("/fund_select")
	public void FundSelect(String id, Long pno,RedirectAttributes rttr) {
		log.info("fundSelect");
		rttr.addFlashAttribute("result", "success");
		fService.get(id, pno);
	}
	
	//Fundservice remove History
	@PostMapping("/fund_remove")
	public void FundRemove (String id, Long pno,RedirectAttributes rttr) {
		log.info("fundRemove");
		
		fService.remove(id, pno);
		rttr.addAttribute("result","success");
	}
	
	// favorite List Search in Client DB
	@PostMapping("/favorite")
	public void FavoriteList(@RequestParam("id") String id, Model model) {
		log.info("/favorite");
		model.addAttribute("favorite",  lService.getFavoriteList(id));
//		return "redirect:/mypage/favorite?id=" + lService.getFavoriteList(id);
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
