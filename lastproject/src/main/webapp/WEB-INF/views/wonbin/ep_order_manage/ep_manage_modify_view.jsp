<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>수정 화면</title>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on('click','#all_del',function(){
			alert('정말 삭제 하시겠습니까?');
			var re = confirm('업체를 삭제하시면 관련 식재료를 다시 설정해주셔야합니다. 계속 진행하시겠습니까?');
			if(re){
// 				alert('true');
// 				var input = ${'#all_del'}.val();
				
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/ep_manage_delete",
					data : "ep_id="+$("#all_del").val(),
					success : function(data){
						alert('성공');
						fm_del.submit();
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
					}						
				});				
			}else{				
// 				alert("else");
			}
		});
		//유효성 검사
		$('#addsubmit').click(function(){
			var ep_phone = $('#ep_phone').val();
			var phone_num = /^\d{2,3}-\d{3,4}-\d{4}$/; // 정규식
			var ep_director = $('#ep_director').val();
			var ep_address = $('#ep_address').val();
			if(!ep_phone){
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
				var re = confirm('취소하신 식재료가 있다면 해당 식재료를 다시 설정해주셔야합니다. 수정을 계속 진행하시겠습니까?');
				if(re){
					addform.submit();
				}
			}
		}) // 유효성 검사 End
		// 식재료 취소 버튼
		$(document).on('click','#f_del_bt',function(){
			var food_id = $(this).val();
			var f_tr = $('.f_tr').length;			
// 			alert(f_tr+'식재료 갯수');
			if(f_tr > 1){			
// 			alert(food_id);
					$(this).parent().parent().remove();
					var food_hide = '<input id="food_id" name="food_id" type="hidden" value="'+food_id+'"/>';
					$('#div_hide').append(food_hide);				
			}else{ // tr갯수 확인 if문
				alert('식재료 1개 이하로 취소하실수 없습니다. 업체전체 삭제를 원하시면 하단의 전체삭제를 이용해주십시오.');
			}
		})
	});//jquery ready


</script>

<%@ include file="../../modal/header.jsp" %>
<style type="text/css">
.table th{
	text-align:center;
}
</style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>

<h3>업체코드 - ${ep_m.ep_id} 상세보기</h3>
<br>
<div class="container">
<form id="addform" action="${pageContext.request.contextPath}/ep_manage_modify" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2">업체 번호</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="ep_id" id ="ep_id" type ="text" value="${ep_m.ep_id}" readonly="readonly"/>
			</div>
		</div>
		<br>
		<br>
		<div>
			<label class="control-label col-sm-2">발주 품목</label>
			<table class="table table-hover" style="text-align:center">
				<thead>
				<tr>
					<th>식재료 코드번호</th>
					<th>상품명</th>
					<th>삭제</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach var="f" items="${ep_m_fv}">
					<tr class="f_tr">						
						<td>${f.food_id}</td>
						<td>${f.food_name}</td>
						<td><button type="button" id="f_del_bt" value="${f.food_id}">삭제</button></td>
<%-- 						<td><a class="snagse" href="${pageContext.request.contextPath}/f_del_bt?food_id=${f.food_id}&ep_id=${ep_m.ep_id}"><input type="button" id="f_del_bt" value="취소"/></a></td> --%>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br>		
	
		<div class="form-group">
			<label class="control-label col-sm-2">업체명</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="ep_name" id ="ep_name" type ="text" value="${ep_m.ep_name}" readonly="readonly"/>
			</div>
		</div>
		<br>
		<br>
		<div class="form-group">
			<label class="control-label col-sm-2">연락처</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="ep_phone" id ="ep_phone" type ="text" value="${ep_m.ep_phone}"/>
			</div>
		</div>
		<br>
		<br>
		<div class="form-group">
			<label class="control-label col-sm-2">업체 담당자</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="ep_director" id ="ep_director" type ="text" value="${ep_m.ep_director}"/>
			</div>
		</div>
		<br>
		<br>
		<div class="form-group">
			<label class="control-label col-sm-2">주소</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="ep_address" id ="ep_address" type ="text" value="${ep_m.ep_address}"/>
			</div>
		</div>
		<br>
		<br>
		<div class="form-group">
			<label class="control-label col-sm-2">비고</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="ep_text" id ="ep_text" type ="text" value="${ep_m.ep_text}"/>
			</div>
		</div>
		<div id="div_hide">
			<!-- append hide 추가 -->			
		</div>
		<br>
		<br>
		<div class="form-group"> <!-- 유효성 검사 html -->
			<span class="col-sm-2"></span>
			<div class="col-xs-7">
				<div id="div_vaild"></div>
			</div>
		</div>		
		<div class="form-group col-sm-10">
				<center>
				<input class="btn btn-primary" type="button" id="addsubmit" value="수정">
				<a href="${pageContext.request.contextPath}/ep_manage_list"><button class="btn btn-default" type="button" id="censel">취소</button></a>
				</center>
		</div>		
	</form>
	<form id="fm_del" action="${pageContext.request.contextPath}/ep_manage_list"method="GET">
		<button class="btn btn-danger" id="all_del" type="button" name="ep_id" value="${ep_m.ep_id}">전체 삭제</button>
	</form>
	</div>
	


</body>
</html>