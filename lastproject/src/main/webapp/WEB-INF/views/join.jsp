<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<title>POS SYSTEM</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function(){
			$('#Paris').hide();
			$('#btn').click(function(){
				 var regExp = /\s/g;//ê³µë°±ì´ ìë íì¸íë ì ê·ì
				 var id = $('#usercode').val();
				 var pw = $('#password').val();
			if($('#usercode').val()==""||id.match(regExp)) {
				$('#idre').html("<font color=red>Check the spaces in the box.</font>");
				$('#idre').show();
				$('#usercode').focus();
			}
			else if($('#password').val()==""||pw.match(regExp)) {
				$('#idre').hide();
				$('#pwre').html("<font color=red>Check the space in the Password box.</font>");
				$('#pwre').show();	
				$('#password').focus();
			}
			else{
				frm.submit();
			}
			
			
			});
			
			$('#btn2').click(function(){
				 var regExp = /\s/g;//ê³µë°±ì´ ìë íì¸íë ì ê·ì
				 var id = $('#usercode2').val();
				 var pw = $('#password2').val();
			if($('#usercode2').val()==""||id.match(regExp)) {
				$('#idre2').html("<font color=red>Check the spaces in the box.</font>");
				$('#idre2').show();
				$('#usercode2').focus();
			}
			else if($('#password2').val()==""||pw.match(regExp)) {
				$('#idre2').hide();
				$('#pwre2').html("<font color=red>Check the space in the Password box.</font>");
				$('#pwre2').show();	
				$('#password2').focus();
			}
			else{
				frm2.submit();
			}
			
			
			});
		});
	
		/* 팝업창이나 띄우자 */
		/* 
		function open_win(){
			window.open('popup.html','popup','width=300,height=200,left=0,top=0,toolbar=no,locaton=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no');
			
		} */
		/* 탭 만들기 */
		
			function openCity(evt, cityName) {
			    var i, tabcontent, tablinks;
			    tabcontent = document.getElementsByClassName("tabcontent");
			    for (i = 0; i < tabcontent.length; i++) {
			        tabcontent[i].style.display = "none";
			    }
			    tablinks = document.getElementsByClassName("tablinks");
			    for (i = 0; i < tablinks.length; i++) {
			        tablinks[i].className = tablinks[i].className.replace(" active", "");
			    }
			    document.getElementById(cityName).style.display = "block";
			    evt.currentTarget.className += " active";
			}
	</script>	

</head>

<body onLoad="javascript:open_win();">



	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">POS SYSTEM</span></h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>LogIn</h2>
				<div class="tab">
				  <button class="tablinks" onclick="openCity(event, 'London')">관리자</button>
				  <!-- <button class="tablinks" onclick="openCity(event, 'Paris')">매니저</button> -->
				</div>
			</div>
			
			<form action="${pageContext.request.contextPath}/loginAction" name="frm" method="POST">
				<div id="London" class="tabcontent">
					<label for="usercode">Usercode</label>
					<br/>
					<input type="text" id="usercode" name="usercode" value="id001">
					<div id="idre" style="display:none;"></div> 
					<br/>
					<label for="password">Password</label>
					<br/>
					<input type="password" id="password" name="password" value="pw001">
					<div id="pwre" style="display:none;"></div>
					<br/>
					
					<button type="button" id="btn">login</button>
					<br/>
					<%-- <a href="${pageContext.request.contextPath}/repw"><p class="small">비밀번호 찾기(click)</p></a> --%>
				</div>
				</form>
			<!-- 직원 탭 내용 -->
<%-- 			<form action="${pageContext.request.contextPath}/loginAction" name="frm2" method="POST">
				<div id="Paris" class="tabcontent">
					<label for="usercode2">Usercode</label>
					<br/>
					<input type="text" id="usercode2" name="usercode" value="id002">
					<div id="idre2" style="display:none;"></div> 
					<br/>
					<label for="password">Password</label>
					<br/>
					<input type="password" id="password2" name="password" value="pw002">
					<div id="pwre2" style="display:none;"></div>
					<br/>
					
					<button type="button" id="btn2">login</button>
					<br/>
					<a href="${pageContext.request.contextPath}/repw"><p class="small">비밀번호 찾기(click)</p></a>
				</div>
			</form> --%>
		</div>
	</div>

</body>

<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#usercode').focus(function() {
		$('label[for="usercode"]').addClass('selected');
	});
	$('#usercode').blur(function() {
		$('label[for="usercode"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>

</html>