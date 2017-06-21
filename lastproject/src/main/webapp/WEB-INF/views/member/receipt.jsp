<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영수증 출력 화면</title>
</head>
<body>
	 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	// 아이디 name 의 text값을 name 변수에 담아준다.	
	 var name = $('#name').text();
	//첫번째 자리부분만 잘라서 rename1에 담아준다.
	 var rename1 = name.substr(1,1);
	
	//3번째 자리부터 마지막까지 잘라서  rename2에 담아준다
	 var rename2 = name.substr(3,name.length);
	//아이디가 name인것의 text값을 rename1변수와 * rename2변수를 조합해 출력해준다.	
	$('#name').text(rename1+'*'+rename2);
		
	 var phone = $('#phone').text();
	 var rephone1 = phone.substr(0,5);
	 var rephone2 = phone.substr(8,phone.length);
	 	$('#phone').text(rephone1+'***'+rephone2);	
	 
	 	/* alert('test'); */
		
		
		/* alert(name);
		alert(phone); */
		console.log(rename2+'<<<<');
	});
	</script>
		<div style="border: 2px;">
		<p>──────────── 한 국 관 ───────────</p>
		<p>──────────── 주문 내역 ──────────</p>	
		<c:forEach  var="Nre" items="${receiptList}">
		<p>메뉴명 : ${Nre.menu_name}</p>
		<p>주문 수량  * ${Nre.order_detail_ea}</p>
		</c:forEach>
		
			<c:forEach var="Ore" items="${receiptList}" end="0">	
				<p>──────────── 결제 내역 ───────────</p>
				<p>소계 : ${Ore.order_detail_sum} 원</p>	
				<p>결제 번호 : ${Ore.payment_id}</p>
				<p>총 금액 : ${Ore.payment_total} 원</p>
				<p>결제 금액 : ${Ore.payment_pay} 원</p>
				<p>거스름돈 : ${Ore.payment_pay - Ore.payment_total + Ore.payment_usemileage} 원</p>
				<p>적립 마일리지 : ${Ore.payment_addmileage} point</p>
				<p>사용 마일리지 : ${Ore.payment_usemileage} point</p>
				<p>────────────────────────────</p>
				<p>결제 날짜 : ${Ore.payment_date}</p>
				<p>결제 방법 : ${Ore.payment_cate} 결제</p>
				<p>결제 상태 : ${Ore.payment_state} 처리</p>		
			 </c:forEach> 
		 
		 <c:forEach var="Mre" items="${receiptList}" end="0">
				<p>──────────── 회원 정보 ────────────</p>	
				<font>전화번호 : <font id="phone">${Mre.member_phone}</font></font>
				</br>
				</br>
				<font>이름 :<font id="name"> ${Mre.member_name}</font></font>
				<p>잔여 마일리지 : ${Mre.member_point}</p>	
			</c:forEach>
		</div>
</body>
</html>