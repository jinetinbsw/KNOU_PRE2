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
<title>Staff_ADD</title>

<script>
$(document).ready(function(){
//직원가입페이지 처음에는 아이디 및 폰번호중복체크버튼을 숨긴다.
	$('#checkStaffId').hide();
	$('#checkStaffPhone').hide();
	
	//직원아이디를 난수생성된 값으로 입력받거나 직접 입력하고 마우스클릭 한번하면 아이디중복체크버튼이 나타나게 한다
	$('#staff_id').click(function(){
		if($('#staff_id').val()!='')
			$('#checkStaffId').show();
	});
	
	//직원폰번호를 입력하고 마우스클릭 한번하면 아이디중복체크버튼이 나타나게 한다
	$('#staff_phone').click(function(){
		if($('#staff_phone').val()!='')
			$('#checkStaffPhone').show();
	});
	
	$('#staffAdd').click(function(){
		if($('#staff_id').val()==''){
			alert('직원아이디를 입력하시오.');
      		$('#staff_id').focus();
		}else if($('#staff_pw').val().length<4){
			alert('직원비번를 4자리 이상 입력하시오.');
      		$('#staff_pw').focus();
		}else if($('#staff_name').val()==''){
			alert('직원의 이름을 입력해주세요.');
      		$('#staff_name').focus();
		}else if($('#staff_level').val()==''){
			alert('직급을 입력해주세요.');
      		$('#staff_level').focus();
		} /*else 
			if($('#staff_age').val()==''){
			alert('나이을 입력해주세요.');
      		$('#staff_age').focus();
		} else 
			if($('#staff_addr').val()==''){
			alert('주소를 입력해주세요.');
      		$('#staff_addr').focus();
		}else 
			 if($('#staff_gender').val()==''){
			alert('성별구분을 입력해주세요.');
      		$('#staff_gender').focus();
		}
			else 
			if($('#staff_phone').val()==''){
			alert('직원의 핸드폰번호를 입력해주세요.');
      		$('#staff_phone').focus();
		} 
			else 
			 if($('#staff_date').val()==''){
			alert('직원가입일자는 언제인가요.');
      		$('#staff_date').focus();
		} */
			else {
			$('#staffForm').submit();
		}
	});
});

//직원아이디 중복여부를 체크하는 기능을 한다.
function chkDupStaffId(){
	var prmId = $("#staff_id").val();
	console.log(prmId);
	if($("#staff_id").val() == '')
		{	alert('ID를 입력해 주세요!');
			return;
		}
	 $.ajax({
		type:'POST',
		data:"prmId="+$("#staff_id").val(),
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		dataType:'text',
		url:'${pageContext.request.contextPath}/tori/staff/chkDupStaffId',
		success : function(data){
			alert("성공");
			var chkRst = data;
			if(chkRst=="Y"){
				alert("등록 가능 합니다");
				console.log(data);
				//$("#idcheck").val('Y');
			}else{
				alert("중복됩니다");
				console.log(data);
				//$("#idcheck").val('N');
			}
		},
		error : function(request,status,error){
			
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("실패");
		}
	});
}

function insertChk(){
	var frm = document.companyForm;
	
	if(!chkVal('staff_id','staff_id'))
		return false;
	if($("#idChk").val()=='N'){
		alert('ID체크를 해주시오');
		return;
	}
}

//직원전화번호를 통해서 직원전화번호 탐색기능을 구현하여 중복여부를 판단한다
function chkDupStaffPhone(){
	alert('핸드폰번호 중복 체크기능 실행');
	var prmId = $("#staff_phone").val();
	console.log(prmId);
	if($("#staff_phone").val() == '')
		{	alert('폰번호를 입력해 주세요!');
			return;
		}
	 $.ajax({
		type:'POST',
		data:"prmId="+$("#staff_phone").val(),
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		dataType:'text',
		url:'${pageContext.request.contextPath}/tori/staff/chkDupStaffPhone',
		success : function(data){
			alert("성공");
			var chkRst = data;
			if(chkRst=="Y"){
				alert("등록 가능 합니다");
				console.log(data);
				//$("#idcheck").val('Y');
			}else{
				alert("중복됩니다");
				console.log(data);
				//$("#idcheck").val('N');
			}
		},
		error : function(request,status,error){
			
			//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("실패");
		}
	});
}

