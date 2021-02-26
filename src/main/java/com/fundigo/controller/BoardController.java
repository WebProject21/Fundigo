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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	
	@GetMapping("/FAQlist")
	public void FAQlist(Model model) {
		log.info("list");
		model.addAttribute("list", service.getFAQList());
	}
	@GetMapping("/COMMlist")
	public void COMMlist(Model model) {
		log.info("list");
		model.addAttribute("list", service.getCOMMList());
	}
	@GetMapping("/NOTIlist")
	public void NOTIlist(Model model) {
		log.info("list");
		model.addAttribute("list", service.getNOTIList());
	}
	
	@PostMapping("/FAQregister")
	public String FAQregister(BoardVO board, RedirectAttributes rttr) {
		log.info("FAQregister: "+board);
		service.FAQregister(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/FAQlist";
	}
	
	@GetMapping("/FAQregister")
	public void FAQregister() {
		
	}
	
	@PostMapping("/COMMregister")
	public String COMMregister(BoardVO board, RedirectAttributes rttr) {
		log.info("COMMregister: "+board);
		service.COMMregister(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/COMMlist";
	}
	@PostMapping("/NOTIregister")
	public String NOTIregister(BoardVO board, RedirectAttributes rttr) {
		log.info("NOTIregister: "+board);
		service.NOTIregister(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/NOTIFAQlist";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/get");
		model.addAttribute("board",service.get(bno));
	}
	
	@PostMapping("/FAQmodify")
	public String FAQmodify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify:" + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		String list = ""; // 해당 페이지가 어떤 페이지인지를 받아와야함
		return "redirect:/board/FAQlist";
	}
	@PostMapping("/COMMmodify")
	public String COMMmodify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify:" + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		String list = ""; // 해당 페이지가 어떤 페이지인지를 받아와야함
		return "redirect:/board/COMMlist";
	}
	@PostMapping("/NOTImodify")
	public String NOTImodify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify:" + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		String list = ""; // 해당 페이지가 어떤 페이지인지를 받아와야함
		return "redirect:/board/NOTIlist";
	}
	
	@PostMapping("/FAQremove")
	public String FAQremove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove..."+bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/FAQlist";
	}
	@PostMapping("/COMMremove")
	public String COMMremove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove..."+bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/COMMlist";
	}
	@PostMapping("/NOTIremove")
	public String NOTIremove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove..."+bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/NOTIlist";
	}
}