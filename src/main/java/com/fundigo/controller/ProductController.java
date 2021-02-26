package com.fundigo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;
import com.fundigo.service.BoardService;
import com.fundigo.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor

public class ProductController {
	
	private ProductService pService;
	private BoardService bService;
	
	@GetMapping("/view")
	public void view(@RequestParam("pno") Long pno, Model model) {
		
		log.info("/view----");
		model.addAttribute("product", pService.get(pno));
	}
	
	@PostMapping("/register")
	public String register(ProductVO product, List<ListVO> lists, RedirectAttributes rttr) {
		log.info("register : "+product);
		
		pService.pRegister(product);
		
		for(int i = 0; i< lists.size(); i++) {
			pService.lRegister(lists.get(i));
		}
		
		return "redirect:/product/view?pno="+product.getPno();
		
	}
	
	@GetMapping("/comm")
	public void commList(@RequestParam("pno") Long pno, Model model) {
		log.info("commList");
		model.addAttribute("list",bService.getCOMMList(pno));
	}
	
	
	@GetMapping("/COMMlist")
	public void COMMlist(@RequestParam("pno") Long pno, Model model) {
		log.info("list");
		model.addAttribute("list", bService.getCOMMList(pno));
	}
	@GetMapping("/NOTIlist")
	public void NOTIlist(@RequestParam("pno") Long pno, Model model) {
		log.info("list");
		model.addAttribute("list", bService.getNOTIList(pno));
	}
	
	//@PostMapping("/modify")
	//public void modify()
}
