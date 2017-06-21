<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
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
<title>Staff_UPDATE</title>

<script>
$(document).ready(function(){
	$('#staffUpdate').click(function(){
		if($('#staff_pw').val().length<4){
			alert('직원비밀번호를 잘 입력해주세요.');
      		$('#staff_pw').focus();
		}else if($('#staff_name').val()==''){
			alert('직원 이름을 잘 입력해주세요.');
      		$('#staff_name').focus();
		}else if($('#staff_level').val()==''){
			alert('직급을 잘 입력해주세요.');
      		$('#staff_level').focus();
		}else if($('#staff_age').val()==''){
			alert('직원의 나이를 읿력해 주세요.');
      		$('#staff_age').focus();
		}else if($('#staff_addr').val()==''){
			alert('직원주소를 잘 입력해 주세요.');
      		$('#staff_addr').focus();
		}else if($('#staff_gender').val()==''){
			alert('직원의 성별을 입력해주세요.');
      		$('#staff_gender').focus();
		}else if($('#staff_phone').val()==''){
			alert('직원의 전화번호를 잘 입력해주세요.');
      		$('#staff_phone').focus();
		}else {
			$('#staffUpdateForm').submit();
		}
	});
});

</script>

</head>
<body>
</br></br></br></br></br>
<div class="container">
<!-- form action에도 입력폼 및 리스트로 가는 것을 작성하지 않고 다른 경로를 작성해본다. 그리고  컨트롤러, 리스트, 매퍼, DTO, DAO, 및 입력 폼의 name속성의 값들을 전부  DB내의 컬럼명으로 통일해서 작성한다-->
	<form id="staffUpdateForm" class="form-inline" action="${pageContext.request.contextPath}/tori/staff/staff_update_action" method="post">
	<table class="table table-stripped table-hover">
		<tr>
		<td>스태프ID</td>
		<td><input class="form-control" size="auto" id="staff_id" name="staff_id" value="${staff.staff_id}" readonly></td>
		</tr>
		<tr>
		<td>비밀번호</td>
		<td><input class="form-control" size="auto" id="staff_pw" name="staff_pw" type="password" value="${staff.staff_pw}"></td>
		</tr>
		<tr>
		<td>성명</td>
		<td><input class="form-control" size="auto" id="staff_name" name="staff_name" type="text" value="${staff.staff_name}"></td>
		</tr>
		<tr>
		<td>직급</td>
		<td><input class="form-control" size="auto" id="staff_level" name="staff_level" type="text" value="${staff.staff_level}"></td>
		</tr>
		<tr>
		<td>나이</td>
		<td><input class="form-control" size="auto" id="staff_age" name="staff_age" type="text" value="${staff.staff_age}"></td>
		</tr>
		<tr>
		<td>주소</td>
		<td><input class="form-control" size="auto" id="staff_addr" name="staff_addr" type="text" value="${staff.staff_addr}"></td>
		</tr>
		<tr>
		<td>성별</td>
		<td>
		<!-- value="${staff.staff_gender}" -->
		<input class="form-control" size="auto" id="staff_gender" name="staff_gender" type="radio" value="남">남자
		<input class="form-control" size="auto" id="staff_gender" name="staff_gender" type="radio" value="여">여자
		</td>
		</tr>
		<tr>
		<td>핸드폰</td>
		<td><input class="form-control" size="auto" id="staff_phone" name="staff_phone" type="tel" value="${staff.staff_phone}"></td>
		</tr>
		<tr>
		<td>가입일자</td>
		<td><input class="form-control" size="auto" id="staff_date" name="staff_date" type="date" value="${staff.staff_date}" readonly></td>
		</tr>
	</table>
	<input class="btn btn-primary" type="submit" id="staffUpdate" name="staffUpdate" value="수정하기">
	<input class="btn btn-primary" type="reset" id="staffReset" name="staffReset" value="다시입력">
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/staff/staff_list">직원목록</a>
	</form>
	
</div>
</body>
</html>
