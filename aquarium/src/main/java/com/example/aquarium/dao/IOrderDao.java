package com.example.aquarium.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.aquarium.dto.ItemDTO;
import com.example.aquarium.dto.OrderDTO;
import com.example.aquarium.dto.TicketDTO;

@Mapper
public interface IOrderDao {

    // 전체 이용권 조회
    List<TicketDTO> selectAllTickets();

    // 이용권 가격 조회
    int getTicketPrice(@Param("tno") String tno);

    // 주문 저장
    void insertOrder(OrderDTO order);

    // 주문 아이템 저장
    void insertItem(ItemDTO item);

    // 주문번호 마지막 번호 조회
    String getLastOrderNo();

   
    //회원별 주문내역 제일 최근에 한 3개 정도만 조회
	List<Map<String, Object>> selectRecentOrderItemsByMemberId(@Param("id")String id);
	
	//페이지별 주문내역 조회
	List<Map<String, Object>> selectOrderItemsByMemberIdPaged(@Param("id")String id,@Param("startRow") int startRow, @Param("endRow") int endRow);
	
	//회원이 주문한 내역이 몇 개있는지 조회
	int countOrdersByMemberId(@Param("id") String id);
	
	//회원의 주문번호에 따른 상세 정보 조회
	List<Map<String, Object>> moreOrder(@Param("id")String loginId,@Param("ono")String ono);

}
