<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결제 상세정보</title>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

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
   
<%@ include file="../../modal/header.jsp" %>

<style type="text/css">

.mono_table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 3px;
    border: outset;
    color: black;
}

.td {
   padding: 15px;
    border: outset;
    border-left: 5px solid #C03;
    border-bottom: 1px solid #DDD;
    background: #FCF0F3;
    font-weight: normal;
    text-align:center;
    text-shadow: 0 1px #FFF;
    vertical-align: middle;


	}
 

</style>
</head>
<body>
</br></br></br></br></br>
<div class="container">
<br><br>
<div>
	<div class="col-sm-6">
		<img src="${pageContext.request.contextPath}/resources/asset/img/pos-systems.jpg" height="300px" width="500px" alt="결제회사정보">
	
	</div>
	<div class="col-sm-6">
		<table class="table table-hover table-stripped mono_table">
		<caption>결제취소기본정보</caption>
			<tr>
			<td>결제취소ID
			</td>
			<td>${paymentcancel.payment_cancel_id}
			</td>
			</tr>
			<tr>
			<td>결제ID
			</td>
			<td>${paymentcancel.payment_id}
			</td>
			</tr>
			<tr>
			<td>테이블주문아이디
			</td>
			<td>${paymentcancel.table_order_id}
			</td>
			</tr>
			<tr>
			<td>결제취소금액
			</td>
			<td>${paymentcancel.payment_cancel_pay}
			</td>
			</tr>
			<tr>
			<td>결제취소총액
			</td>
			<td>${paymentcancel.payment_cancel_total}
			</td>
			</tr>
			<tr>
			<td>결제취소일자
			</td>
			<td>${paymentcancel.payment_cancel_date}
			</td>
			</tr>
			<tr>
			<td>결제취소유형
			</td>
			<td>${paymentcancel.payment_cate}
			</td>
			</tr>
		</table>
	
	</div>
</div>
<br><br>
<div class="container">
	<table class="table table-stripped table-hover mono_table">
	<caption>추가정보</caption>
			<tr>
			<td>회원전화번호
			</td>
			<td>${paymentcancel.member_phone}
			</td>
			</tr>
			<tr>
			<td>반환마일리지
			</td>
			<td>${paymentcancel.payment_cancel_backmileage}
			</td>
			</tr>
			<tr>
			<td>회수마일리지
			</td>
			<td>${paymentcancel.payment_cancel_returnmileage}
			</td>
			</tr>
	</table>
	<br><br>
	
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_cancel_list">리스트로</a>
</div>

</div>

</body>
</html>