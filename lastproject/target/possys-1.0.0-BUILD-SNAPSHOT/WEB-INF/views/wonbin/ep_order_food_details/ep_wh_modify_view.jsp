<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>입고 수정화면</title>
<%-- <%@ include file="../../modal/header.jsp" %> --%>
<script type="text/javascript">
		window.onload = function(){	
		var ep_order_id = opener.document.getElementById('wh_mody').value;
// 		alert(ep_order_id+'asd');
		document.getElementById('_ep_order_id').value = ep_order_id;		
		}
	$(document).ready(function(){
		var ep_order_id = $('#_ep_order_id').val()
		$('#ep_order_id').html("발주코드 : "+ep_order_id);
		//입고id로 리스트 가져오기
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/ajax/ep_wh_add_form",
			data : "ep_order_id="+ep_order_id,
			dataType : "JSON",
			success : function(data){
				
				$.each(data,function(){
// 					console.log(this.ep_id+"<<<<<");
					ep_order_id = this.ep_order_id;
// 					console.log(ep_order_id+'<<<< ep_order_id');
					$('#ep_order_id').html("발주코드 : "+ep_order_id);
					$('#wh_cancel').val(ep_order_id); // 입고취소 버튼 val() 입고 코드 번호 입력
					ep_id = this.ep_id;
					ep_name = this.ep_name;
					food_id = this.food_id;
					food_name = this.food_name;
					ep_order_wh_ea = this.ep_order_wh_ea;
					_ep_order_food_shelflife = this.ep_order_food_shelflife;
// 					alert(_ep_order_food_shelflife);
					_ep_order_unit_price = this.ep_order_unit_price;
					_ep_order_total_price = this.ep_order_total_price;
// 					alert(_ep_order_unit_price);
// 					console.log(ep_id+ep_name+food_id+food_name+ep_order_ea)
									
					$('#wh_body').append("<tr class='tr_reset'>"
							+"<td class='ep_id'>"+ep_id+"</td>"
							+"<td class='ep_name'>"+ep_name+"</td>"
							+"<td class='food_id'>"+food_id+"</td>"
							+"<td class='food_name'>"+food_name+"</td>"
							+"<td>"
							+'<button id="del" type="button" value="ep_order_wh_ea" class="btn btn-link" style="padding-top: 3px; padding-bottom: 3px;">'
							+'<i class="fa fa-minus" style="font-size:15px;color:#489CFF"></i>'
							+'</button>'							
							+'<input class="_ep_order_wh_ea" id="_ep_order_wh_ea" name="ep_order_wh_ea" type="text" value="'+ep_order_wh_ea+'" size="3" style="padding-top: 1px; padding-bottom: 3px;"/>'
							+'<button id="add" type="button" value="ep_order_wh_ea" class="btn btn-link" style="padding-top: 3px; padding-bottom: 3px;">'
							+'<i class="fa fa-plus" style="font-size:15px;color:#489CFF"></i>'
							+'</button>'							
							+"</td>"							
							+"<td>"
							+'<input class="_ep_order_food_shelflife" id="_ep_order_food_shelflife" name="ep_order_food_shelflife" type="date" value="'+_ep_order_food_shelflife+'"/>'
							+"</td>"
							+"<td>"
							+'<input class="_ep_order_unit_price" type="text" id="_ep_order_unit_price" name="ep_order_unit_price" value="'+_ep_order_unit_price+'" size="3" style="padding-top: 1px; padding-bottom: 3px;"/>'
							+"</td>"
							+"<td>"
							+'<input class="_ep_order_total_price" type="text" value="'+_ep_order_total_price+'" id="_ep_order_total_price" name="ep_order_total_price" readonly="readonly" size="4" style="padding-top: 1px; padding-bottom: 3px;"/>'
							+"</td>"							
							+"</tr>")
						
					$('#wh_form').append("<div class='in_reset'>"
							+'<input type="hidden" id="ep_order_id" name="ep_order_id" value="'+ep_order_id+'"/>'
							+'<input type="hidden" id="food_id" name="food_id" value="'+food_id+'"/>'
							+'<input class="ep_order_wh_ea" type="hidden" id="ep_order_wh_ea" name="ep_order_wh_ea"/>'
							+'<input class="ep_order_food_shelflife" type="hidden" id="ep_order_food_shelflife" name="ep_order_food_shelflife"/>'
							+'<input class="ep_order_unit_price" type="hidden" value="0" id="ep_order_unit_price" name="ep_order_unit_price"/>'
							+'<input class="ep_order_total_price" type="hidden" value="0" id="ep_order_total_price" name="ep_order_total_price"/>'
							+"</div>")							
				}); //반복문 끝
				// table 합계 화면에 자동으로 합계된 금액 들어가게하기
				var _ea = $('._ep_order_wh_ea')
				var _unit = $('._ep_order_unit_price')
				var _total = $('._ep_order_total_price')
				var total = $('.ep_order_total_price')
				$(document).on('change','.tr_reset',function(){
					for(var i=0; i<_total.length; i++){
						_total[i].value = parseInt(_ea[i].value) * parseInt(_unit[i].value);
					}
				})
				
			},			
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
			}
		});//ajax End
		//"+","-" 버튼 클릭시 수량 증감
		//동적으로 생성된 태그는 별도의 이벤트형식으로 지정 해줘야 함 .on
		$(document).on('click','#add',function(){
		 			//이전 형제 노드의 val()값을 add에 해당 value에 parseInt로 +1 해줘서 value에 담는다.
				var _add = $(this).prev().val();
				$(this).prev().val(parseInt(_add)+1);
//	 			console.log(_add);
				var unit = $(this).parent().next().next().children().val();
				// add 버튼의 부모는 add버튼이 속한 <td> 태그 , 그 다음 형제요소는 유통기한이 속한 <td> 태그, 그 다음 형제요소는 단가가 속한 <td>태그, 그 자식요소는 단가 input입력 
//	 			var total = $(this).parent().next().next().next().children().val();
//	 			alert(unit+"<<< 단가") alert(total+"<<< 소계")
				var multi = parseInt((parseInt(_add)+1) * unit);
//	 			alert(multi+"<< 곱하기")
				$(this).parent().next().next().next().children().val(multi);
				// 곱하기한값 삽입			
		})
		$(document).on('click','#del',function(){
				var _del = $(this).next().val();
						//parseInt 로 숫자 인식
				if(_del > 0){ // 0도 입력될수 있으니 0까지
					$(this).next().val(parseInt(_del)-1);
				}else{alert('더이상 감소 할수없습니다.');}
				var unit = $(this).parent().next().next().children().val();
				var multi = parseInt((parseInt(_del)-1) * unit);
				$(this).parent().next().next().next().children().val(multi);
		})
												// 입고수정 액션	
	$(document).on('click','#wh_mody_bt',function(){
// 		alert('등록버튼 클릭');
		var _ea = $('._ep_order_wh_ea') //수량 클래스
		var ea = $('.ep_order_wh_ea')
		var _life = $('._ep_order_food_shelflife') //유통기한 클래스
		var life = $('.ep_order_food_shelflife')
		var _unit = $('._ep_order_unit_price') // 단가
		var unit = $('.ep_order_unit_price')
		var _total = $('._ep_order_total_price')
		var total = $('.ep_order_total_price')		
		for(var i=0; i<_ea.length; i++){
			ea[i].value = _ea[i].value //수량 hidden input value 값 세팅
			life[i].value = _life[i].value //유통기한 hidden input value 값 세팅
			unit[i].value = _unit[i].value //단가 hidden input value 값 세팅
			total[i].value = _total[i].value // 합계 hidden input value 값 세팅
//			console.log(fo_life[i].value+"<< fo_life.value"+i+"번째");
		}
		// 유효성 검사 / 정규식
		var num = /^[0-9]*$/;
		var success = 0;
		var success2 = 0;
		var success3 = 0;
		var count2 = 0;
			//수량
		$('._ep_order_wh_ea').each(function(){
			var ep_order_ea = $(this).val();
// 			alert(ep_order_ea);
			if(!ep_order_ea){
				var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
						+'입고 수량을 입력 해주십시오.'
						+'</div>'
				$('#div_vaild').html(al);
				$(this).focus();
				
				success = 0;
				return false;
			}else if(!num.test(ep_order_ea)){
				var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
  						+'입고 수량은 숫자만 입력 가능합니다.'
						+'</div>'
				$('#div_vaild').html(al);
				$(this).focus();
				
				success = 0;
				return false;
			}else{
				success = 1;
			}
// 				if(ep_order_ea == 0){
				
// 				var re = confirm('수량이 0개인 식재료가 있습니다. 계속 진행하시겠습니까?');
// 				if(re){
// 					$(this).parent().next().next().children().attr('readonly',true);
// 					success = 1;					
// 				}else{
// 					success = 0;
// 					return false;
// 					}				
// 			}else{
// 				$(this).parent().next().next().children().attr('readonly',false);
// 				success = 1;
// 			}
		})
		if(success == 1){ 			
			//유통기한
			$('._ep_order_food_shelflife').each(function(){
				var ep_order_food_shelflife = $(this).val();
				if(!ep_order_food_shelflife){
					var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
  						+'유통기한을 입력 해주십시오.'
						+'</div>'
				$('#div_vaild').html(al);
				$(this).focus();
					success2 = 0;
					return false;
				}else{
					success2 = 1;
					}
			})			
		}
		var count = 0;
		if(success2 == 1){			
			// 단가			
			$('._ep_order_unit_price').each(function(){
				var ep_order_unit_price = $(this).val();
				if(!ep_order_unit_price){
					var al = '<div "class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
							+'단가를 입력 해주십시오.'
							+'</div>'
					$('#div_vaild').html(al);
					$(this).focus();
					
				}else if(!num.test(ep_order_unit_price)){
					var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
							+'단가는 숫자만 입력가능합니다.'
							+'</div>'
					$('#div_vaild').html(al);
					$(this).focus();
					success3 = 0;
					return false;				
					}else if(ep_order_unit_price == 0){
						count++;
						success3 = 1;
						return false;
					}else{
						count = 0;
						success3 = 1;
					}				
			}) // 단가 반복문
		}
// 		alert(count);
		if(success3 == 1){
			if(count > 0){
				var re = confirm('단가가 0원인 식재료가 있습니다. 계속 진행하시겠습니까?');
				if(re){
					var addform = $('#wh_form').serialize();
					$.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/ep_wh_mody",
							data : addform,
							success : function(data){
								alert('수정되었습니다.');
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
						});// 수정액션 ajax 끝
				}
			}else if(count == 0){
				var addform = $('#wh_form').serialize();
				$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/ep_wh_mody",
						data : addform,
						success : function(data){
							alert('수정되었습니다.');
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
					});// 수정액션 ajax 끝				
			}
		}
	}) //입고수정 액션 End
		
	// 해당 입고 취소
	$('#wh_cancel').click(function(){
// 		alert($(this).val())
		var ep_order_id = $(this).val();
		var re = confirm('해당 입고를 취소하시면 입고등록을 다시 해주셔야합니다. 계속 진행하시겠습니까? ');
		if(re){
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/ajax/ep_wh_cancel",
				data : 'ep_order_id='+ep_order_id,
				success : function(data){
					alert('해당 입고가 취소되었습니다.');
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
			});// 입고취소 ajax 끝
		}
	})
	// 닫기 이벤트
	$('#wh_exit').click(function(){
		self.close();
	})
	
	}) // ready End
