<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   
<title>회원정보 수정화면</title>
<%@ include file="../modal/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function(){
			$('#ubtn').click(function(){
				
				var regExp = /\s/g;//공백검사 정규식
				 var phone = $('#member_phone').val();
				 var name = $('#member_name').val();
				 var point = $('#member_point').val();
			if($('#member_phone').val()==""||phone.match(regExp)) {
				$('#phone_re').html("<font color=red>Check the spaces in the box.</font>");
				$('#phone_re').show();
				$('#member_phone').focus();
			}
			else if($('#member_name').val()==""||name.match(regExp)) {
				$('#phone_re').hide();
				$('#name_re').html("<font color=red>Check the space in the name box.</font>");
				$('#name_re').show();	
				$('#member_name').focus();
			}
			else if($('#member_point').val() ==""||point.match(regExp)){
				$('#phone_re').hide();
				$('#name_re').hide();
				$('#point_re').html("<font color=red>Check the space in the point box.</font>");
				$('#point_re').show();	
				$('#member_point').focus();
			}
			else{
				frm.submit();
			}			
			});
		});
	</script>	

</head>
<body>
<div class="container">
<br/>
<br/>
<br/>
<br/>
<h1>회원정보 수정화면</h1>
	<form id="frm" action="${pageContext.request.contextPath}/member_update" method="post">
        <div class="form-group">전화번호 :
            <input class="form-control" name="member_phone" id ="member_phone" value="${Member.member_phone}" type="text" readonly="readonly"/>
            <input class="form-control" name="p_member_phone" id ="p_member_phone" value="${Member.member_phone}" type="hidden" readonly="readonly"/>
        </div>
        <div id="phone_re" style="display:none;"></div> 
        <div class="form-group">
            <label for="boardPw">이름 :</label>
            <input class="form-control" name="member_name" id="member_name" value="${Member.member_name}" type="text"/>
        </div>
        <div id="name_re" style="display:none;"></div>     
        <div class="form-group">
            <label for="member_point">마일리지 :</label>
            <input class="form-control" name="member_point" id="member_point" value="${Member.member_point}" type="text"/>
        </div>
        <div id="point_re" style="display:none;"></div> 
        <div class="form-group">가입일자 :
            <input class="form-control" name="member_sign" id="member_sign" value="${Member.member_sign}" type="text"  readonly="readonly"/>
        </div>
          <div class="form-group">
            <label for="member_join">최근방문일자 :</label>
            <input class="form-control" name="member_join" id="member_join" value="${Member.member_join}" type="text"  readonly="readonly"/>
        </div>
        <input class="btn btn-default" type="button" id="ubtn" value="등록">
		<input class="btn btn-default" type="reset" id="reset" value="초기화">
    </form>
    </div>
</body>
</html>