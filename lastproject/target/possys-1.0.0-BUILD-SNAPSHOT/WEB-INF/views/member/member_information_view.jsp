<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
   
<title>회원 개인정보 화면</title>
<%@ include file="../modal/header.jsp" %>
</head>
<body>
<br/>
<br/>
<br/>
<br/>
<div class="container">
    <h1>회원정보 화면</h1>
     <table class="table">
         <tbody>
             <tr>
                <td>member_phone :</td>
                <td>${Member.member_phone}</td>
               </tr>
            <tr>
                   <td>member_name :</td>
                   <td>${Member.member_name}</td>
            </tr>
            <tr>
                   <td>member_point :</td>
                   <td>${Member.member_point}</td>
            </tr>
            <tr>
                   <td>member_sign :</td>
                   <td>${Member.member_sign}</td>
            </tr>
            <tr>
                   <td>member_join :</td>
                   <td>${Member.member_join}</td>
            </tr>
        </tbody>
    </table>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/member_update?member_phone=${Member.member_phone}">수정</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/member_Secede?member_phone=${Member.member_phone}">삭제</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/member_list">글목록</a>
</div>
</body>
</html>