//카드결제폼에 날짜형식을 빌려서 자바스크립트로 난수아이디를 생성한다
function addStaffId(){
	
	var staffId = "id"+getTimeStamp();
	
	function getTimeStamp() {
		  var d = new Date();

		  var s =
		    leadingZeros(d.getFullYear(), 2) +
		    leadingZeros(d.getMonth() + 1, 2) +
		    leadingZeros(d.getDate(), 2) +
		    leadingZeros(d.getSeconds(), 2);

		  return s;
		}



		function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();

		  if (n.length < digits) {
		    for (i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		  return zero + n;
		}
		
		document.getElementById('staff_id').value = staffId;
}

function phonecheck(){
	//휴대폰번호를 결제목록에 입력시에 일반적인 휴대폰번호 작성 및 표기법에 맞게 유효성검사 실시(시작)
	//var regExp = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
	var regExp = /\b\d{3}[-]?\d{4}[-]?\d{4}\b/;
	var StaffList = $("#staff_phone").val();
	alert(StaffList);

	if(StaffList != ''){
		if(!regExp.test(StaffList)){
			alert("올바른 형식의 번호를 입력하세요");
			$('#staff_phone').focus();
			return false;
		}	
		return false;
	}
	
}

</script>

</head>
<body>
</br></br></br></br></br>
<div class="container">
<!-- form action에도 입력폼 및 리스트로 가는 것을 작성하지 않고 다른 경로를 작성해본다. 그리고  컨트롤러, 리스트, 매퍼, DTO, DAO, 및 입력 폼의 name속성의 값들을 전부  DB내의 컬럼명으로 통일해서 작성한다-->
	<form id="staffForm" class="form-inline" action="${pageContext.request.contextPath}/tori/staff/staff_add_action" method="post">
	<table class="table table-stripped table-hover">
		<tr>
		<!-- 더블클릭으로 난수아이디를 생성할 수 있고, 혹은 직접 입력할 수도 있다 -->
		<td>스태프ID</td>
		<td><input class="form-control" size="auto" id="staff_id" name="staff_id" type="text" placeholder="스태프아이디를 입력해주세요(4자이상)" ondblclick="javascript:addStaffId();"></td>
		</tr>
		<tr>
		<td>비밀번호</td>
		<td><input class="form-control" size="auto" id="staff_pw" name="staff_pw" type="password" placeholder="비밀번호를 입력해주세요"></td>
		</tr>
		<tr>
		<td>성명</td>
		<td><input class="form-control" size="auto" id="staff_name" name="staff_name" type="text" placeholder="직원의 이름을 입력해 주세요"></td>
		</tr>
		<tr>
		<td>직급</td>
		<td><input class="form-control" size="auto" id="staff_level" name="staff_level" type="text" placeholder="직급을 입력해 주세요"></td>
		</tr>
		<tr>
		<td>나이</td>
		<td><input class="form-control" size="auto" id="staff_age" name="staff_age" type="text" placeholder="나이를 입력해 주세요"></td>
		</tr>
		<tr>
		<td>주소</td>
		<td><input class="form-control" size="auto" id="staff_addr" name="staff_addr" type="text" placeholder="주소를 입력해 주세요"></td>
		</tr>
		<tr>
		<td>이메일</td>
		<td><input class="form-control" size="auto" id="staff_email" name="staff_email" type="text" placeholder="이메일 주소를 입력해 주세요"></td>
		</tr>
		<tr>
		<td>성별</td>
		<td>
		<input class="form-control" size="auto" id="staff_gender" name="staff_gender" value="남" type="radio">남자
		<input class="form-control" size="auto" id="staff_gender" name="staff_gender" value="여" type="radio">여자
		</td>
		</tr>
		<tr>
		<td>핸드폰</td>
		<td><input class="form-control" size="auto" id="staff_phone" name="staff_phone" type="tel" placeholder="휴대폰번호를 입력해 주세요" ondblclick="javascript:phonecheck();"></td>
		</tr>
		<!-- <tr>
		<td>가입일자</td>
		<td><input class="form-control" size="auto" id="staff_date" name="staff_date" type="date" placeholder="가입일자를 입력해 주세요"></td>
		</tr> -->
	</table>
	<input class="btn btn-primary btn-sm" type="submit" id="staffAdd" name="staffAdd" value="가입완료">
	<input class="btn btn-primary btn-sm" type="reset" id="staffCancel" name="staffCancel" value="다시입력">
	<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/tori/staff/staff_list">직원목록</a>
	<input type="button" class="btn btn-primary btn-sm" id="checkStaffId" value="아이디중복확인" onclick="javascript:chkDupStaffId();"/>
	<input type="button" class="btn btn-primary btn-sm" id="checkStaffPhone" value="폰번호중복체크" onclick="javascript:chkDupStaffPhone();"/>
	</form>
	
</div>
</body>
</html>
