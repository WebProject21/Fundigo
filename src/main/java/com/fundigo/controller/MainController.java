package com.fundigo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fundigo.domain.Criteria;
import com.fundigo.domain.PageDTO;
import com.fundigo.domain.ProductVO;
import com.fundigo.service.MainService;
import com.fundigo.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mainpage/*")
@AllArgsConstructor
public class MainController {
private MainService service;
private ProductService pService;
	
	@GetMapping("/mainpage")
	public void list(Model model) {
		
		log.info("mainpage");
		//화면에 뿌릴 프로덕트 리스트 객체를 받아와야한다. 조건에 맞춰서. 서비스에 해당 쿼리 작성
	}
	
	@GetMapping("/search")
	public void searchList(Criteria cri, Model model){
		
		log.info("/search Result----");
		
		List<ProductVO> results = pService.searchList(cri);
		
		int total = pService.getTotal(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("results", results);
		
	}
}