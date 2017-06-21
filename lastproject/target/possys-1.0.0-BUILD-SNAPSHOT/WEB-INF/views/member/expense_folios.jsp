<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>


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
<title>지출 내역</title>
<%@ include file="../modal/header.jsp" %>
 <style>
 ::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; display:none;}
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url(`./images/bg.png`) #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}
 
 
 .table4_1 table {
	width:100%;
	margin:15px 0;
	border:0;
	line-height: 1.5;
}
.table4_1 th {
	background-color:#F56E6E;
	color:#FFFFFF
}
.table4_1,.table4_1 th,.table4_1 td {
	font-size:0.95em;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table4_1 th,.table4_1 td {
	border: 1px solid #f9acac;
	border-width:1px 0 1px 0
}
.table4_1 tr {
	border: 1px solid #f9acac;
}
.table4_1 tr:nth-child(odd){
	background-color:#fbcece;
}
.table4_1 tr:nth-child(even){
	background-color:#fdfdfd;
}		
 </style>
</head>

<body>
<div class="container">
	<br/></br><br/></br>
	<h1>월별 순이익</h1>
	<br/></br>
	<div style="overflow:scroll; width:100%; height:550px;">
		<table class="table table-striped table4_1">
			<thead>
				<tr>
				<th>매출 일자</th>
				<th>총 판매 금액</th>
				<th>발주 입고 일자</th>
				<th>발주 가격</th>
				<th>순 이 익</th>
				</tr>
			</thead>
		
			<tbody>
				<c:forEach var="m" items="${expense_folios}">
				<tr id="t_tr">
				<td>${m.payment_date}</td>
				<td id="payment_total">${m.payment_total}원</td>
				<td>${m.ep_order_wh_date}</td>
				<td id="ep_order_total_price">${m.ep_order_total_price}원</td>
				<td >${m.total_result}원</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>