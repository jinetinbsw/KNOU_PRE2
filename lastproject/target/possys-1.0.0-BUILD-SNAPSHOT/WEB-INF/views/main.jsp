<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<title>Main_POS SYSTEM</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="${pageContext.request.contextPath}/resources/main_assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main_assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main_assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main_assets/css/ie9.css" /><![endif]-->
	</head>
	<body>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	
	
<script>
$(document).ready(function(){
	//새창으로 깃허브 열기
	$('#git_hub').click(function(){
		window.open('https://github.com/hummingbird26/possys','newWindow')
	});
	//완료 보고서 다운받기
	$('#sucess').click(function(){
		//다운받기 로직 만들어 주세요!!
		
	});
});
</script>
		<!-- Header -->
			<header id="header">
				<h1>POS SYS</h1>   
				<nav>
					<ul>
					<li><b><a id="sucess" href="" >완료 보고서(한글파일)</a></b></li>
					<li><b><a id="git_hub" href="" >Team github 주소</a></b></li>
					<li><b><a href="#work" style="color: red;">시작하기</a></b></li>
					
						<li><a href="#intro">소개</a></li>
						<li><a href="#order">주문관리</a></li>
						<li><a href="#one">발주관리</a></li>
						<li><a href="#two">메뉴관리</a></li>
						<li><a href="#admin">직원 및 회원 관리</a></li>
						<li><a href="#shop">매장관리</a></li>
						
					</ul>
				</nav>
			</header>

		<!-- 소개 -->
			<section id="intro" class="main style1 dark fullscreen">
				<div class="content" style="height: 300px;">
					<header>
						<h3>팀 프로젝트 소개입니다.</h3>
</br>
<h3>
웹 화면개발언어
</h3>
<font>
- java Script
- JQuery
</font>
<h3>
웹 Server측 개발언어
</h3>

<font>
- java
- JSP
- Servlet 
</font>

<h3>
Framework
</h3>

<font>
-Spring
-Mybatis
</font>

<h3>
DBMS
</h3>

<font>
-Mysql
</font>

<h3>
OS
</h3>

<font>
-Window
</font>

</br>

<h3>팀프로젝트 명: Web 기반 스마트 주문관리  & POS SYSTEM</h3>

<div style="position: left">
<font>
주제: 주문관리 시스템
</br>
목적: 매장의 전반적인 관리를 웹으로 구현하여 불필요한 인력을 줄이고 보기쉽고 간편하게 처리할 수 있다.
</br>
개발환경:Spring Framework 4.3.8,Jdk 1.8, Mybatis, JSP , JSON ,JAVA ,tomcat 8.5, JSTL, JQuery, Spring tool suite(STS),웹 브라우저chrome
Mybatis(mapper)
</br>

</br>
주요기능:
휴대 기기를 사용하여 메뉴를 주문하고 테이블 현황에서 신청한 주문에 대한 정보를 확인 및 관리 할 수 있다.
테이블 현황에서 메뉴 주문 및 수정 결제시 해당 테이블에 대한 관련 정보를 화면 전환 없이 실시간으로 db 조회하여 확인 할 수 있다.
메뉴 주문후 결제완료 시점에서 소비된 식자재를 파악하여 
부족한 품목을 발주신청하여 보충할 수 있다
회원 개인별로 이용한 내역을 확인 할 수 있다.
매장의 매출과 발주시 소비한 금액을 계산하여 순 이익을 확인 할 수 있다.

</font>
</div>
<style>

#left{
	position: absolute;
  top: 200px;
  left:0;

 /*  right: 0; */
  width: 500px;
  height: 200px;
}

