<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>식자재 현황 목록</title>
<%@ include file="../../modal/header.jsp" %>
<style type="text/css">  
.table th{
	text-align:center;
}
</style>
<script type="text/javascript">
		
	$(document).ready(function(){
		 
		$('#div_displ').css("display","none");
		$('#div_displ_snangse').hide();
		//검색 
		$('#fbutton').click(function(){
			
			var va = $("#selbox option:selected").val();
			
			var regexp = /\s/g;
			if(va !=null || va != "" || va != regexp){
				
				frm.submit();
			}else{
				/* alert('asd'); */
			}
		});
// 		//전체보기/미등록/등록 목록보기 select
// 		$('#sel_list').change(function(){
			
// 			var va = $("#sel_list option:selected").val();
// // 			alert(va);
// 			var regexp = /\s/g;
// 			if(va !=null || va != "" || va != regexp){
				
// 				sel_list_sub.submit();
// 			}else{
// // 				alert('asd');
// 			}
// 		});

		//상세보기 확인 버튼 클릭시
		$(document).on('click','#success',function(){
			$('.snagse_re').remove();
			$('#div_displ_snangse').hide();
		})
		//체크박스 전체 선택/해제
		$("#food_chkall").click(function(){
			$('.snagse_re').remove();
			$('.div_span').remove();
			$('._all').remove();
			$('#div_displ_snangse').hide();
			if($("#food_chkall").prop("checked")){
				if($("input[name=food_id]").prop("checked",true)){
					// 전체 선택시 전체 선택한 val()를 반복문으로 가져오기
					var one ="";
					var two ="";
					var the ="";
					$('#div_displ').css("display","block");
					$("input[name=food_id]:checked").each(function() {
						var test1 = $(this).val();
// 						console.log(arry);
						
					 // 값을 "," 사이에 두개 가져왔으니 split 을 이용해 잘라내여 담아준다.
					 var test1Array = Array(); //배열 변수를 설정안해줘도 알아서 배열로 담아준다.
						var test1Array = test1.split('/');
						one = test1Array[0];
						two = test1Array[1];
						the = test1Array[2];
						var add_input = '<div class="_all"><span style="display:inline-block; width:200px; background-color:#CCCC">'+one+'/'+two+'</span>'						
						+'<input class="food_id" type="hidden" id="food_id" name="food_id" value="'+one+'"/>'
						+'<input type="hidden" id="ep_id" name="ep_id" value="'+the+'"/>'
						+'&nbsp&nbsp&nbsp'
						+'<button id="del" value="1" type="button" class="btn btn-link" style="padding-top: 3px; padding-bottom: 3px;">'
						+'<i class="fa fa-minus" style="font-size:15px;color:#489CFF"></i>'
						+'</button>'
						+'<input type="text" class="order_ea" id="ep_order_ea" name="ep_order_ea" value="1" size="3" style="padding-top: 1px; padding-bottom: 3px;">'
						+'<button id="add" value="1" type="button" class="btn btn-link" style="padding-top: 3px; padding-bottom: 3px;">'
						+'<i class="fa fa-plus" style="font-size:15px;color:#489CFF"></i>'
						+'</button>'						
						+'&nbsp&nbsp&nbsp'
						+'<button class="ap_chk btn btn-link" type="button" id="o_del" name="o_del" value="'+test1+'" style="padding-top: 3px; padding-bottom: 3px;"><i class="fa fa-close" style="font-size:15px;color:red"></i></button>'
									
					$('.order_add').append(add_input);
					
// 						console.log(one);						
// 					  console.log(test1);
// 					  console.log(test1Array[0]);
// 					  console.log(test1Array[1]);
					})
			}
			}
			/* food_chkall 체크박스 클릭시 하단 체크박스 모두 해제 */
			if($(this).is(":checked") == false){ 
				$(".td_chk").prop("checked",false);
				$('._all').remove(); //추가되었던 append삭제
				$('#div_displ').css("display","none");
			}
			/* 체크박스 해제시 해당 input 도 같이 삭제 */
			$(document).on('change','.td_chk',function(){
// 				alert('변환');
				if($(this).is(':checked') == false){ 
					var test1 = $(this).val();
// 					alert(test1+'<<<');
					$('.ap_chk').each(function(){
						var ap_chk = $(this).val()
						if(test1 == ap_chk){
							$(this).parent().remove();
						}						
				})				
				}
				var _all = $('._all'); // append 추가된 input 클래스
//	 			alert(_all.length);
				if(_all.length == 0){ // 클래스 길이가 0이면 디스플레이 none
					$('#div_displ').css("display","none");
				}
				
			})// 체크박스 해제시 해당 input 도 같이 삭제 end
			
			

		});		
		//체크박스 체크시 동적으로 등록화면에 표시
		$('.td_chk').click(function(){
				$('.snagse_re').remove(); // 상세보기 append,html - 삭제 , hide() 시키기 
				$('.div_span').remove();
				$('#div_displ_snangse').hide();
				$('#div_displ').css("display","block");
				//클릭한 대상이 체크 되있으면 아래 조건문을 실행
				if($(this).is(':checked') == true){
					var test2 = $(this).val();
					var food_id = test2.split('/');
					//alert(test2);
// 					alert(food_id[0]);
										//span syle 가로 길이 설정
					var add_input = '<div class="_all"><span style="display:inline-block; width:200px; background-color:#CCCC">'+food_id[0]+'/'+food_id[1]+'</span>'						
					+'<input class="food_id" type="hidden" id="food_id" name="food_id" value="'+food_id[0]+'"/>'
					+'<input type="hidden" id="ep_id" name="ep_id" value="'+food_id[2]+'"/>'
					+'&nbsp&nbsp&nbsp'
					+'<button id="del" value="1" type="button" class="btn btn-link" style="padding-top: 3px; padding-bottom: 3px;">'
					+'<i class="fa fa-minus" style="font-size:15px;color:#489CFF"></i>'
					+'</button>'
					+'<input type="text" class="order_ea" id="ep_order_ea" name="ep_order_ea" value="1" size="3" style="padding-top: 1px; padding-bottom: 3px;">'
					+'<button id="add" value="1" type="button" class="btn btn-link" style="padding-top: 3px; padding-bottom: 3px;">'
					+'<i class="fa fa-plus" style="font-size:15px;color:#489CFF"></i>'
					+'</button>'						
					+'&nbsp&nbsp&nbsp'
					+'<button class="ap_chk btn btn-link" type="button" id="o_del" name="o_del" value="'+test2+'" style="padding-top: 3px; padding-bottom: 3px;"><i class="fa fa-close" style="font-size:15px;color:red"></i></button>'	
						
						
// 					var add_input = '<div class="_all" ><span style="display:inline-block; width:200px; background-color:#CCCC">'+food_id[0]+'/'+food_id[1]+'</span>'						
// 						+'<input class="food_id" type="hidden" id="food_id" name="food_id" value="'+food_id[0]+'"/>'
// 						+'<input type="hidden" id="ep_id" name="ep_id" value="'+food_id[2]+'"/>'
// 						+'&nbsp&nbsp&nbsp<span>수량: </span>' 
// 						+'<input class="ep_order_ea" type="text" id="ep_order_ea" name="ep_order_ea" value="1" size="3">'
// 						+'<button class="add" id="add" type="button" value="1">+</button><button id="del" type="button" value="1">-</button>'
// 						+'&nbsp&nbsp&nbsp<button class="ap_chk" type="button" id="o_del" name="o_del" value="'+test2+'">X</button></div>';
					$('.order_add').append(add_input);
// 						console.log(add_input);
				}
				/* 체크박스 해제시 해당 input 도 같이 삭제 */
				if($(this).is(':checked') == false){ 
					var test2 = $(this).val();
					$('.ap_chk').each(function(){
						var ap_chk = $(this).val()
						if(test2 == ap_chk){
							$(this).parent().remove();
						}						
				})
					var _all = $('._all'); // append 추가된 input 클래스
//		 			alert(_all.length);
					if(_all.length == 0){ // 클래스 길이가 0이면 디스플레이 none
						$('#div_displ').css("display","none");
					}
				} // 체크박스 해제시 해당 input 도 같이 삭제 end								
		}) //체크박스 체크시 동적으로 등록화면에 표시 end
		
		//"+","-" 버튼 클릭시 수량 증감
		//동적으로 생성된 태그는 별도의 이벤트형식으로 지정 해줘야 함 .on
		$(document).on('click','#add',function(){
	 			//이전 형제 노드의 val()값을 add에 해당 value에 parseInt로 +1 해줘서 value에 담는다.
			var _add = $(this).prev().val();
			$(this).prev().val(parseInt(_add)+1);
// 			console.log(_add);
		})
		$(document).on('click','#del',function(){
				var _del = $(this).next().val();				
					//parseInt 로 숫자 인식
				if(_del > 1){
					$(this).next().val(parseInt(_del)-1);
				}else{alert('더이상 감소 할수없습니다.');}
				})
		//"X"버튼 클릭시 추가한 해당태그 삭제
		$(document).on('click','#o_del',function(){
			$(this).parent().remove();	//해당 부모요소를 삭제				
			var ck_food_id = $(this).val(); // 해당태그 value 값
// 				console.log(ck_food_id);
			$("input[name=food_id]:checked").each(function() { 
					var te = $(this).val();
// 					console.log(te);
				if(te == ck_food_id){
					$(this).prop("checked",false);
				}
			})
			var _all = $('._all'); // append 추가된 input 클래스
// 			alert(_all.length);
			if(_all.length == 0){ // 클래스 길이가 0이면 디스플레이 none
				$('#div_displ').css("display","none");
			}
		})
		//"전체 삭제" 버튼 클릭시체크박스도 해제
		$(document).on('click','#order_alldel',function(){
			$('._all').remove();			
			$(".td_chk").prop("checked",false); //체크박스 전체 false
			$("#food_chkall").prop("checked",false);
			$('#div_displ').css("display","none");
		})
		// 등록버튼 클릭시 발주 등록
		$(document).on('click','#order_submit',function(){
// 			alert('버튼');
			// 정규식 검사
			var num = /^[0-9]*$/;
				// 입력 수량을 반복문돌려서 정규식 확인
			var success = 0;
// 			alert(success+'첫');
			$('.order_ea').each(function(){
				var ep_order_ea = $(this).val();
// 				alert(ep_order_ea);
				if(!num.test(ep_order_ea)){
					var al = '<div class="alert alert-warning" style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">'
		  					+'발주 수량은 숫자만 입력 가능합니다.'
							+'</div>'
					$('#div_vaild').html(al);
					$(this).focus();
					success = 0;
// 					alert(success+'X둘');
					return false;
				}else{
					success = 1;
// 					alert(success+'둘');
				}
			})
// 			alert(success+'셋');
			if(success == 1){ // 1이면 발주 진행
			var re = confirm('발주신청을 계속 진행하시겠습니까?');
			
			if(re){
				var sub; // 등록이 다 되어 있으면 submit 을 위한 변수 선언
				// 식재료가 업체 등록 되었는지 확인
				$('.food_id').each(function(){ // 클래스 반복문 으로 각각의 val()값 확인
					var food_id = $(this).val();
					
					$.ajax({
						type: "post",
						url : "${pageContext.request.contextPath}/ajax/ep_chck",
						data : "food_id="+food_id,
						async: false, // ajax를 동기방식으로 전역변수 sub에 값 세팅
						contentType:"application/x-www-form-urlencoded; charset=UTF-8",
						dataType : "JSON", //string 으로 리턴하기 때문에 
						success : function(data){
// 	 						alert('성공');
// 							console.log(data);
// 							alert(food_id);
							var count = 0;
							if(data == 0){
								alert('식재코드 ['+food_id+'] 는(은) 업체등록이 안되어있습니다. 업체등록후 발주신청해주십시오.');
								count++
								
							}else if(count == 0){
								sub = '없음';
							}
							
						},
						error : function(request,status,error){
							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
						}			
						
					})//ajax end
					
				});// food_id 클래스 반복문 end
// 				alert('등록');
// 				alert(sub);
				if(sub == '없음'){
// 					alert('까꿍');
				order_add.submit(); //등록이 다 되어 있으면 submit
				}
			}else{}
			} //정규식 if 조건문 end
		})
		
								// 식재자 상세보기 관련 jquery
		$(document).on('click','#bt_sangse',function(){
// 			$('#div_displ_snangse').css("display","block");
			$('#div_displ').css("display","none"); //등록 div 안보이게 함
			$('#food_chkall').prop("checked",false); // 체크 다 해제
			$(".td_chk").prop("checked",false); // 상단 체크박스 해제
			$('._all').remove(); //추가되었던 append삭제
			$('#div_displ_snangse').show(500);
			$('.snagse_re').remove();
			var food_id = $(this).val();
			var food_name;
			var ep_id;
			var ep_nmae;
// 			alert(food_id);
			$.ajax({ // 상세보기 폼 화면 span 관련
				type: "get",
				url : "${pageContext.request.contextPath}/ajax/aj_sangse_span",
				data : "food_id="+food_id,
				contentType:"application/x-www-form-urlencoded; charset=UTF-8",
				dataType : "JSON", //string 으로 리턴하기 때문에 
				success : function(data){
// 						alert('성공');
// 						console.log(data);
						
						food_name = data.food_name;
						ep_id = data.ep_id;
						ep_name = data.ep_name;
// 						console.log(food_id+'[식재코드]'+food_name+'[식재이름]'+ep_id+'[업체코드]'+ep_name+'[업체이름]');
						var span = '<div class="div_span"><span>식재코드 : '+food_id+' / 상품명 : '+food_name+'</span><br><span>업체코드 : '+ep_id+' / 업체명 : '+ep_name+'</span></div>';
						$('#sangse_span').html(span);
				
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
				}				
			})// ajax span End
			
			$.ajax({	// 상세보기 table 관련
				type: "get",
				url : "${pageContext.request.contextPath}/ajax/aj_sangse_table",
				data : "food_id="+food_id,
				contentType:"application/x-www-form-urlencoded; charset=UTF-8",
				dataType : "JSON", //string 으로 리턴하기 때문에 
				success : function(data){
// 						alert('성공');
						console.log(data);
						var b4_ep_order_id = data.b4_ep_order_id;
						var b4_or_date = data.b4_or_date;
						var b4_or_wh_date = data.b4_or_wh_date;
						var b4_or_wh_ea = data.b4_or_wh_ea;
						var b4_food_shelflife = data.b4_food_shelflife;
						var recent_ep_order_id = data.recent_ep_order_id;
						var recent_or_date = data.recent_or_date;
						var recent_or_wh_date = data.recent_or_wh_date;
						var recent_or_wh_ea = data.recent_or_wh_ea;
						var recent_food_shelflife = data.recent_food_shelflife;
						var sangse_table_one = "<tr class='snagse_re'>" // var 변수명 앞 숫자 넣으면 오류
											+"<td>"+b4_ep_order_id+"</td>"
											+"<td>"+b4_or_date+"</td>"
											+"<td>"+b4_or_wh_date+"</td>"
											+"<td>"+b4_food_shelflife+"</td>"
											+'<td style="width:86px; border-right:2px solid rgb(196, 193, 198); padding-right:8px; text-align:justify">'+b4_or_wh_ea+'</td>'
											+"</tr>"
											+'<tr class="snagse_re">'
											+'<td colspan="5" style="width:86px; border-bottom:2px solid rgb(196, 193, 198); border-right:2px solid rgb(196, 193, 198); padding-right:8px; text-align:center;"><button class="btn btn-default" type="button" id="bt_drop" value="'+food_id+'/'+b4_ep_order_id+'">폐기등록</button></td>'
											+"</tr>"
											
						var sangse_table_two = '<tr class="snagse_re">'
											+"<td>"+recent_ep_order_id+"</td>"
											+'<td>'+recent_or_date+'</td>'
											+"<td>"+recent_or_wh_date+"</td>"
											+"<td>"+recent_food_shelflife+"</td>"
											+'<td style="width:86px; border-right:2px solid rgb(196, 193, 198); padding-right:8px; text-align:justify">'+recent_or_wh_ea+'</td>'
											+"</tr>"
											+"<tr class='snagse_re'>"
											+'<td colspan="5" style="width:86px; border-bottom:2px solid rgb(196, 193, 198); border-right:2px solid rgb(196, 193, 198); padding-right:8px; text-align:center;"><button class="btn btn-default" type="button" id="bt_drop" value="'+food_id+'/'+recent_ep_order_id+'">폐기등록</button></td>'
											+'</tr>'
						$('#sangse_table_one').append(sangse_table_one);
						$('#sangse_table_two').append(sangse_table_two);
										
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
				}
			}) // ajax table End
		})		
				// 폐기등록 버튼 클릭 이벤트
		$(document).on('click','#bt_drop',function(){
			var bt_drop = $(this).val();
// 			alert(bt_drop+'<<< bt_drop');
			var arr = Array();
			arr = bt_drop.split('/');
			var food_id = arr[0];
			var ep_order_id = arr[1];
			$('#drop_bt_f_id').val(food_id);
			$('#drop_bt_o_id').val(ep_order_id);
// 			alert(food_i+'<<< food_id');
// 			alert(ep_order_wh_date+'<<< ep_order_wh_date')
// 			팝업창을 활용하여 폐기등록
			var drop_add;
			// drop_add 변수에 팝업창을 생성하여 담아줌.
			drop_add = window.open('${pageContext.request.contextPath}/drop_add_form','popup','width=770,height=700,left=0,top=0,toolbar=no,locaton=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no');
			drop_add.document.getElementById("drop_bt_f_id").value = $('#drop_bt_f_id').val();
			drop_add.document.getElementById("drop_bt_o_id").value = $('#drop_bt_o_id').val();
		})//폐기등록 End
								
								// 식재자 상세보기 관련 End
		
	//발주업체 관리 버튼을 클릭하면 체크박스 행(row) 값 가져오기
// 		$("#ep_submit").click(function(){
// 			if($("input[name=food_id]").is(":checked") == false){
// 				alert("선택된 항목이 없습니다.");
// 				return;	
// 			}else{ 
// 				var arr = Array();
// 				var count = 0;
// 				var td_chk = $(".td_chk"); 
// 				for(var i=0;i<td_chk.length;i++){ // 20length
// 					if(td_chk[i].checked == true){
// 						arr[count] = td_chk[i].value; // val()안됨
// 						count++;
// 					}
// 				}
// 				jQuery.ajaxSettings.traditional = true;
				
// 				$.ajax({
// 					type: "post",
// 					url : "${pageContext.request.contextPath}/ajax/food_chck",
// 					data : {arr: arr},
// 					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
// 					dataType : "JSON", //string 으로 리턴하기 때문에 
// 					success : function(data){
// // 						console.log('성공');
// 						console.log(data);
// // 						console.log(data[0]); // FN17050845
// // 						console.log(data.length); // 3
// 						var count = 0;
// 						for(var i=0;i<data.length;i++){
// 							var f_chk = data[i];
// 							if(f_chk != "N"){
// 								alert("식재 코드 : "+f_chk+"이(가) 이미 업체등록 되있습니다.");
// 								count++; //카운트를 주어서 중복된 갯수가 없으면 등록할수 있게 if문에 사용
// 							}else{
								
// 								//hidden으로 준 체크박스 체크
// // 								$("input[name=chk_jung]").prop("checked",true);
// 							}						
// 						}
// 						if(count == 0){
// 							alert("등록화면으로 넘어갑니다."); // 나중에 주석처리
// 							ep_chkbox.submit();
// 						}
// 					},
// 					error : function(request,status,error){
// 						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
// 					}				
// 				});//ajax 중복체크		
// 			}
// 		});
		
	}); //ready
