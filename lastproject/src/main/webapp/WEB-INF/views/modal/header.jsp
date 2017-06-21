<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/bootstrap.min.css">

      <!-- plugins -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/font-awesome.min.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/simple-line-icons.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/fullcalendar.min.css"/>
	<link href="${pageContext.request.contextPath}/resources/asset/css/style.css" rel="stylesheet">
<!-- end: Css -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/asset/img/logomi.png">
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
   <!-- start: Header -->
        <nav class="navbar navbar-default header navbar-fixed-top">
          <div class="col-md-12 nav-wrapper">
            <div class="navbar-header" style="width:100%;">
             
                <a href="${pageContext.request.contextPath}/test_index/index" class="navbar-brand"> 
                 <b>POS_SYSEM</b>
                </a>
				
							
              <ul class="nav navbar-nav navbar-right user-nav">
                <li class="user-name"><span>사용자 : ${sessionScope.admin.admin_name}</span></li>
                <!-- 로그아웃 버튼 -->
                 <li><a href="${pageContext.request.contextPath}/logout"><span class="fa fa-power-off "></span></a></li>
                 
<%--                   <li class="dropdown avatar-dropdown">
                   <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" class="img-circle avatar" alt="user name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"/>
                   <ul class="dropdown-menu user-dropdown">
                     <li><a href="#"><span class="fa fa-user"></span> My Profile</a></li>
                     <li><a href="#"><span class="fa fa-calendar"></span> My Calendar</a></li>
                     <li role="separator" class="divider"></li>
                     <li class="more">
                      <ul>
                        <li><a href=""><span class="fa fa-cogs"></span></a></li>
                        <li><a href=""><span class="fa fa-lock"></span></a></li>
                        <li><a href="${pageContext.request.contextPath}/logout"><span class="fa fa-power-off "></span></a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li ><a href="#" class="opener-right-menu"><span class="fa fa-coffee"></span></a></li>
               --%>
              </ul>			
			 <!-- 네비바 영역 각자 보여줄 페이지 추가(기능 시작 페이지) -->
				
						
			<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
			<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
			<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>	
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/modal/style.css" />
			<!-- 주문알림 팝업창 호출 -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
			<script type="text/javascript"> 
			$(document).ready(function(){
				$('#btn').click(function(){
					
					window.open("${pageContext.request.contextPath}/ho.html",'popup','width=500,height=300,left=0,top=0,toolbar=no,locaton=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no');
						
					
				});
			});
			</script>
			
			<nav id="menu" class="menu">
			 	<ul class="dropdown">
			<li ><a href="#" title="Link">회원 및 직원관리</a>
			        <ul >
		      <li ><a href="#Link" title="Link">직원관리</a>
		      <ul>
		          <%-- <li ><a href="${pageContext.request.contextPath}/tori/staff/staff_add_form" title="Link">직원추가</a></li> --%>
		          <li ><a href="${pageContext.request.contextPath}/tori/staff/staff_list" title="Link">직원목록</a></li>
		        </ul>
		        </li>
			          
			          <li ><a href="${pageContext.request.contextPath}/real_time" title="link ">회원검색</a></li>
			          <li ><a href="${pageContext.request.contextPath}/member_list" title="Link">회원목록(회원관리)</a></li>
			         
			         <%--  <li ><a href="${pageContext.request.contextPath}/total_payment" title="Link">매출내역조회</a></li>
			          <li ><a href="${pageContext.request.contextPath}/table" title="Link">테이블 목록</a></li> --%>
			        </ul>
			      </li>
			      <li ><a href="#Link" title="Link">주문관리</a>
			        <ul >
			          <li ><a href="${pageContext.request.contextPath}/order_list" title="Link">주문목록</a></li>
			          <li ><a href="${pageContext.request.contextPath}/order_table_input">주문신청</a></li>
			          <li ><a href="#" id="btn" title="Link">주문내역 자동확인</a></li>
			        </ul>
			      </li>
			      <li ><a href="#Link" title="Link">발주 관리</a>
			        <ul >
			          <li ><a href="#">식재료 관리</a>
			          	<ul>
			          		<li><a href="${pageContext.request.contextPath}/food_list">식재료 목록</a></li>
			          		<li><a href="${pageContext.request.contextPath}/ep_manage_list">발주업체 목록</a></li>
			          	</ul>
			          </li>			          
			          <li ><a href="#">식재료 현황 관리</a>
			          	<ul>
			          		<li><a href="${pageContext.request.contextPath}/ep_food_present">현황 및 발주/폐기 등록</a></li>
			          		<li><a href="${pageContext.request.contextPath}/ep_order_list">발주신청 목록</a></li>
			          		<li><a href="${pageContext.request.contextPath}/ep_wh_list">발주입고 목록</a></li>
			          	</ul>
			          </li>
			          <li ><a href="#">식재료 폐기 관리</a>
			          	<ul>
			          		<li><a href="${pageContext.request.contextPath}/drop_list">폐기 목록</a></li>			          		
			          	</ul>
			          </li>			          
			        </ul>
			      </li>
			      <li ><a href="#Link" title="Link">메뉴관리</a>
			        <ul >
			          <li ><a href="${pageContext.request.contextPath}/menu_add_form" title="Link">메뉴 등록 </a></li>
			          <li ><a href="${pageContext.request.contextPath}/menu_list" title="Link">메뉴 목록 화면</a></li>
			        </ul>
			      </li>
			    

			   		 <li ><a href="#Link" title="Link">매장현황</a>
			      	 <ul>
			           <li ><a href="#Link" title="Link">결제관리</a>
			      	<ul>
			          <li ><a href="${pageContext.request.contextPath}/tori/payment/payment_list" title="Link">결제목록 </a></li>
			          <li ><a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_list" title="Link">결제취소목록</a></li>
			          <li ><a href="${pageContext.request.contextPath}/tori/payment/payment_card_list" title="Link">카드거래목록</a></li>
			        </ul>
			        </li>
			          <li><a href="${pageContext.request.contextPath}/expense_folios">월별 지출내역</a></li>
			          <li ><a href="${pageContext.request.contextPath}/test_index/table_state" >테이블 현황</a></li>
			          <li ><a href="${pageContext.request.contextPath}/chartjs">매출현황</a></li>       
			        </ul>
			        </li>	 				 	 
		      </nav>
           				
           				<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> 
						<script src="${pageContext.request.contextPath}/resources/modal/script.js"></script>
           				
                   
           <!--    <ul class="nav navbar-nav search-nav">
                <li>
                   <div class="search">
                    <span class="fa fa-search icon-search" style="font-size:23px;"></span>
                    <div class="form-group form-animate-text">
                      <input type="text" class="form-text" required>
                      <span class="bar"></span>
                      <label class="label-search">뭘 <b>검색</b> </label>
                    </div>
                  </div>
                </li>
              </ul> -->

            </div>
          </div>
        </nav>
      <!-- end: Header -->
</body>
</html>