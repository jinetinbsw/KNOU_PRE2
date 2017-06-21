<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결제 상세정보</title>
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
   
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<%@ include file="../../modal/header.jsp" %>
<%-- <%@ include file="../../modal/header.jsp" %> --%>

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
		<img src="${pageContext.request.contextPath}/resources/asset/img/pos-systems.jpg" height="300px" width="500px" alt="카드결제정보">
	
	</div>
	<div class="col-sm-6">
		<table class="table table-hover table-stripped mono_table">
		<caption>카드결제기본정보</caption>
			<tr>
			<td>승인번호
			</td>
			<td>${card.card_id}
			</td>
			</tr>
			<tr>
			<td>결제번호
			</td>
			<td>${card.payment_id}
			</td>
			</tr>
			<tr>
			<td>승인구분
			</td>
			<td>${card.card_app}
			</td>
			</tr>
			<tr>
			<td>결제일자
			</td>
			<td>${card.card_date}
			</td>
			</tr>
			<tr>
			<td>카드사
			</td>
			<td>${card.card_company}
			</td>
			</tr>
			<tr>
			<td>카드결제금액
			</td>
			<td>${card.card_total}
			</td>
			</tr>
			<tr>
			<td>카드공급가액
			</td>
			<td>${card.card_price}
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
			<td>세부사항
			</td>
			<td>${card.card_detail}
			</td>
			</tr>
			<tr>
			<td>부가세
			</td>
			<td>${card.card_tax}
			</td>
			</tr>
			<!-- el식을 통해서 db의 데이터를 가져올 때는 db내의 테이블명.컬럼명으로 가져온다. -->
	</table>
	<br><br>
	
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_card_list">리스트로</a>
</div>

</div>

</body>
</html>