</script>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<h3>발주등록 및 식자재 현황</h3>
<div class="col-md-offset-10"><span style="font-size: 16px;">전체 식재료 현황 수 : ${ep_ocount}</span></div>

<%-- 	<form id="sel_list_sub" name="sel_list_sub" action="${pageContext.request.contextPath}/sel_list" method="get"> --%>
<!-- 		<select id="sel_list" name="sel_list" > -->
<%-- 			<option  value="sel_all" <c:if test="${sel_list eq 'sel_all'}">selected</c:if>>전체보기</option> <!-- 선택된값 select 상태 남기기위한 jstl 적용 --> --%>
<%-- 			<option value="sel_y" <c:if test="${sel_list eq 'sel_y'}">selected</c:if>>업체 등록 식재료보기</option> --%>
<%-- 			<option value="sel_n" <c:if test="${sel_list eq 'sel_n'}">selected</c:if>>업체 미등록 식재료보기</option> --%>
<!-- 		</select> -->
<!-- 	</form> -->
	<div class="col-sm-5">
	<form id="ep_chkbox" action="${pageContext.request.contextPath}/ep_chkbox" method="post">
<!-- 	<input id="ep_submit" type="button" value="발주업체 관리"/> -->
		<i class="fa fa-cloud" style="font-size:24px;color:lightblue;" data-placement="right" data-toggle="tooltip" title="발주등록은 체크박스로 이용하실수 있습니다."></i>
		<br>		
		<div style="overflow:auto;height:500px;">
		
		<table class="chkclass table table-hover" style="text-align:center">
			<thead>
				<tr style='position:relative;top:expression(this.offsetParent.scrollTop);background:black;color:white;" align="left"'>
					<th><input type="checkbox" id="food_chkall"/> ▼</th>
					<th>번호</th>
					<th>식재코드번호</th>
					<th>상품명</th>
					<th>현재수량</th>
					<th>상세보기</th>
					<!-- style="display:none"으로 th,td 숨기기 -->
					<th style="display:none">업체코드</th>
				</tr>
			</thead>
			<tbody style='width:100%;max-height:100px;overflow:auto;'>
				<c:forEach varStatus="status" var="o" items="${list}">
				<tr>
					<td><input class = "td_chk" type="checkbox" name="food_id" id="food_id" value="${o.food_id}/${o.food_name}/${o.ep_id}"></td>
					<td>${(ep_ocount-status.index)}</td>
					<td>${o.food_id}</td>
					<td>${o.food_name}</td>
					<td>${o.food_nowquantity}</td>
					<td><button id="bt_sangse" type="button" value="${o.food_id}">상세보기</button></td>
					<td style="display:none">${o.ep_id}</td>					
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</form>
		<div class="alert alert-success alert-dismissable"  style="margin-top: 5px; margin-bottom: 5px; padding-bottom: 5px; padding-top: 5px;">
		  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>알림 - </strong> 원하시는 식재료가 없는경우 해당 식재료의 업체가 등록되었는지 확인해주십시오.
		</div>
		<div class="alert alert-success alert-dismissable"  style="margin-bottom: 5px; padding-bottom: 5px; padding-top: 5px;">
		  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>알림 - </strong> 발주등록은 체크박스를 통해 이용하실수 있습니다.
		</div>
	<div>
		<form id ="frm" name="frm" action="${pageContext.request.contextPath}/food_DT_search" method="get">
			<select id="selbox"name="selbox" style="width: 172px;height: 30.22222px;padding-bottom: 0px;padding-top: 0px;">
				<option value="food_id">식재코드번호</option>
				<option value="food_name">상품명</option>
			</select>
			<input  size="16" name="keyWord" type="text" style="padding-bottom: 4px; padding-top: 6px; height: 31px;">
			<input id="fbutton" type="button" value="검색" style="padding-top: 4.5;padding-bottom: 4.5;padding-top: 4px;padding-bottom: 4px;">
		</form>
	</div>
	</div>	
	<!-- 발주 등록 폼 ajax --> 
	
	<div id="div_displ">
		<div class="col-sm-7">		
		<h4>발주 등록</h4>
		<br>				
					<div>
						<form action="${pageContext.request.contextPath}/food_OD_insert" method="post" class="order_add" id="order_add" name="order_add" >
						
