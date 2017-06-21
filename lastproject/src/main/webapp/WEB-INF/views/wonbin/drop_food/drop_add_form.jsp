<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>폐기식자재 품목관리</title>

<script type="text/javascript">

	window.onload = function(){	
	var food_id = opener.document.getElementById('drop_bt_f_id').value;
// 	alert(food_id);
	var ep_order_id = opener.document.getElementById('drop_bt_o_id').value;
	document.getElementById('food_id').value = food_id;
	document.getElementById('ep_order_id').value = ep_order_id;
	};
		
$(document).ready(function(){
	
		var ep_order_wh_ea;
		var food_id =$('#food_id').val()
// 		alert(food_id);
		var ep_order_id =$('#ep_order_id').val()
// 		alert(ep_order_wh_date);
		$.ajax({
			type: "get",
			url : "${pageContext.request.contextPath}/ajax/aj_drop_form",
			data : "food_id="+food_id+"&ep_order_id="+ep_order_id,
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			dataType : "JSON", //string 으로 리턴하기 때문에 
			success : function(data){
// 				alert('성공');
// 				console.log(data);				
				$('#food_name').val(data.food_name);
				$('#food_nowquantity').val(data.food_nowquantity);
				$('#drop_ea').attr('placeholder','남은 수량 :'+data.food_nowquantity); // placeholder에 받아온 수량 표시
							
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
			}			
		})//ajax End
		var ep_ea = $('#ep_order_wh_ea').val();
		
		
	$(document).on('click','#addsubmit', function(){
// 		alert('click');
		var num = /^[0-9]*$/;
		var food_nowquantity = $('#food_nowquantity').val();
		var drop_ea = $('#drop_ea').val();
		var _drop_ea = parseInt(drop_ea);
		var _food_nowquantity = parseInt(food_nowquantity);
// 		alert(ep_order_wh_ea);
		//유효성 /정규식
		var drop_reason = $('#drop_reason').val();
		if(!drop_reason){
			var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
		  		+'폐기사유를 입력해 주십시오.'
				+'</div>'
				$('#div_vaild').html(al);
				$('#drop_reason').focus();
				  return false;
		}else if(!drop_ea){
			var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
		  		+'폐기수량을 입력해 주십시오.'
				+'</div>'
				$('#div_vaild').html(al);
				$('#drop_ea').focus();
				  return false;
		}else if(!num.test(drop_ea)){
			var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
		  		+'폐기수량은 숫자만 입력 하실수 있습니다.'
				+'</div>'
				$('#div_vaild').html(al);
				$('#drop_ea').focus();
				  return false;
		}else if(_drop_ea <= _food_nowquantity){
			var re = confirm('폐기등록을 계속 진행하시겠습니까?');
			if(re){
// 			alert('보낼수있음');
// 			addform.submit();
// 			self.close(); // 오류 : submit 처리 되기도 전에 창을 닫아버리는 문제가 있다 / ajax로 보내보자.
			var addform = $('#addform').serialize(); // Form 태그내의 항목들을 자동으로 읽어와 queryString 형식으로 변환시켜 준다
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/ajax/aj_drop_add",
				data : addform,
				success : function(data){
					alert('폐기 등록 되었습니다.');
					var cnt = 1;
					if(cnt == 1) {
					   opener.location.reload(); // 부모창을 한번 새로고침 시켜준다.
					   cnt = 0;
					}
					self.close(); // insert 로직실행후 창을 닫는다
					
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
				}
				
			}) //ajax End
			}
		}else if(_drop_ea){
				alert('남은 수량을 초과했습니다.');				
		}else{
			alert('폐기수량을 입력해주십시오.');
		}
		
	})
	//취소 버튼
	$('#censel').click(function(){
		self.close();
	});
	
	
	}) //ready End

</script>
<style type="text/css">

</style>
</head>
<body>
<br>
<br>
	<div class="container">
	<h2 class="col-sm-3">폐기등록</h2>
	
	<br>	
	<br>
<%-- 	<form id="addform" action="${pageContext.request.contextPath}/drop_add_form" method="post"> --%>
		<form class="form-horizontal col-sm-12" id="addform">
			<div class="form-group">
				<label class="control-label col-sm-2">발주 코드</label>
				<div class="col-xs-7">
					<input  class="form-control" name ="ep_order_id" id ="ep_order_id" type ="text" readonly="readonly"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">식재 코드</label>
				<div class="col-xs-7">
					<input  class="form-control" name ="food_id" id ="food_id" type ="text" readonly="readonly"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">상품명</label>
				<div class="col-xs-7">
					<input  class="form-control" name ="food_name" id ="food_name" type ="text" readonly="readonly"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">폐기 사유</label>
				<div class="col-xs-7">
					<textarea  class="form-control" rows="5" name ="drop_reason" id ="drop_reason"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">폐기 수량</label>
				<div class="col-xs-7">
					<input  class="form-control" name ="drop_ea" id ="drop_ea" type ="text" placeholder=""/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">담당자</label>
				<div class="col-xs-7">
					<input  class="form-control" name ="staff_id" id ="staff_id" type ="text" value="${sessionScope.admin.admin_id}"readonly="readonly"/>
				</div>
			</div>
				<div class="form-group">
					<span class="col-sm-2"></span>
					<div class="col-xs-7">
						<div id="div_vaild"></div>
				</div>
			<br>
			<br>
			<div class="form-group col-sm-10">
				<center>
				<input class="btn btn-default" type="button" id="addsubmit" value="폐기등록">
				<button class="btn" type="button" id="censel">취소</button>
				</center>
			</div>
			<input type="hidden" name="food_nowquantity" id="food_nowquantity"/>
			
		</div>
		</form>
		
		
	</div>

</body>
</html>