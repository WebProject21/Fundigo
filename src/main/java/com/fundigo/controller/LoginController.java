package com.fundigo.controller;

import javax.jws.WebParam.Mode;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fundigo.domain.LoginVO;
import com.fundigo.service.BoardService;
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
	private BoardService bService;
	
	@PostMapping("/memberLogin")
	public String memberLogin(LoginVO login, RedirectAttributes rttr) {
		log.info("login : "+login);
		lService.LoginCheck(login);
		rttr.addFlashAttribute("result", login.getId());
	
		return "redirect:/mypage/favorite?id="+login.getId();
	
	}

}