<!-- 						<span>식재료코드/상품명</span>							 -->
<!-- 								<input type="hidden" id="chk2_food_id" name="chk2_food_id"/> -->
<!-- 								<button type="button" class="btn btn-link" style="padding-top: 3px; padding-bottom: 3px;"> -->
<!-- 								<i class="fa fa-minus" style="font-size:15px;color:#489CFF"></i> -->
<!-- 								</button> -->
<!-- 								<input type="text" name="ep_order_ea" value="1" size="3" style="padding-top: 3px; padding-bottom: 3px;"> -->
<!-- 								<button type="button" class="btn btn-link" style="padding-top: 3px; padding-bottom: 3px;"> -->
<!-- 								<i class="fa fa-plus" style="font-size:15px;color:#489CFF"></i> -->
<!-- 								</button> -->
<!-- 								&nbsp&nbsp&nbsp<button class="btn btn-link" type="button" id="o_del" name="o_del" style="padding-top: 3px; padding-bottom: 3px;"><i class="fa fa-close" style="font-size:15px;color:red"></i></button> -->
						
						</form>
					</div>
					<br>
					<br>
					<div id="div_vaild">						
					</div>
					<div class="col-md-offset-4">
					<span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>					
					<button class="btn btn-primary" type="button" id="order_submit">등록</button>
					<button class="btn btn-default" type="button" id="order_alldel">전체 삭제</button>
					</div>			
		<br>
		</div>
	</div>
	
	<!-- 상세보기 폼 ajax -->
	<div id="div_displ_snangse">
		<div class="col-sm-7">
			<h4>상세보기</h4>
			<div id="sangse_span">
