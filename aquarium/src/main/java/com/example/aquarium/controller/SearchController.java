package com.example.aquarium.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.aquarium.dto.JoinDTO;
import com.example.aquarium.dto.SearchLogDTO;
import com.example.aquarium.service.BoardService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

@Controller
public class SearchController {

	@Autowired
	private BoardService boardService;

	@GetMapping("/search")
	public String search(
	        @Valid @ModelAttribute("log") SearchLogDTO log,
	        BindingResult result,
	        RedirectAttributes rttr,
	        Model model) {

	    if (result.hasErrors()) {
	    	rttr.addFlashAttribute("error", "검색어를 입력해주세요.");
	        return "redirect:/";  // 또는 "redirect:/검색폼페이지"
	    }

	    List<JoinDTO> joinlist = boardService.getJoinList(log.getKeyword());
	    model.addAttribute("joinlist", joinlist);

	    log.setToday(new Date());
	    boardService.insertKeyword(log);

	    return "result";
	}


	// 인기 검색어 목록 지금은 index에 넣어놔서
	// getMapping 나중에 변경 및 return 반환값 변경 필수
//	@GetMapping("/")
//	public String root(Model model, HttpSession session) {
//
//
//		// 인기 검색어 로그 목록 보기
//		List<SearchLogDTO> loglist = boardService.getLogList();
//
//		model.addAttribute("loglist", loglist);
//
//		return "index";
//	}

	@GetMapping("/quiz")
	public String quiz() {
		return "quiz";
	}

}
