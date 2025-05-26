<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.site-footer {
	  width: 100%;
	  background: #111;
	  color: #eee;
	  padding: 48px 0 32px 0;
	  text-align: center;
	  font-family: 'Noto Sans KR', 'Montserrat', Arial, sans-serif;
	  letter-spacing: 0.1px;
	}
	
	.footer-container {
	  max-width: 900px;
	  margin: 0 auto;
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  gap: 15px;
	}
	
	.footer-title {
	  font-size: 2.1rem;
	  font-weight: 800;
	  margin-bottom: 12px;
	  color: #fff;
	  letter-spacing: 0.7px;
	}
	
	.footer-title span {
	  font-weight: 400;
	  color: #ffd600;
	  letter-spacing: 0.6px;
	}
	
	.footer-info {
	  font-size: 1.12rem;
	  color: #ccc;
	  margin-bottom: 3px;
	}
	
	.footer-detail {
	  font-size: 1.03rem;
	  color: #bbb;
	  line-height: 1.6;
	}
	
	.footer-copy {
	  font-size: 1.08rem;
	  color: #bbb;
	  margin-top: 10px;
	  letter-spacing: 0.1px;
	}
	
	/* 반응형 */
	@media (max-width: 700px) {
	  .footer-container {
	    max-width: 97vw;
	    padding: 0 2vw;
	  }
	  .footer-title {
	    font-size: 1.4rem;
	  }
	  .footer-info, .footer-detail, .footer-copy {
	    font-size: 0.94rem;
	  }
	}

</style>

<footer class="site-footer">
  <div class="footer-container">
    <div class="footer-title">
      <b>Ocean Land</b> <span style="color: white; font-weight: 100;">Busan</span>
    </div>
    <div class="footer-info">
      48100 부산광역시 해운대구 해운대해변로266(중동) ㈜오션랜드부산
    </div>
    <div class="footer-detail">
      사업자등록번호 123-12-12345 | 대표이사 손소희 | 통신판매업신고번호 제2006-부산해운-99999호<br>
      대표전화 051-888-8888 | 팩스 051-888-8888 | 단체문의 051-888-8888
    </div>
    <div class="footer-copy">
      <span>©</span> OCEAN LAND BUSAN. All rights reserved.
    </div>
  </div>
</footer>
