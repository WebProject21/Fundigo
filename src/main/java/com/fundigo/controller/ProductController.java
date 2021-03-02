package com.fundigo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;
import com.fundigo.service.BoardService;
import com.fundigo.service.FundhistoryService;
import com.fundigo.service.ProductService;
import com.fundigo.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor

public class ProductController {
	
	private ProductService pService;
	private BoardService bService;
	private FundhistoryService fService;
	private ReplyService rService;
	
	@GetMapping("/view")
	public void view(@RequestParam("pno") Long pno, Model model) {
		
		log.info("/view----");
		model.addAttribute("product", pService.get(pno));
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public String register(@RequestBody ProductVO product, List<ListVO> lists, RedirectAttributes rttr) {
		log.info("register : "+product);
		
		pService.pRegister(product);
		
		/*for(int i = 0; i< lists.size(); i++) {
			pService.lRegister(lists.get(i));
		}
		*/
		
		rttr.addFlashAttribute("product", product.getPno());
		
		return "redirect:/product/view?pno="+product.getPno();
		
	}
	
	@GetMapping("/community")
	public void commList(@RequestParam("pno") Long pno, Model model) {
		log.info("commList");
		model.addAttribute("list",bService.getCOMMList(pno));
		model.addAttribute("product",pService.get(pno));
	}
	
	@GetMapping("/notice")
	public void NOTIlist(@RequestParam("pno") Long pno, Model model) {
		log.info("list");
		model.addAttribute("list", bService.getNOTIList(pno));
		model.addAttribute("product",pService.get(pno));
	}
	
	@GetMapping("/boardView")
	public void boardView(@RequestParam("bno") Long bno, Model model) {
		log.info("boardView");
		model.addAttribute("board", bService.get(bno));
		model.addAttribute("reply", rService.getList(bno));
	}
	
	
	
	@PostMapping("/modify")
	public String modify(ProductVO product, List<ListVO> lists, RedirectAttributes rttr) {
		log.info("modify");
		
		if(pService.modify(product, lists)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/product/view?pno="+product.getPno();
	}
	
	@GetMapping("/sponsor")
	public void sponList(@RequestParam("pno") Long pno, Model model) {
		
		log.info("sponsor list");
		model.addAttribute("list", fService.getList(pno));
		
	}

}