</script>
</head>
<body>
<br>
<br>
<div class="container">
<h4>입고 수정</h4>
		<span id="ep_order_id"></span>
		<input type="hidden" id="_ep_order_id"/>
		<div style="overflow:auto;height:500px;">
		<table  class="chkclass table table-hover" style="text-align:center">
			<thead>
				<tr style='position:relative;top:expression(this.offsetParent.scrollTop);background:black;color:white;" align="left"'>
					<th>업체코드</th>
					<th>업체명</th>
					<th>식재코드</th>
					<th>상품명</th>
					<th>수량</th>
					<th>유통기한</th>
					<th>단가</th>
					<th>소계</th>
				</tr>
			</thead>
			<tbody id="wh_body" style='width:100%;max-height:100px;overflow:auto;'>
				<!-- ajax append 들어감 -->				
			</tbody>
		</table>
			<form id="wh_form" action="${pageContext.request.contextPath}/ep_wh_mody" method="get"> <!-- 배열이라서 그런지 get방식으로 보낸다 -->
<!-- 				hidden 처리 하고 값 보냄 // 업체코드,식재코드 등등 -->							
			</form>
			<div>
			<div id="div_vaild">
			</div>
				<center>
				<button class="btn btn-primary" type="button" id="wh_mody_bt">수정</button>				
				<button class="btn btn-default" type="button" id="wh_cancel">입고취소</button>
				<button class="btn btn-default" type="button" id="wh_exit">닫기</button>
				</center>
			</div>
			
		</div>		
	</div> <!-- 입고등록 폼 end -->
</body>
</html>