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
import com.fundigo.domain.Criteria;
import com.fundigo.domain.ListVO;
import com.fundigo.domain.PageDTO;
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
	
	@GetMapping("/register")
	public void proRegister(@RequestParam("id") String id, Model model) {
		
		log.info("/register-get-mapping---");
		model.addAttribute("id", id);
	}//상품 뷰
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public String productRegister(@RequestBody ProductVO product, @RequestBody List<ListVO> lists, RedirectAttributes rttr) {
		log.info("register : "+product);
		
		pService.pRegister(product);
		
		for(int i = 0; i< lists.size(); i++) {
			pService.lRegister(lists.get(i));
		}
		if(product.getAttachList() != null) {
			product.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info(product.getAttachList());
		
		rttr.addFlashAttribute("product", product);
		rttr.addFlashAttribute("lists", lists);
		
		return "redirect:/product/view?pno="+product.getPno();
		
	}//상품 등록
	
	@GetMapping("/community")
	public void commList(@RequestParam ("pno") Long pno, @RequestParam("id") String id, Criteria cri,Model model) {
		log.info("commList");
		model.addAttribute("list",bService.getCOMMList(pno, cri));
		model.addAttribute("product",pService.get(pno));
		model.addAttribute("count", bService.getListcount());
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
	}//상품 커뮤니티 페이지
	
	@GetMapping("/community_register")
	public void COMMregister(@RequestParam ("pno") Long pno, @RequestParam("id") String id, Model model) {
		model.addAttribute("product",pService.get(pno));  
		model.addAttribute("id", id);  
	}
	
	@PostMapping("/community_register")
	public String COMMregister(@RequestParam ("pno") Long pno, Model model, BoardVO board, RedirectAttributes rttr) {
		log.info("COMMregister: "+board);
		bService.COMMregister(board);
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info(board.getAttachList());
		rttr.addFlashAttribute("result", board.getBno());
		model.addAttribute("product",pService.get(pno));  
		return "redirect:/product/community?pno="+pno+"&id="+board.getId();
	}
	
	@GetMapping("/notice")
	public void NOTIlist(@RequestParam("pno") Long pno, @RequestParam("id") String id, Criteria cri, Model model) {
		log.info("list");
		model.addAttribute("list", bService.getNOTIList(pno, cri));
		model.addAttribute("id", id);
		model.addAttribute("product",pService.get(pno));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
	}//상품 공지 페이지
	
	@GetMapping("/notice_register")
	public void NOTIregister(@RequestParam ("pno") Long pno, @RequestParam("id") String id, Model model) {
		model.addAttribute("product",pService.get(pno));  
		model.addAttribute("id", id);  
	}
	
	@PostMapping("/notice_register")
	public String NOTIregister(@RequestParam ("pno") Long pno, Model model, BoardVO board, RedirectAttributes rttr) {
		log.info("=============================================================");
		log.info("NOTIregister: "+board);
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info(board.getAttachList());
		bService.NOTIregister(board);
		log.info("=============================================================");
		rttr.addFlashAttribute("result", board.getBno());
		model.addAttribute("product",pService.get(pno));  
		return "redirect:/product/notice?pno="+pno+"&id="+board.getId();
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
