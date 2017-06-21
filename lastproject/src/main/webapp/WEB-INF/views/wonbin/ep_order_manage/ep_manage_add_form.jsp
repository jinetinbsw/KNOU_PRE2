<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>발주 업체 관리</title>
<%@ include file="../../modal/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
			//실행시키면 ep_id div 태그를 displat:none 시켜라
		$('#ep_id_div').css("display","none");
				//식재코드 삭제시 카운트 
		$(document).on('click','#chk_delete_hi',function(){
// 			alert($('input[name=food_id]').length);
// 			input 태그 중 name이 food_id인 갯수 가 2보다 작으면
			if($('input[name=food_id]').length < 2){
				alert('더 이상 삭제 할 수 없습니다.');
			}else{
				 $(this).parent().remove();
// 				var fo1 = $(this).val();
// 				alert(fo1);
// 				console.log(fo1);
// 				$('#chk_delete_hi').trigger('click') //trigger - 강제로 수행시키는
			 
// 				if($('#food_id').val())
			}
		});
// 		$(document).on('click','#chk_delete_hi',function(){
// 			var fo2 = $(this).val();
// 			alert(fo2);
// // 			console.log(fo2);
// 			var fo3 = $('#input_fo_id').contents().val();
// 			console.log(fo3);
// 		});
				
		//@@@@@@@@@@@@@@@@@@@@@@업체 select 값 정보 view 표시@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
		
		//업체면 셀렉트시 그 val()값
				//01_선택한 값 호출 확인
// 		var sel = $('#sel_ep_name option:selected').text();
// 		alert(sel);
				//02_선택 변경값 호출확인
	
		$('#sel_ep_name').change(function(){
			var chg_data = $(this).val()
				//03_다른 방법으로 선택 변경값 호출확인
// 			alert($(this).children('option:selected').text());
// 			alert(sel2);				
			if(chg_data == "선택"){
				//select 가 선택으로 되있으면 ep_id div 태그를 displat:none 시켜라
				$('#ep_id_div').css("display","none");
				// 				alert("선택이다");
				$('.sel_view').val(''); // sel_view 클래스명을 가진 value 값을 공백으로 // 선택시 업체코드 value ""; 로 만듬
				$('input[name=ep_name]').attr('readonly',false); // readonly를 false 로
				$('input[name=ep_phone]').attr('readonly',false);
				$('input[name=ep_director]').attr('readonly',false);
				$('input[name=ep_address]').attr('readonly',false);
				$('input[name=ep_text]').attr('readonly',false);
			}else{
				//select 가 다른 업체명으로 선택 되었으면 ep_id div 태그를 displat:block 시켜라
				$('#ep_id_div').css("display","block");
				// 				alert("선택이아니다")
				$('input[name=ep_name]').attr('readonly',true); // readonly를 true 로
				$('input[name=ep_phone]').attr('readonly',true);
				$('input[name=ep_director]').attr('readonly',true);
				$('input[name=ep_address]').attr('readonly',true);
				$('input[name=ep_text]').attr('readonly',true);
				//04_ajax로 비동기식 업체정보호출
				var sel_id = $("#sel_ep_name option:selected").val(); //셀렉트 된 val 값을 가져옴
				var sel_name = $("#sel_ep_name option:selected").text(); // 셀렉트 된 text 값을 가져옴
// 				alert(sel_id);
// 				var sel_name = $(this).find("option[value='"+$(this).val()+"']").text(); // 셀렉트된 자식요소 value에 해당하는 text를 가져옴
// 				alert(sel_name);
// 				alert(sel_name);
				$.ajax({
					type :"POST", // 전송 방식
					cache : true,	// 캐쉬 안적으면 true
					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					url : "${pageContext.request.contextPath}/ajax/sel_ep",
					data : "ep_id="+$("#sel_ep_name option:selected").val(),/* +"&ep_name="+$("#sel_ep_name option:selected").text() */
					dataType : "JSON",
					success : function(data){
// 						console.log(data);
						var ep_id = data.ep_id;
						var ep_name = data.ep_name;
						var ep_phone = data.ep_phone;
						var ep_address = data.ep_address;
						var ep_director = data.ep_director;
						var ep_text = data.ep_text;
						$('#ep_id').val(ep_id);
						$('#ep_name').val(ep_name);
						$('#ep_phone').val(ep_phone);
						$('#ep_address').val(ep_address);
						$('#ep_director').val(ep_director);
						$('#ep_text').val(ep_text);
					},
					error : function(xhr, status, error){
						alert("실패");	
					}
				})
			}
		}); // sel_change
		
		// 등록 버튼 클릭스 submit 
