package com.example.aquarium.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.aquarium.dto.MemberDto;
import com.example.aquarium.dto.TicketDTO;
import com.example.aquarium.service.MemberService;
import com.example.aquarium.service.OrderService;
import com.example.aquarium.session.MemberSession;

@Controller
@RequestMapping("/order")
public class OrderController {
//id는 나중에 로그인한 아이디로 변경하면 된다
    @Autowired
    private OrderService orderService;
    @Autowired
	private MemberSession membersession;
    
    @Autowired
    private MemberService memberService;

    // 이용권 목록 보여주기 (ticketlist.jsp 역할)
    @GetMapping("/ticket/ticketlist")
    public String showTicketList(Model model) {
        List<TicketDTO> list = orderService.getAllTickets();
        model.addAttribute("list", list);
        return "/ticket/ticketlist"; // ticketlist.jsp
    }

    // 주문폼 보여주기 (orderform.jsp)-->바로 주소 타고 가면 로그인창으로 이동시켜야함
    @GetMapping("/orderform")
    public String showOrderForm(Model model,RedirectAttributes rttr) {
        if (membersession.getId() == null) {
        	rttr.addFlashAttribute("msg","hi");
            return "redirect:/loginForm";
        }
        List<TicketDTO> list = orderService.getAllTickets();
        //현재 로그인한 회원의 정보를 다 가져오기
        MemberDto member = memberService.getName(membersession.getId());
        model.addAttribute("list", list);
        model.addAttribute("member", member);
        return "/order/orderform"; // orderform.jsp
    }
    @GetMapping("/ordercreate")
    public String ordercreateNo(RedirectAttributes rttr) {
    	String loginId=membersession.getId();
 		if(loginId==null) {
 			rttr.addFlashAttribute("msg","hi");
    		return "redirect:/loginForm";
    	}
    	return "order/orderform";
    }
    
    // 주문 처리
    //티켓이 2개면 2개로 받을 수 있고,수량도 티켓 개수에 따라 여러 개가 될 수 있으므로 list타입으로 받았다
    //이렇게 session에서 로그인 정보를 직접 가져와 처리하면 더 안전합니다
    @PostMapping("/ordercreate")
    public String createOrder(@RequestParam("ophone") String ophone,
                              @RequestParam("tno[]") List<String> tnos,
                              @RequestParam("amount[]") List<Integer> amounts,
                              RedirectAttributes rttr) {
        String loginId = membersession.getId();
        orderService.createOrder(loginId, ophone, tnos, amounts);
        return "redirect:/order/orderlist/1";
    }
    //가장 최근에 주문한 내역 3개만 보여주기
    @GetMapping("/recentorderlist")
    public String recentorderlist(Model model,RedirectAttributes rttr) {
    	if(membersession.getId()==null) {
    		rttr.addFlashAttribute("msg","hi");
    		return "redirect:/loginForm";
    	}
    	model.addAttribute("list",orderService.selectRecentOrderItemsByMemberId(membersession.getId()));
    	return "/order/orderrecentlist";
    }
    //orderlist를 그냥 주소를 타고 갔을때 404오류가 나서 로그인폼으로 보내는 메서드
    @GetMapping("orderlist")
    public String orderlistNo(RedirectAttributes rttr) {
    	String loginId=membersession.getId();
 		if(loginId==null) {
 			rttr.addFlashAttribute("msg","hi");
    		return "redirect:/loginForm";
    	}
    	return "order/orderlist";
    }
    // 주문내역 조회 (예시)
    //MyBatis가 DB에서 가져오는 컬럼명을 key로 삼는데, 오라클은 컬럼명을 기본적으로 대문자로 리턴한다
    //resultType="map"일 때는 DTO처럼 자동 변환 안 해줌 (평소에 DTO타입으로 하면 자동변환을 해서 소문자로 써도 무방하다)
    //페이지네이션 기능까지 추가-->한 페이지 당 5개 목록
    //페이징의 기준은 orders의 주문 건 수여야 합니다. 
    //왜냐하면 items는 주문 1건당 여러 개 있을 수 있어서 기준이 되기 어렵다
 	@GetMapping("/orderlist/{page}")
 	public String orderlist(@PathVariable("page") int page, Model model,RedirectAttributes rttr) {
 		String loginId=membersession.getId();
 		//한 페이지당 몇 개의 목록을 뜨게 할 것인가?
 		int itemsPerPage = 5;
 		//회원이 주문한 목록이 몇 개인가?
 		int totalNotices = orderService.countOrdersByMemberId(loginId);
 		//주문한 목록/페이지당 목록 개수 ex)주문 목록(13)/페이지당 목록개수(5)=2.8->올림해서 3페이지
 		int totalPages = (int) Math.ceil((double) totalNotices / itemsPerPage);
 		//페이지네이션을 해서 보여주는 목록
 		List<Map<String, Object>> orders = orderService.selectOrderItemsByMemberIdPaged(loginId, page, itemsPerPage);
 		model.addAttribute("order", orders);         // ✅ 꼭 필요

 		model.addAttribute("totalPages", totalPages);          // ✅ 꼭 필요

 		model.addAttribute("currentPage", page);               // ✅ 꼭 필요
 		return "order/orderlist";  // ✅ 반드시 이 JSP와 연결되어 있어야 함
 	}
 	//회원의 주문번호에 따른 상세 정보 조회
 	@GetMapping("/moreorderlist")
 	public String moreOrder(@RequestParam(value = "ono", required = false) String ono, Model model,RedirectAttributes rttr) {
 		String loginId=membersession.getId();
 	    // 로그인 안 했을 경우
 	    if (loginId == null) {
 	        rttr.addFlashAttribute("msg", "hi");
 	        return "redirect:/loginForm";
 	    }
 	    // ono 파라미터가 없을 경우
 	    if (ono == null || ono.isEmpty()) {
 	        rttr.addFlashAttribute("msg", "잘못된 접근입니다.");
 	        return "redirect:/order/orderlist/1"; // 주문 내역 리스트 페이지 등으로 보내기
 	    }
 	    
 		List<Map<String, Object>> moreorder =orderService.moreOrder(loginId,ono);
 		model.addAttribute("moreorder",moreorder);
 	    return "order/moreorderlist";
 	}
}
