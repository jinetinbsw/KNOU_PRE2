<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
   a, a:hover, a:visited{color:black; text-decoration:none;}
 
   #pop{
    width:300px; height:100px; background:#3d3d3d; color:#fff; 
    position:absolute; top:0px; left:500px; text-align:center; 
    border:2px solid #000; 
    margin-top:200px;
   }
 
   #pop_bt{
    border:1px solid #000;
    width:100px; margin:auto;
    margin-top:30px;
   cursor: pointer;
    font-weight:bold;
    text-align:center;
    padding:5px;
   }
 
   #close{
    width:100px; margin:auto; cursor:pointer; font-weight:bold;
   }
   #rephone{

   }
   .bt{
   color:black;
   }
   .text{
   color:black;
   style="text-align:center; 
   width:5px; 
   height:20px; 
   letter-spacing: -5px"
   
   }
 </style>
 
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
   
<script>
$(document).ready(function(){
	$('#Dbtn').click(function(){
		
	var reCheck = confirm('탈퇴 처리 하시겠습니까?');
		
	if(reCheck){
		//yes 부분
	    $('#pop').show();
			 $('#close').click(function() {
			    $('#pop').hide();
			    });
				$('#ok').click(function(){
		
					var regExp = /\s/g;
					var phone = $('#rephone').val();
					var phone1 = $('#rephone1').val();
					var phone2 = $('#rephone2').val();
					if($('#rephone').val()==""||phone.match(regExp)){
						alert('첫 번째 박스 공백을 확인하세요'); 
						/* frm.submit(); */	
					}else if($('#rephone1').val()==""||phone.match(regExp)){
						alert('두번째 박스 공백을 확인하세요'); 
						
					}else if($('#rephone2').val()==""||phone.match(regExp)){
						alert('마지막 박스 공백을 확인하세요'); 
					}else{
						
						var allphone =phone+"-"+phone1+"-"+phone2;
						
						if(allphone == $('#member_phone').val()){
							alert('탈퇴 처리 완료');
							frm.submit();
						}else{
							alert('다시 입력해 주세요')
						}
					}
				});
		}else{
			//no 부분
		}
	
	/* alert('탈퇴 승인 처리 되었습니다.'); */
		/* frm.submit(); */
	});
});
</script>
<title>회원 탈퇴 Page</title>

</head>
<body>
<%@ include file="../modal/header.jsp" %>
<br/>
<br/>
<br/>
<br/>
<div class="container">
<h1>회원 탈퇴 화면</h1>
 
      <form id="frm" action="${pageContext.request.contextPath}/member_SecedeAction" method="post">
        <div class="form-group">전화번호 :
            <input class="form-control" name="member_phone" id ="member_phone" value="${Member.member_phone}" type="text" readonly="readonly"/>
        </div>
        <div id="phone_re" style="display:none;"></div> 
        <div class="form-group">
            <label for="boardPw">이름 :</label>
            <input class="form-control" name="member_name" id="member_name" value="${Member.member_name}" type="text" readonly="readonly"/>
        </div>
        <div id="name_re" style="display:none;"></div>     
        <div class="form-group">
            <label for="member_point">마일리지 :</label>
            <input class="form-control" name="member_point" id="member_point" value="${Member.member_point}" type="text" readonly="readonly"/>
        </div>
        <div id="point_re" style="display:none;"></div> 
        <div class="form-group">가입일자 :
            <input class="form-control" name="member_sign" id="member_sign" value="${Member.member_sign}" type="text"  readonly="readonly"/>
        </div>
          <div class="form-group">
            <label for="member_join">최근방문일자 :</label>
            <input class="form-control" name="member_join" id="member_join" value="${Member.member_join}" type="text"  readonly="readonly"/>
        </div>
        <input class="btn btn-default" type="button" id="Dbtn" value="탈퇴">
        <a class="btn btn-default" href="${pageContext.request.contextPath}/member_list">글목록</a>
    </form>
    
</div>
<!-- <div id="pop_bt">
   팝업띄우기
  </div> -->
 </br></br></br></br>
  <div id="pop" style="display:none;">
    <div style="height:370px;">
      	전화번호를 입력해 주세요
     <center><input class="text" id="rephone" type="text" size="3"> - <input class="text" id="rephone1" type="text"  size="3"> - <input class="text" id="rephone2" type="text"  size="3"></center>
    </br>
    <center><b><button class="bt" id="ok">submit</button>	</b><button class="bt" id="close" style="width:50px;">close</button></center>
    </div>
    
  </div>
</body>
</html>
