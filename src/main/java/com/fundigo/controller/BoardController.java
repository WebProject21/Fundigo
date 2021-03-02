package com.fundigo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fundigo.domain.BoardVO;
import com.fundigo.service.BoardService;
import com.fundigo.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService bService;
	private ReplyService rService;
	
	@GetMapping("/faq")
	public void FAQlist(Model model) {
		log.info("faq_list");
		model.addAttribute("list", bService.getFAQList());
	}
	
	@PostMapping("/faq_register")
	public String FAQregister(BoardVO board, RedirectAttributes rttr) {
		log.info("FAQregister: "+board);
		bService.FAQregister(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/faq?bno="+board.getBno();
	}
	
	@PostMapping("/comm_register")
	public String COMMregister(BoardVO board, RedirectAttributes rttr) {
		log.info("COMMregister: "+board);
		bService.COMMregister(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/view?bno="+board.getBno();
	}
	
	@PostMapping("/noti_register")
	public String NOTIregister(BoardVO board, RedirectAttributes rttr) {
		log.info("NOTIregister: "+board);
		bService.NOTIregister(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/view?bno="+board.getBno();
	}
	
	@GetMapping("/view")
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get");
		model.addAttribute("board",bService.get(bno));
	}
	
	@GetMapping("/boardView")
	public void boardView(@RequestParam("bno") Long bno, Model model) {
		log.info("boardView");
		model.addAttribute("board", bService.get(bno));
		model.addAttribute("reply", rService.getList(bno));
	}//상품 공지, 커뮤니티 게시판 한 항목 보는 페이지
	
	@PostMapping("/FAQmodify")
	public String FAQmodify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify:" + board);
		if(bService.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		String list = ""; // 해당 페이지가 어떤 페이지인지를 받아와야함
		return "redirect:/board/FAQlist";
	}
	@PostMapping("/COMMmodify")
	public String COMMmodify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify:" + board);
		if(bService.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		String list = ""; // 해당 페이지가 어떤 페이지인지를 받아와야함
		return "redirect:/board/COMMlist";
	}
	@PostMapping("/NOTImodify")
	public String NOTImodify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify:" + board);
		if(bService.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		String list = ""; // 해당 페이지가 어떤 페이지인지를 받아와야함
		return "redirect:/board/NOTIlist";
	}
	
	@PostMapping("/FAQremove")
	public String FAQremove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove..."+bno);
		if(bService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/FAQlist";
	}
	@PostMapping("/COMMremove")
	public String COMMremove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove..."+bno);
		if(bService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/COMMlist";
	}
	@PostMapping("/NOTIremove")
	public String NOTIremove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove..."+bno);
		if(bService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/NOTIlist";
	}
}