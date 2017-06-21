<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Responsive Auto Show/Hide Toggle Menu Demo</title>
 
 
 
 
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/modal/style.css" />
</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function(){
	$('#btn').click(function(){
		
		window.open("ho.html",'popup','width=500,height=300,left=0,top=0,toolbar=no,locaton=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no');
			
		
	});
});
</script>
<div class="nav_wrapper"> 
  <!--<a class="menu-link" href="#menu"></a>-->
  
  <div class="spinner-master">
    <input type="checkbox" id="spinner-form" />
    <label for="spinner-form" class="spinner-spin">
    <div class="spinner diagonal part-1"></div>
    <div class="spinner horizontal"></div>
    <div class="spinner diagonal part-2"></div>
    </label>
  </div>
  <a href="#search_box" class="btn" id="search">&#9740;</a>
  <nav id="menu" class="menu">
    <ul class="dropdown">
      <li ><a href="${pageContext.request.contextPath}/home">Home</a>
   <!--      <ul >
         <li ><a href="#Link" title="Link">Link » </a>
            <ul >
              <li ><a href="#Link" title="Link">Link</a></li>
              <li ><a href="#Link" title="Link">Link</a></li>
            </ul>
          </li>
          <li ><a href="#Link" title="Link">About</a></li>
          <li ><a href="#Link" title="Link">Link » </a>
            <ul >
              <li ><a href="#Link" title="Link">Link</a></li>
              <li ><a href="#link" title="Link">Link</a></li>
              <li ><a href="#Link" title="Link">Link </a></li>
            </ul>
          </li>
        </ul> -->
      </li>
      <li ><a href="#" title="Link">member</a>
        <ul >
          <li ><a href="${pageContext.request.contextPath}/real_time" title="link ">실시간검색</a></li>
          <li ><a href="${pageContext.request.contextPath}/member_list" title="Link">회원목록(회원관리)</a></li>
          <li ><a href="#" id="btn" title="Link">주문내역 자동확인</a></li>
          <li ><a href="${pageContext.request.contextPath}/total_payment" title="Link">매출내역조회</a></li>
          <li ><a href="${pageContext.request.contextPath}/table" title="Link">테이블 목록</a></li>
        </ul>
      </li>
      <li ><a href="#Link" title="Link">Order</a>
        <ul >
          <li ><a href="${pageContext.request.contextPath}/order_list" title="Link">주문목록</a></li>
          <li ><a href="#Link" title="Link">Link</a></li>
          <li ><a href="#Link" title="Link">Link</a></li>
        </ul>
      </li>
      <li ><a href="#Link" title="Link">food</a>
        <ul >
          <li ><a href="${pageContext.request.contextPath}/food_list">식재자 관리</a></li>
          <li ><a href="${pageContext.request.contextPath}/ep_manage_list">발주 업체 관리</a></li>
          <li ><a href="#Link" title="Link">Link</a></li>
          <li ><a href="#Link" title=" Link"> Link</a></li>
        </ul>
      </li>
      <li ><a href="#Link" title="Link">menu</a>
        <ul >
          <li ><a href="${pageContext.request.contextPath}/menu_add_form" title="Link">메뉴 등록 </a></li>
          <li ><a href="${pageContext.request.contextPath}/menu_list" title="Link">메뉴 목록 화면</a></li>
        </ul>
      </li>
      <li ><a href="#Link" title="Link">Payment</a>
      <ul>
          <li ><a href="${pageContext.request.contextPath}/tori/payment/payment_list" title="Link">결제목록 </a></li>
          <li ><a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_list" title="Link">결제취소목록</a></li>
          <li ><a href="${pageContext.request.contextPath}/tori/payment/payment_card_list" title="Link">카드거래목록</a></li>
        </ul>
        </li>
       <li ><a href="#Link" title="Link">Staff</a>
      <ul>
          <li ><a href="${pageContext.request.contextPath}/tori/staff/staff_add_form" title="Link">직원추가</a></li>
          <li ><a href="${pageContext.request.contextPath}/tori/staff/staff_list" title="Link">직원목록</a></li>
        </ul>
        </li>
    </ul>
  </nav>
<!-- 
  <form class="search_box" id="search_box" action="/search/">
    <input name="search_criteria" id="search" placeholder="Search here">
    <input class="search_icon" value="Search" type="submit">
  </form> -->
</div>




<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/modal/script.js"></script>

</body>
</html>
