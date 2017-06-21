<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html max-width:auto;>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>


 <style>
::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; display:none;}
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url(`./images/bg.png`) #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}
          
          

	        .adelet:link{color:#000000;}
		    .adelet:hover{color:#ffff00;}
		  /*   .adelet:active{color:#00ff00;} */
		    .adelet:visited{color:#000000;}   
		
		.table4_1 table {
	width:100%;
	margin:15px 0;
	border:0;
}
.table4_1 th {
	background-color:#F56E6E;
	color:#FFFFFF
}
.table4_1,.table4_1 th,.table4_1 td {
	font-size:0.95em;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table4_1 th,.table4_1 td {
	border: 1px solid #f9acac;
	border-width:1px 0 1px 0
}
.table4_1 tr {
	border: 1px solid #f9acac;
}
.table4_1 tr:nth-child(odd){
	background-color:#fbcece;
}
.table4_1 tr:nth-child(even){
	background-color:#fdfdfd;
}		
	        
        </style>
 
 
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
    <%@ include file="../modal/header.jsp" %>
   
   <style>
input{
border:0px;
background-color: transparent;
}

body{
  text-align:left;

}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
.bu{
  background:#FF7171;
  color:#fff;
  border:none;
  position:relative;
  height:auto;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
  border-radius: 10px;
  width:auto;
}
.bu:hover{
  background:#fff;
  color:#ED9595;
}
.bu:before,.bu:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #FFFFB0;
  transition:400ms ease all;
}
.bu:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.bu:hover:before,.bu:hover:after{
  width:100%;
  transition:800ms ease all;
}
 .bu1{
 	background:#fff;
  color:#ED9595;
 } 
 .bu1:hover{
  background:#FFD9FA;
  color:#fff;
 } 
   
tr{
font-size: 15px;
}  
   </style>
</head>
<body>

<div class="container">
	<br/>
	<br/>
	<br/>
	<br/>
    <h1>MEMBER LIST</h1>
	 <br/>
    <div class="member">전체회원 수 : ${memberCount}</div>
    <br/>
  
	    <!-- 회원 상세정보 들어가는 div -->
	    <div id="member_view" style="display:none">
	   		<div id="member_name">
	   		
	   		</div>
	   	</br>
	   	<input type="button" id="member_list_btn" class ="bu" value="목록">
	   	<input type="hidden" id="hidden_receipt_list" class="bu" value="">
	   	<input type="button" id="receipt_list" class="bu" value="이용내역">
	    <input type="button" id="member_list_up_btn" class ="bu" value="회원정보 수정">
	   	<input type="button" id="member_update_btn" class ="bu" value="수정완료">
	   	</div>
	    
	    <!-- 회원 정보 수정 입력폼 -->
	    <div id="member_update_view" style="display:none; position:fixed; right: 400px;">
	   	<input type="button" id="member_update_btn" class ="bu" value="수정완료">
	   	</div>
    	<!-- 회원 이용내역 나오는 폼 -->
    	<div id="hidden_receipt" style="overflow:scroll; width:100%; height:200px;">
    		<table class="table4_1">    		
				

				
				    		
    		<tbody id="member_receipt_list">
    			<tr>
                <td>결제번호</td>
                <td>총 결제 금액</td>
                <td>결제 금액</td>
                <td>적립 마일리지</td>
                <td>사용 마일리지</td>
                <td>결제 날짜</td>
                <td>결제 방법</td>
                <td>결제 처리 상태</td>
                <td>메 뉴 명</td>
                <td>주문 개수</td>
                <td>단품 가격</td>
            	</tr>
    			<h3 id="ptag">검색 결과가 없습니다.</h3>
    		</tbody>
    		</table>
    	</div>
    
    <table class="table table-striped table4_1" id="member_list" >
        <thead>
            <tr>
                <th>member_phone</th>
                <th>member_name</th>
                <th>member_point</th>
                <th>member_sign</th>
                <th>member_join</th>
                <th>회원정보 상세보기</th>
                <th>회원정보 삭제</th>
            </tr>
        </thead>
        <tbody id="retd">
        
          <c:forEach var="m" items="${list}">
                <tr class="retd">
                 <td><a href="${pageContext.request.contextPath}/member_information_view?member_phone=${m.member_phone}">${m.member_phone}</a></td>
                    <td>${m.member_name}</td>
                    <td>${m.member_point}</td>
                    <td>${m.member_sign}</td>
                    <td>${m.member_join}</td>
                    <td><button class="list_up_btn bu btn-5" value="${m.member_phone}">상세보기</button></td>
                     
                    <td>
                   
                    <a class="adelet" href="${pageContext.request.contextPath}/member_Secede?member_phone=${m.member_phone}"> 삭  제</a>
                   
                	</td>
                </tr>
           </c:forEach> 
        </tbody>
        
    </table>
    <ul class="pager" id="ml_pager">
       
      
      	<c:forEach var="i" begin="${expage}" end="${lastpage}" step="1">
             <c:choose>
                <c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/member_list?currentPage=${i}"><button class ="bu1">${i}</button></a></li></c:when>
                <c:otherwise><li><a href="${pageContext.request.contextPath}/member_list?currentPage=${i}" ><button class ="bu1">${i}</button></a></li></c:otherwise>
            </c:choose>

        </c:forEach>
        
        <c:if test="${currentPage > 4}">
            <li class="next"><a href="${pageContext.request.contextPath}/member_list?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    
	
<!-- 오토 컴플리트 사용하기 위한 라이브러리 (삭제금지) -->
<link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet"></link>
<script src='https://cdn.rawgit.com/pguso/jquery-plugin-circliful/master/js/jquery.circliful.min.js'></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
<script type="text/javascript"> 
$(document).ready(function(){
	
		  //컨트롤러에서 json방식으로 넣은 회원 정보를 model에 담아서 보내줌
		  //jsonString 변수에 담아줌
			var jsonString = '${jsonString}';
		 	var memberList = eval("("+jsonString+")"); 
		/*  alert(jsonString); */
		  	/* console.log(jsonString); */
			
			//전역변수로 배열 선언
			var member_phone = new Array();
		  	var member_name = new Array();
		  	var member_sign = new Array();
		  	var member_join = new Array();
		  	var member_point = new Array();
		  	
		  	
		  					
		  	console.log(member_point);
		  //반복문으로 배열의 길이만큼 돌려서 값을 꺼내서 
		  //위에서 선언한 전역변수에 담아준다.
		  for(var i=0; i < memberList.length; i++){
				var memberObject = memberList[i];
			
				member_point.push(memberObject.member_point);
				member_phone.push(memberObject.member_phone);
				member_name.push(memberObject.member_name);
				member_sign.push(memberObject.member_sign);
				member_join.push(memberObject.member_join);
		  		
		  		//콘솔로 값 출력 확인
				
		  		/* console.log(member_phone+"<<<<member_phone")
				console.log(member_name+"<<<<member_name")				
				console.log(member_sign+"<<<<member_sign")
				console.log(member_join+"<<<<member_join") */
		  }
		 
		  
		
					
		
					$('#selBox').change(function(){
						var selbox = $('#selBox').val();
						
						
						if(selbox == 'member_phone'){
				    	$('#search2').autocomplete({
					      source: member_phone
				    	});
					
						}else if(selbox == 'member_name'){
							$( "#search2" ).autocomplete({
							 source: member_name
						    });	
						}else if(selbox == 'member_sign'){
							$( "#search2" ).autocomplete({
								 source: member_sign
							    });	
						}else if(selbox == 'member_join'){
							$( "#search2" ).autocomplete({
								 source: member_join
							    });	
						}else if(selbox ==0){
						alert('선택하세요');
					
						}
					});//for문 끝
					
			 
	
			
			});
</script> 
 <script type="text/javascript">
$(document).ready(function(){
	$('#hidden_receipt').hide();
		$('#ml_button').click(function(){
			/* alert('test'); */
			var va = $("#selBox option:selected").val();
			 var regExp = /\s/g;
			var search2 =$('#search2').val();
			
			if(search2 != null && search2 != "" && search2 != regExp){
				 /* alert(search); */
				frm.submit();	
			}else{
				 alert('내용을 입력 하세요');
			}
		}); 				

		
		//상세정보 버튼 클릭할 경우 작동
		$('.list_up_btn').click(function(){
			/* var member_join;
			var member_name;
			var member_phone;
			var member_point;
			var member_sign; */
			$('#receipt_list').show(1500);
			$('#hidden_receipt').hide(1500);
			$('#member_list_up_btn').show(1500);
			$('#member_list').hide(1500);
			$('#ml_pager').hide(1500);
			$('#frm').hide(1500);
			//클릭한 자기의 밸류값을 up_btn에 담아준다.

			var up_btn = $(this).val();
			//히든타입인 input에 회원 전화번호를 밸류값으로 담아준다
			$('#hidden_receipt_list').val(up_btn);
			
			
			/* alert(up_btn); */
			//ajax통신으로 보낼 데이터 변수에 담아줌. ""<-에 들어간 건 받을때 사용할 이름
			//뒤에는 값.
			var member_phone = {"member_phone":up_btn}
			
			
			$.ajax({
			type:'GET',
			url: "${pageContext.request.contextPath}/ajax_member_update",
			dataType: "JSON",
		    data : member_phone,
		    
			success:function(data){
				/* alert('통신성공'); */
				/* console.log(data); */
				var member_join = data[0].member_join
				var member_name = data[0].member_name
				var member_phone = data[0].member_phone
				var member_point = data[0].member_point
				var member_sign = data[0].member_sign
				
				console.log(member_join+"<<<");
				console.log(member_name+"<<<");
				console.log(member_phone+"<<<");
				console.log(member_point+"<<<");
				console.log(member_sign+"<<<");
				//회원 상세정보
				$('#member_name').html("<br><div style='border-bottom:2px solid red; width:200px;'><p><b>회원 가입 날짜</b> : "+" "+member_join+"</p></div>"
										+"</br><div style='border-bottom:2px solid red; width:200px;'><p><b>회원 이름</b> : "+" "+member_name+"</p></div>"
										+"</br><div style='border-bottom:2px solid red; width:200px;'><p><b>회원 연락처</b>: "+" "+member_phone+"</p></div>"
										+"</br><div style='border-bottom:2px solid red; width:200px;'><p><b>보유 마일리지</b>: "+" "+member_point+"</p></div>"
										+"</br><div style='border-bottom:2px solid red; width:200px;'><p><b>최근 방문일자</b>: "+" "+member_sign+"</p></div>");
				
				
				//회원 정보 화면이 나타난다.
				$('#member_view').show(1800);
				$('#member_update_btn').hide();
				
				$('#member_update_view').html("<div class='form-style-8'><p><b>회원 가입 날짜</b> : "+" "+'<input type="text" id="member_update_member_join" style="cursor:not-allowed;" readonly value="'+member_join+'">'+"</p>"
											+"<p><b>회원 이름</b> : "+" "+'<input type="text" id="member_update_member_name"  value="'+member_name+'">'+"</p>"
											+'<input type="hidden" id="member_update_p_member_phone" value="'+member_phone+'">'
											+"<p><b>회원 연락처</b> : "+" "+'<input type="text" id="member_update_member_phone" value="'+member_phone+'">'+"</p>"
											+"<p><b>보유 마일리지</b> : "+" "+'<input type="text" id="member_update_member_point" style="cursor:not-allowed" readonly value="'+member_point+'">'+"</p>"
											+"<p><b>최근 방문일자</b> : "+" "+'<input type="text" id="member_update_member_sign" style="cursor:not-allowed" readonly  value="'+member_sign+'">'+"</p></div>"
											)
			
											
				//목록 버튼을 클릭할때 회원 정보 화면이 사라지고 회원 목록이 나타난다.							
				$('#member_list_btn').click(function(){
														$('#member_update_view').hide(1500);
														$('#member_view').hide(1500);
														$('#member_list').show(1800);
														$('#ml_pager').show(1800);
														$('#frm').show(1800);
													  	$('#hidden_receipt').hide(1300);
													  	$('.receipt_tr').remove();
														});
					
			
				//회원정보 수정 버튼을 클릭했을때 실행된다.
				$('#member_list_up_btn').click(function(){
					//회원 정보 수정 화면 출력
					$('#member_update_view').show(1500);
					//회원정보 수정 완료 버튼
					$('#member_update_btn').show(1800);
					//회원정보 수정 버튼
					$('#member_list_up_btn').hide(1500);
					//이용내역 조회 숨김
					$('#hidden_receipt').hide(1300);
					//이용내역 버튼 나타남
					$('#receipt_list').show(1500);
				
				});
						
			}//ajax success
		
		});//ajax 끝
		
		
		
		});
}); 

 </script>
<script>
$('#member_update_btn').click(function(){
	/* alert('test'); */
	//회원정보 수정 처리 ajax
	var member_update_member_join = $('#member_update_member_join').val();
	var member_update_member_name = $('#member_update_member_name').val();
	var member_update_member_phone = $('#member_update_member_phone').val();
	var member_update_member_point = $('#member_update_member_point').val();
	var member_update_member_sign = $('#member_update_member_sign').val();
	var member_update_p_member_phone = $('#member_update_p_member_phone').val();
	
	
	var member_update = {"member_join":member_update_member_join
						,"member_name":member_update_member_name
						,"member_phone":member_update_member_phone
						,"member_point":member_update_member_point
						,"member_sign":member_update_member_sign
						,"p_member_phone":member_update_p_member_phone}

	console.log(member_update)
	$.ajax({
		type:'POST',
		url: "${pageContext.request.contextPath}/ajax_member_update_action",
		dataType: "JSON",
	    data : member_update,
	    success:function(data){
	    	/* alert('입력 성공'); */
	    	
	    	
	    
	    }
	});//회원정보 수정처리 ajax끝
	

	
		 location.reload(); 
});

</script>
<script>
//이용 내역 버튼 클릭시 작동
$('#receipt_list').click(function(){
	
	$('#hidden_receipt').show(1300);
	$('#member_update_view').hide(1300);
	//회원정보 수정 완료 버튼
	$('#member_update_btn').hide(1800);
	//회원정보 수정 버튼
	$('#member_list_up_btn').show(1500);
	//이용내역 버튼 사라짐
	$('#receipt_list').hide(1200);
	
	var hidden_val = $('#hidden_receipt_list').val();
	var hidden_phone = {"member_phone":hidden_val}
	
	
	
	
	$.ajax({
		type:'GET',
		url: "${pageContext.request.contextPath}/ajax_receipt_list",
		dataType: "JSON",
	    data : hidden_phone,
	    success:function(data){
	    	
	    	
	    	if(data!=""){
	    		$('#ptag').hide();
	    	
	     	$.each(data,function(){
	    		
	    	
	    		
			    	$('#member_receipt_list').append("<tr class='receipt_tr'><td>"+this.payment_id+"</td>"
			    									+"<td>"+this.payment_total+"</td>"
											    	+"<td>"+this.payment_pay+"</td>"
											    	+"<td>"+this.payment_addmileage+"</td>"
											    	+"<td>"+this.payment_usemileage+"</td>"
											    	+"<td>"+this.payment_date+"</td>"
											    	+"<td>"+this.payment_cate+"</td>"
											    	+"<td>"+this.payment_state+"</td>"
											    	+"<td>"+this.menu_name+"</td>"
											    	+"<td>"+this.order_detail_ea+"</td>"
											    	+"<td>"+this.order_detail_sum+"</td></tr>");
			    	
			    		
			    	});//each
			    	
	    		}else{
	    				
	    			$('#ptag').show();
	    		}//if
	    	
	    	}//success
	
	 }); //ajax
});
</script>
    <div>
 <form class="form-style-8" id="frm" name="frm" action="${pageContext.request.contextPath}/member_select" method="get">
    	<select  id="selBox" name="selBox">
    	<option  value="0">-- 선택하세요--</option>
        <option  value="member_phone">핸드폰번호</option>
        <option  value="member_name">이름</option>
        <option  value="member_sign">가입일자</option>
        <option  value="member_join">최근방문일자</option>
        </select>
      	<input type="text" name="search2" id="search2" >
        <input type="button" name="ml_button" id="ml_button" class ="bu" value="검색">
     </form>
    </div>
<style>
.form-style-8 input[type="text"]
{
   box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    outline: none;
    display: block;
    width: auto%;
    padding: 7px;
    border: none;
    border-bottom: 1px solid #ddd;
    background: transparent;
    margin-bottom: 10px;
    font: 16px Arial, Helvetica, sans-serif;
    height: 45px; 
}

</style>    
   	
</div>
</body>
</html>
