package com.example.aquarium.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.aquarium.dto.FaqDTO;
import com.example.aquarium.dto.JoinDTO;
import com.example.aquarium.dto.NoticeDTO;
import com.example.aquarium.dto.QnaDTO;
import com.example.aquarium.service.BoardService;
import com.example.aquarium.session.MemberSession;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberSession membersession;



	// qna 등록 폼 페이지
	@GetMapping("/qnaForm")
	public String qnaForm() {
		return "board/qnaForm"; // 폼 페이지로 이동
	}

	// qna 등록 처리
	@PostMapping("/qnaInsert")
	public String submitQna(QnaDTO qna) {
		

		// 로그인된 사용자의 아이디를 QnA에 설정
		// 위에 나중에 임의로 넣은 값을 빼고 return만 살리면 됨
		qna.setId(membersession.getId());

		// 기본값 설정
		// 사용자가 qna 등록한 순간 qstatust 대기 입력
		qna.setQstatus("대기");
		// 사용자가 qna 등록한 순간 qdate 현재 날짜 입력
		qna.setQdate(new Date());

		// 등록 처리
		boardService.insertQna(qna);

		// 등록 후 목록 페이지로 이동
		return "redirect:/board/service_center";
	}

	 //qna 페이지
	@GetMapping("/qnaList")
	public String qnaList(Model model) {

		// 세션으로 받은 아이디를 목록 조회 해야함
		String userId = membersession.getId();
		List<QnaDTO> qnaList = boardService.getQnaList(userId); // qna 목록 조회
		model.addAttribute("qnaList", qnaList);
		return "board/qnaList";
	}

	// qnaList 페이지의 제목을 눌러 상세페이지 들어가는 용
	@GetMapping("/view")
	public String qnaDetail(@RequestParam("qno") String qno, Model model) {
		QnaDTO qna = boardService.getQnaByQno(qno); // qna 상세 조회
		model.addAttribute("qna", qna);
		return "board/qnaDetail";
	}

	// faq 페이지
	@GetMapping("/faqList")
	public String faqList(Model model) {
		List<FaqDTO> faqList = boardService.getFaqList();// faq 목록 조회
		model.addAttribute("faqList", faqList);
		return "board/faqList";
	}

	// notice 페이지
	@GetMapping("/noticeList")
	public String noticeList(Model model) {
		List<NoticeDTO> noticeList = boardService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		return "board/noticeList";
	}

	// 고객센터 페이지
	@GetMapping("/service_center")
	public String customerCenter(Model model) {
		// faq 목록
		List<FaqDTO> faqList = boardService.getFaqList();
		model.addAttribute("faqList", faqList);

		
		
		// 사용자 qna 목록 조회하기 위해서 session에 있는 id 가져와야함
		//String userId = userSession.getLoginMember().getId();

		//List<QnaDTO> qnaList = boardService.getQnaList(userId); // qna 목록 조회
		//model.addAttribute("qnaList", qnaList);

		return "board/service_center";
	}

	// 검색
	@GetMapping("/search")
	public String search(@RequestParam("keyword") String keyword, Model model) {
		List<JoinDTO> joinlist = boardService.getJoinList(keyword);
		model.addAttribute("joinlist", joinlist);

		return "result";
	}

}
