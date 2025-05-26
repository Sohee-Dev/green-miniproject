package com.example.aquarium.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.aquarium.dao.IOrderDao;
import com.example.aquarium.dto.ItemDTO;
import com.example.aquarium.dto.OrderDTO;
import com.example.aquarium.dto.TicketDTO;

@Service
public class OrderService {

    @Autowired
    private IOrderDao orderDao;

    // 모든 이용권 조회 (ticketlist, orderform 용)
    public List<TicketDTO> getAllTickets() {
        return orderDao.selectAllTickets();
    }

    // 주문 생성 (대인/소인 여러 개 동시 처리)
    public void createOrder(String id, String ophone, List<String> tnos, List<Integer> amounts) {
        int totalPrice = 0;

        // 주문 총액 계산 (수량 * 각 이용권 가격)
        for (int i = 0; i < tnos.size(); i++) {
        	//로그인한 회원이 선택한 티켓 가격 뽑기
            int price = orderDao.getTicketPrice(tnos.get(i));
            //선택한 티켓 가격*각 수량을 총합한 값
            totalPrice += price * amounts.get(i);
        }

        // 주문 정보 셋팅 및 저장
       OrderDTO order = new OrderDTO();
        order.setId(id);
        order.setOphone(ophone);
        order.setTotalprice(totalPrice);

        orderDao.insertOrder(order);

        // 주문번호 가져오기 (방금 저장된 ono)
        String ono = orderDao.getLastOrderNo();

        // 주문 아이템 저장 (수량 0 이하는 저장 안함)
        for (int i = 0; i < tnos.size(); i++) {
            int amount = amounts.get(i);
            if (amount > 0) {
                ItemDTO item = new ItemDTO();
                item.setOno(ono);
                item.setTno(tnos.get(i));
                item.setAmount(amount);
                orderDao.insertItem(item);
            }
        }
    }

    //회원별 주문내역 제일 최근에 한 3개만 조회
	public List<Map<String, Object>> selectRecentOrderItemsByMemberId(String id) {
		return orderDao.selectRecentOrderItemsByMemberId(id);
	}
	// 페이징 한 주문 내역 조회
	public List<Map<String, Object>> selectOrderItemsByMemberIdPaged(String id,int page,int itemsPerPage) {
		int startRow = (page - 1) * itemsPerPage + 1;
		int endRow = page * itemsPerPage;
		return orderDao.selectOrderItemsByMemberIdPaged(id, startRow, endRow);
	}
	//주문한 총 내역 수
	public int countOrdersByMemberId(String id) {
	    return orderDao.countOrdersByMemberId(id);
	}
	//회원의 주문번호에 따른 상세 정보 조회
	public List<Map<String, Object>> moreOrder(String loginId, String ono) {
		return orderDao.moreOrder(loginId,ono);
	}
}
