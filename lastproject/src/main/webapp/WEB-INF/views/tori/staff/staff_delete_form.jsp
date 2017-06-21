<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>STAFF DELETE</title>

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
</head>
<body>
</br></br></br></br></br>
	<div class="container">
		<form class="form-inline" action="${pageContext.request.contextPath}/tori/staff/staff_delete_action" method="POST">
			<div><label for="staff_id">회원아이디 :</label></div>
			<div><input type="text" class="form-control" size="auto" id="staff_id" name="staff_id" value="${staff.staff_id}" readonly></div><br>
			<div><label for="staff_id">비밀번호 :</label></div>
			<div><input type="password" class="form-control" size="auto" id="staff_pw" name="staff_pw"></div><br>
			<div><input class="btn btn-primary" type="submit" id="staffDelete" name="staffDelete" value="직원탈퇴"></div>
		</form>
	
	
	</div>
</body>
</html>