#right{
	position: absolute;
  top: 200px;
 /*  left:0; */

  right: 0; 
  width: 500px;
  height: 200px;
}
</style>

					</header>
					<p>Welcome to <strong>POS SYS</strong></p>
					<footer>
						<a href="#order" class="button style2 down">More</a>
					</footer>
				</div>
			</section>
	<!-- 주문 -->
				<section id="order" class="main style2 left dark fullscreen">
					<div class="content box style2">
						<header>
							<h2>주문관리 메뉴입니다.</h2>
						</header>
						<p>주요 기능: 테이블 번호를 입력하여 메뉴를 주문 가능하고 메뉴 수정 및 종결처리 주문리스트 조회가 가능합니다.
						  </p>
					</div>
				<!-- 담당업무 -->
				<div id="right">
					<header>
						<h2>담당자:홍경인</h2>
					</header>
					
					<p> - 주문목록</p>
					<p> - 주문신청</p>
					<p> - 주문내역 자동확인</p>
				</div>
				
					<a href="#one" class="button style2 down anchored">Next</a>
				</section>
		<!-- 발주 -->
			<section id="one" class="main style2 right dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>발주관리 메뉴입니다.</h2>
					</header>
					<p>주요 기능: 메뉴 주문시 소진되는 식자재를 발주신청을 통해 신청가능하다
					  </p>
				</div>
				
				<!-- 담당업무 -->	
				<div id="left">
					<header>
						<h2>담당자:오광진</h2>
					</header>
					
					<p>식재료관리</p>
					<p> - 식재료 목록</p>
					<p> - 발주업체 목록</p>
					<p>식재료 현황 관리</p>
					<p> - 현황 및 발주/폐기 등록</p>
					<p> - 발주신청 목록</p>
					<p> - 발주입고 목록</p>
										
				</div>
				
				<a href="#two" class="button style2 down anchored">Next</a>
			</section>

		<!-- 메뉴 -->
			<section id="two" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>메뉴 관리</h2>
					</header>
					<p>주요기능:새로운 메뉴를 등록 및 관리가 가능하고 해당 메뉴에 필요한 식자재를 등록 할 수 있다</p>
				</div>
				
				<!-- 담당업무 -->
				<div id="right">
					<header>
						<h2>담당자:최홍락</h2>
					</header>
					
					<p> - 메뉴 등록</p>
					<p> - 메뉴 목록 화면</p>
				</div>
				
				
				<a href="#admin" class="button style2 down anchored">Next</a>
			</section>
		
		
		<!-- 직원 -->
					<section id="admin" class="main style2 right dark fullscreen">
						<div class="content box style2">
							<header>
								<h2>직원 및 회원관리 메뉴입니다.</h2>
							</header>
							<p>주요 기능: 회원 및 직원의 정보를 관리합니다.</p>
						</div>
					
			<!-- 담당업무 -->	
				<div id="left">
					<header>
						<h2>담당자:배상훈</h2>
					</header>
					
					<p> - 회원관리</p>
					<p> - 회원 검색</p>
					
					<h2>담당자:백승욱</h2>
					
					<p> - 직원관리 : 직원목록</p>
				</div>
						<a href="#shop" class="button style2 down anchored">Next</a>
					</section>

		<!-- 매장 -->
			<section id="shop" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>매장 관리</h2>
					</header>
					<p>주요기능:매장의 매출현황 및 테이블 현황을 통해 매장에 관한 전반적인 상태를 확인할 수 있다.</p>
				</div>
			
			<!-- 담당업무 -->
				<div id="right">
					<header>
						<h2>담당자:배상훈</h2>
					</header>
					
					<p> - 월별 지출내역</p>
					<p> - 테이블 현황</p>
					<p> - 매출 현황</p>
					
					<h2>담당자:백승욱</h2>
					<p>결제관리 </p>
					<p> - 결제목록</p>
					<p> - 결제취소목록</p>
					<p> - 카드거래목록</p>
				</div>
			
				<a href="#work" class="button style2 down anchored">Next</a>
			</section>



		<!-- Work -->
			<section id="work" class="main style3 primary">
				<div class="content">
					<header>
						<h2>시작하기</h2>
						<p>시작하기 버튼을 클릭하시면 로그인 페이지로 이동합니다.</p>
					</header>
				<input type="button" value="시작하기" onclick="location.href='join'";/>
					<!-- Gallery  -->
		<%-- 				<div class="gallery">
							<article class="from-left">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/01.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/01.jpg" title="The Anonymous Red" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/02.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/02.jpg" title="Airchitecture II" alt="" /></a>
							</article>
							<article class="from-left">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/03.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/03.jpg" title="Air Lounge" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/04.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/04.jpg" title="Carry on" alt="" /></a>
							</article>
							<article class="from-left">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/05.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/05.jpg" title="The sparkling shell" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/06.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/06.jpg" title="Bent IX" alt="" /></a>
							</article>
						</div>
 --%>
				</div>
			</section>

		<!-- Contact -->
		<!-- 	<section id="contact" class="main style3 secondary">
				<div class="content">
					
					<div class="box">
						<form method="post" action="#">
							<div class="field half first"><input type="text" name="name" placeholder="Name" /></div>
							<div class="field half"><input type="email" name="email" placeholder="Email" /></div>
							<div class="field"><textarea name="message" placeholder="Message" rows="6"></textarea></div>
							<ul class="actions">
								<li><input type="submit" value="Send Message" /></li>
							</ul>
						</form>
					</div>
				</div>
			</section> -->

		<!-- Footer -->
			<footer id="footer">


			</footer>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/jquery.poptrox.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/skel.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="${pageContext.request.contextPath}/resources/main_assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/main.js"></script>

	</body>
</html>