package com.fundigo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fundigo.service.MainService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/main/*")
@AllArgsConstructor
public class MainController {
private MainService service;
	
	@GetMapping("/mainpage")
	public void list(Model model) {
		
		log.info("mainpage");
		//화면에 뿌릴 프로덕트 리스트 객체를 받아와야한다. 조건에 맞춰서. 서비스에 해당 쿼리 작성
	}
}