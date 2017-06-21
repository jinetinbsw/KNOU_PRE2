<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>직원 상세정보</title>

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
	
 .nomargin {
	 border:none; border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

</style>
</head>
<body>
</br></br></br></br></br>
<div class="container">
<br><br>
<div>
	<div class="col-sm-6">
		<img src="${pageContext.request.contextPath}/resources/staff/STAFF.png" height="250px" width="500px" alt="결제회사정보">
	
	</div>
	<div class="col-sm-6">
		<table class="table table-hover table-stripped mono_table">
		<caption>직원관리기본정보</caption>
			<tr>
			<td>직원ID
			</td>
			<td>${staff.staff_id}
			</td>
			</tr>
			<tr>
			<td>직원이름
			</td>
			<td>${staff.staff_name}
			</td>
			</tr>
			<tr>
			<td>직급
			</td>
			<td>${staff.staff_level}
			</td>
			</tr>
			<tr>
			<td>성별
			</td>
			<td>${staff.staff_gender}
			</td>
			</tr>
			<tr>
			<td>전화번호
			</td>
			<td>${staff.staff_phone}
			</td>
			</tr>
			<tr>
			<td>직원등록일자
			</td>
			<td>${staff.staff_date}
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
			<td>직원비밀번호
			</td>
			<td><input type="password" class="nomargin" value="${staff.staff_pw}" readonly>
			</td>
			</tr>
			<tr>
			<td>직원이메일</td>
			<td>${staff.staff_email}</td>
			</tr>
			<tr>
			<td>직원연령
			</td>
			<td>${staff.staff_age}
			</td>
			</tr>
			<tr>
			<td>직원주소
			</td>
			<td>${staff.staff_addr}
			</td>
			</tr>
	</table>
	<br><br>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/staff/staff_update_form?staff_id=${staff.staff_id}">직원정보수정</a>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/staff/staff_delete_form?staff_id=${staff.staff_id}">직원정보삭제</a>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/staff/staff_list">직원목록보기</a>
</div>

</div>

</body>
</html>