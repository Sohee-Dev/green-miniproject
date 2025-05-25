package com.example.aquarium.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.aquarium.dao.IBoardDao;
import com.example.aquarium.dto.FaqDTO;
import com.example.aquarium.dto.JoinDTO;
import com.example.aquarium.dto.NoticeDTO;
import com.example.aquarium.dto.QnaDTO;
import com.example.aquarium.dto.SearchLogDTO;

@Service
public class BoardService {

	@Autowired
	private IBoardDao boardDao;

//    회원용
	// qna 등록 처리
	public void insertQna(QnaDTO qna) {
		boardDao.insertQna(qna);
	}

	// qna 목록 조회
	public List<QnaDTO> getQnaList(String id) {
		return boardDao.selectQnaList(id);
	}

	// qna 상세 조회
	public QnaDTO getQnaByQno(String qno) {
		return boardDao.selectQnaByQno(qno);
	}

	// faq 목록 조회
	public List<FaqDTO> getFaqList() {
		return boardDao.selectFaqList();
	}
	
	// notice 공지 목록 조회
	public List<NoticeDTO> getNoticeList(){
		return boardDao.selectNoticeList();
		
	}

// =============================================================================================
//    관리자용 

	// qna 답변 등록
	public void updateAnswer(QnaDTO qna) {
		boardDao.updateAnswer(qna);
	}
	
	// qna 대기만 조회
	public List<QnaDTO> workList() {
		return boardDao.selectQnaByQstatus();
	}

	// faq 등록 처리
	public void insertFaq(FaqDTO faq) {
		boardDao.insertFaq(faq);
	}

	// faq 삭제 처리
	public void deleteFaq(String fno) {
		boardDao.deleteFaq(fno);
	}
	
	// notice 공지사항 등록
	public void insertNotice(NoticeDTO notice) {
		boardDao.insertNotice(notice);
	}

	// notice 공지사항 삭제 
	public void deleteNotice(String nid) {
		boardDao.deleteNotice(nid);
	}
	
//===========================================
	// 검색
	
	// 검색 결과 조회
	public List<JoinDTO> getJoinList(String keyword){
		return boardDao.selectJoinList(keyword);
	}
	
	// 검색 저장
	public void insertKeyword(SearchLogDTO log) {
		boardDao.insertKeyword(log);
	}

	// 인기 검색 목록 보여주기
	public List<SearchLogDTO> getLogList() {
		return boardDao.selectLogList();
		
	}
	
	
}