// 		$(document).on('click','#addsubmit',function(){
// // 			alert("등록버튼");
// 			var tmp = $('[name=chk_jung]').is(":checked"); //체크박스 선택여부 확인 하고 true / false 반환
// 			if(tmp){
// // 				alert("true면 출력");
// 				addform.submit(); // submit();
// 			}else{
// 				alert("식재 중복체크를 하십시오.")
// 			}
// 		});
	// 등록버튼 클릭시 유효성 / 정규화 검사
	$('#addsubmit').click(function(){
// 		alert('버튼클릭');
		var ep_name = $('#ep_name').val();
		var ep_phone = $('#ep_phone').val();
		var phone_num = /^\d{2,3}-\d{3,4}-\d{4}$/; // 정규식
		var ep_director = $('#ep_director').val();
		var ep_address = $('#ep_address').val();
		if(!ep_name){
			var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
		  		+'업체명을 입력해 주십시오.'
				+'</div>'
			$('#div_vaild').html(al);
			$('#ep_name').focus();
			return false;
		}else if(!ep_phone){
			var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
		  		+'연락처를 입력해 주십시오.'
				+'</div>'
			$('#div_vaild').html(al);
			$('#ep_phone').focus();
			return false;
		}else if(!phone_num.test($('#ep_phone').val())){
			var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
		  		+'잘못된 연락처입니다. - (하이픈)를 포함한 숫자만 입력해 주십시오.'
				+'</div>'
			$('#div_vaild').html(al);
			$('#ep_phone').focus();
			return false;
		}else if(!ep_director){
			var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
		  		+'담당자를 입력해 주십시오.'
				+'</div>'
			$('#div_vaild').html(al);
			$('#ep_director').focus();
			return false;
		}else if(!ep_address){
			var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
		  		+'업체 주소를 입력해 주십시오.'
				+'</div>'
			$('#div_vaild').html(al);
			$('#ep_address').focus();
			return false;
		}else{
			addform.submit();
		}
	}) // 등록버튼 end
	}); //jquery Ready

</script>
<style>
 .cen{ 	
    margin-top: 0px;
    margin-left: 0px;
    width: 155px;
    padding-top: 5px;
    padding-bottom: 5px;    
 }
</style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<div class="container">
<h3>발주 업체 관리</h3>

	<form class="form-horizontal col-sm-12" id="addform" action="${pageContext.request.contextPath}/ep_manage_add_form" method="post">
		
		<div id="ep_id_div">업체코드 :
			 <input class="sel_view" name="ep_id" id="ep_id" type="text" readonly="readonly"/>
		</div>
		
		<h4>식재료 품목</h4>
					
		<div id="input_fo_id">
			<c:forEach var="f" items="${list}">
			<div class="col-sm-2" id="input_fo_id">
				<input class="form-control" name ="food_id" id ="food_id" type ="text" value="${f.food_id}" readonly="readonly"/>
				<button class="cen btn btn-default" id="chk_delete_hi" type="button" value="${f.food_id}">취소</button>
			</div>
			</c:forEach>
		</div>
<!-- 		<button type="button" id="chk_delete">X</button> -->
		<br>			
		<div>
						<!-- 중복체크(나중에 써먹을수도) -->
<!-- 			<button type="button" id="chk_jungbok">식재 중복체크</button> -->
			
<!-- 			<div style="visibility: hidden"> -->
<!-- 			<!-- 중복체크 클릭시 이상이없으면 checked 시킴 --> 
<!-- 			<!-- hidden type은 checked 속성이 없다 -->
<!-- 			checked 는 radio, checkbox에만 있다 그러므로 div속에 숨겨야한다 -->  
<!-- 				<input type="checkbox" id="chk_jung" name="chk_jung"/> -->
			</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>	
	<div>
	
		<div class="form-group">
			<label class="control-label col-sm-2">업체명</label>
			<div class="col-xs-7"> <!-- col-xm-* : 고정폭 끔 -->
				<input  class="sel_view form-control" name ="ep_name" id ="ep_name" type ="text"/>
			</div>		
		<select name = "sel_ep_name" id = "sel_ep_name">
			<option>선택</option>
			<c:forEach var="sel" items="${sel_list}">
			<option value="${sel.ep_id}">${sel.ep_name}</option>
			</c:forEach>			
		</select>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">연락처</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="ep_phone" id ="ep_phone" type ="text" value="${ep_m.ep_phone}"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">업체 담당자</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="ep_director" id ="ep_director" type ="text"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">주소</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="ep_address" id ="ep_address" type ="text"/>
			</div>
		</div>		
		<div class="form-group">
			<label class="control-label col-sm-2">비고</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="ep_text" id ="ep_text" type ="text"/>
			</div>
		</div>		
	</div>
<br>
		<div class="form-group"> <!-- 유효성 검사 html -->
			<span class="col-sm-2"></span>
			<div class="col-xs-7">
				<div id="div_vaild"></div>
			</div>
		</div>
		<div class="form-group">
				<center>
				<input class="btn btn-primary" type="button" id="addsubmit" value="등록">
				<input class="btn btn-default" type="reset" id="reset" value="초기화">
				<a href="${pageContext.request.contextPath}/food_list"><button class="btn btn-default" type="button" id="censel">취소</button></a>
				</center>
		</div>
		<div class="alert alert-info alert-dismissable"  style="margin-top: 5px; margin-bottom: 5px; padding-bottom: 5px; padding-top: 5px;">
		  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>도움말 - </strong> 선택창을 통해서 기존 등록된 업체를 불러오실수 있습니다.
		</div>		
	</form>
	
</div>
</body>
</html>