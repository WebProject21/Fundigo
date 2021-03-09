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

import com.fundigo.domain.BoardVO;
import com.fundigo.domain.ListVO;
import com.fundigo.domain.ProductVO;
import com.fundigo.service.BoardService;
import com.fundigo.service.FundhistoryService;
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
	private FundhistoryService fService;
	
	@GetMapping("/view")
	public void view(@RequestParam("pno") Long pno, Model model) {
		
		log.info("/view----");
		model.addAttribute("product", pService.get(pno));
		model.addAttribute("lists", pService.getList(pno));
	}//상품 뷰
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public String register(@RequestBody ProductVO product, @RequestBody List<ListVO> lists, RedirectAttributes rttr) {
		log.info("register : "+product);
		
		pService.pRegister(product);
		
		for(int i = 0; i< lists.size(); i++) {
			pService.lRegister(lists.get(i));
		}
		
		rttr.addFlashAttribute("product", product);
		rttr.addFlashAttribute("lists", lists);
		
		return "redirect:/product/view?pno="+product.getPno();
		
	}//상품 등록
	
	@GetMapping("/community")
	public void commList(@RequestParam ("pno") Long pno, Model model) {
		log.info("commList");
		model.addAttribute("list",bService.getCOMMList(pno));
		model.addAttribute("product",pService.get(pno));
		model.addAttribute("count", bService.getListcount());
	}//상품 커뮤니티 페이지
	
	@PostMapping("/community_register")
	public String COMMregister(@RequestParam ("pno") Long pno, Model model, BoardVO board, RedirectAttributes rttr) {
		log.info("COMMregister: "+board);
		bService.COMMregister(board);
		rttr.addFlashAttribute("result", board.getBno());
		model.addAttribute("product",pService.get(pno));  
		return "redirect:/board/view?bno="+board.getBno();
	}
	
	@GetMapping("/notice")
	public void NOTIlist(@RequestParam("pno") Long pno, Model model) {
		log.info("list");
		model.addAttribute("list", bService.getNOTIList(pno));
		model.addAttribute("product",pService.get(pno));
	}//상품 공지 페이지
	
	@GetMapping("/notice_register")
	public void register(@RequestParam ("pno") Long pno, @RequestParam("id") String id, Model model) {
		model.addAttribute("product",pService.get(pno));  
		model.addAttribute("id", id);  
	}
	
	@PostMapping("/notice_register")
	public String NOTIregister(@RequestParam ("pno") Long pno, Model model, BoardVO board, RedirectAttributes rttr) {
		log.info("NOTIregister: "+board);
		bService.NOTIregister(board);
		rttr.addFlashAttribute("result", board.getBno());
		model.addAttribute("product",pService.get(pno));  
		return "redirect:/board/view?bno="+board.getBno();
	}
	
	@PostMapping("/modify")
	public String modify(ProductVO product, List<ListVO> lists, RedirectAttributes rttr) {
		log.info("modify");
		
		if(pService.modify(product, lists)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/product/view?pno="+product.getPno();
	}//상품 수정 페이지
	
	@GetMapping("/sponsor")
	public void sponList(@RequestParam("pno") Long pno, Model model) {
		
		log.info("sponsor list");
		model.addAttribute("list", fService.getList(pno));
		
	}//상품 서포터 목록 페이지
	
}
