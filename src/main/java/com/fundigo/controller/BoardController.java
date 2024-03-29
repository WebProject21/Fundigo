package com.fundigo.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fundigo.domain.BoardAttachVO;
import com.fundigo.domain.BoardVO;
import com.fundigo.domain.Criteria;
import com.fundigo.domain.PageDTO;
import com.fundigo.domain.ProductVO;
import com.fundigo.service.BoardService;
import com.fundigo.service.ProductService;
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
	private ProductService pService;
	
	@GetMapping("/faq")
	public void FAQlist(Criteria cri, @RequestParam("id") String id, Model model) {
		log.info("faq_list");
		String bd_type = "FAQ";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bd_type", bd_type);
		int total = bService.getFAQTotal(map);
		model.addAttribute("list", bService.getFAQList(cri));
		model.addAttribute("id", id);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/faq_register")
	public void proRegister(@RequestParam("id") String id, Model model) {
		
		log.info("/register-get-mapping---");
		model.addAttribute("id", id);
	}//상품 뷰
	
	@PostMapping("/faq_register")
	public String FAQregister(BoardVO board, RedirectAttributes rttr) {
		log.info("FAQregister: "+board);
		bService.FAQregister(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/faq?id="+board.getId();
	}
	
	@GetMapping({"/faq_view","/faq_modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/view or /modify");
		bService.countup(bno);
		model.addAttribute("board",bService.get(bno));
	}

	@GetMapping({"/view","/productBoard_modify"})
	public void get(@RequestParam ("pno") Long pno, @RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/view or /modify");
		bService.countup(bno);
		model.addAttribute("board",bService.get(bno));
		model.addAttribute("product",pService.get(pno));
	}
	
	@PostMapping("/faq_modify")
	public String FAQmodify(BoardVO board, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		log.info("modify:" + board);
		if(bService.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/faq?id="+board.getId();
	}
	
	@PostMapping("/productBoard_modify")
	public String product_modify(BoardVO board, ProductVO product, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		log.info("modify"+board);
		if(bService.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/view?pno="+product.getPno()+"&bno="+board.getBno();
	}
	
	@GetMapping("/boardView")
	public void boardView(@RequestParam("bno") Long bno, Model model) {
		log.info("boardView");
		model.addAttribute("board", bService.get(bno));
		model.addAttribute("reply", rService.rGetList(bno));
	}//상품 공지, 커뮤니티 게시판 한 항목 보는 페이지
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam ("pno") Long pno, @RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,
						BoardVO board, RedirectAttributes rttr, HttpServletRequest request) {
		log.info("remove..."+board.getBno());
		List<BoardAttachVO> attachList = bService.getAttachList(board.getBno());
		String id = board.getId();
		if(bService.remove(board.getBno())) {
			deleteFiles(attachList, request);
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/product/notice?pno="+pno+"&id="+id;
	}
	@PostMapping("/faq_remove")
	public String faq_remove(@RequestParam("bno") Long bno,BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, HttpServletRequest request) {
		log.info("remove..."+board.getBno());
		List<BoardAttachVO> attachList = bService.getAttachList(board.getBno());
		String id = board.getId();
		if(bService.remove(board.getBno())) {
			
			deleteFiles(attachList, request);
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/faq?id="+id;
	}
	
	@GetMapping(value = "/getAttachList",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("getAttachList : "+bno);
		log.info(bService.getAttachList(bno));
		return new ResponseEntity<>(bService.getAttachList(bno),HttpStatus.OK);
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList, HttpServletRequest request) {
		if(attachList == null || attachList.size()== 0) {
			return;
		}
		log.info("delete attach files.................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				String uploadFolder = request.getSession().getServletContext().getRealPath("/");
				String attach_path = "resources/Upload/";
				String rootPath = uploadFolder+attach_path+attach;
				Path file = Paths.get(rootPath+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get(rootPath+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}//end catch
		});//end foreachd
	}
	
}