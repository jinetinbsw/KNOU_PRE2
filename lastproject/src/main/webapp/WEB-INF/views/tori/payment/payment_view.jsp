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

<!-- script를 이용해서 결제취소한 후에 결제취소테이블에 등록하는 과정 -->
<script>
	function paymentDelete(){
		alert('결제 취소를 진행하시겠습니까?');
		console.log('결제취소');
		/* paymentdelete.href="${pageContext.request.contextPath}/tori/payment/payment_delete?payment_id=${payment.payment_id}"; */
	}
</script>

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
		</br></br>
		<img src="${pageContext.request.contextPath}/resources/asset/img/pos-systems.jpg" height="300px" width="500px" alt="결제회사정보">
	
	</div>
	<div class="col-sm-6">
		<table class="table table-hover table-stripped mono_table">
		<caption>결제관리기본정보</caption>
			<tr>
			<td class="td">결제ID
			</td>
			<td>${payment.payment_id}
			</td>
			</tr>
			<tr>
			<td class="td">테이블주문번호
			</td>
			<td>${payment.table_order_id}
			</td>
			</tr>
			<tr>
			<td class="td">결제총액
			</td>
			<td>${payment.payment_total}
			</td>
			</tr>
			<tr>
			<td class="td">결제금액
			</td>
			<td>${payment.payment_pay}
			</td>
			</tr>
			<tr>
			<td class="td">결제일자
			</td>
			<td>${payment.payment_date}
			</td>
			</tr>
			<tr>
			<td class="td">결제유형
			</td>
			<td>${payment.payment_cate}
			</td>
			</tr>
			<tr>
			<td class="td">결제상태
			</td>
			<td>${payment.payment_state}
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
			<td class="td">회원전화번호
			</td>
			<td>${payment.member_phone}
			</td>
			</tr>
			<tr>
			<td class="td">적립마일리지
			</td>
			<td>${payment.payment_addmileage}
			</td>
			</tr>
			<tr>
			<td class="td">사용마일리지
			</td>
			<td>${payment.payment_usemileage}
			</td>
			</tr>
	</table>
	<br><br>
	
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_list">리스트로</a>
	<a class="btn btn-primary" onclick="javascript:paymentDelete();" name="paymentdelete" id="paymentdelete"
	href="${pageContext.request.contextPath}/tori/payment/payment_delete?payment_id=${payment.payment_id}">거래취소</a>
</div>

</div>

</body>
</html>