<!-- 				<span>식재코드/식재이름</span><br><span>업체코드/업체이름</span> -->
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<!-- 이전 -->
						<th>이전 발주코드</th>
						<th>이전 발주일자</th>
						<th>이전 입고일자</th>
						<th>유통 기한</th>
						<th style="width:86px; border-right:2px solid rgb(196, 193, 195); padding-right:8px; text-align:justify">남은 수량</th>
					</tr>
				</thead>
					<tbody id="sangse_table_one">
					<!-- append table -->
					</tbody>
			</table>
			<table class="table table-hover">
				<thead>
					<tr>
						<!-- 최근 -->
						<th>최근 발주코드</th>
						<th>최근 발주일자</th>
						<th>최근 입고일자</th>
						<th>유통 기한</th>
						<th style="width:86px; border-right:2px solid rgb(196, 193, 195); padding-right:8px; text-align:justify">남은 수량</th>
					</tr>					
				</thead>
				<tbody id="sangse_table_two">
					<!-- append table -->
				</tbody>
			</table>
			<center><button id="success" class="btn btn-success btn-md" style="margin-right: 5px;">확인</button><a href="${pageContext.request.contextPath}/drop_list"><button class="btn btn-default">폐기목록</button></a></center>		
		</div>
		<input type="hidden" id="drop_bt_f_id"/>
		<input type="hidden" id="drop_bt_o_id"/>
	</div>
		
</body>
</html>