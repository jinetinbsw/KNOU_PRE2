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
<title>발주·입고 목록</title>
<%@ include file="../../modal/header.jsp" %>
<style type="text/css">
.table th{
	text-align:center;
}
</style>
<script type="text/javascript">
	/* 상세보기 클릭시 해당 상세보기 창 띄우기 */
	$(document).ready(function(){
		$('#div_wh').css("display","none");
// 		상세보기 클릭 이벤트
		$(document).on('click','#wh_sangse',function(){
			$('#div_wh').css("display","block");
			$('.tr_reset').remove(); // 다른 버튼 클릭시 append로 추가 됐던 tr 구문 삭제
			var ep_o_id = $(this).val();
// 			alert(ep_o_id);
			$.ajax({ // ajax 입력 등록폼과 일치하는 방식이니 ep_wh_add_form 으로 보냄
			type : "GET",
			url : "${pageContext.request.contextPath}/ajax/ep_wh_add_form",
			data : "ep_order_id="+ep_o_id,
			dataType : "JSON",
			success : function(data){
// 				alert('성공')
				var tot = 0;
				$.each(data,function(){
// 					console.log(this.ep_id+"<<<<<");
					ep_order_id = this.ep_order_id;
// 					console.log(ep_order_id+'<<<< ep_order_id');
					$('#ep_order_id').html("발주코드 : "+ep_order_id);
					$('#wh_mody').val(ep_order_id);
					ep_id = this.ep_id;
					ep_name = this.ep_name;
					food_id = this.food_id;
					food_name = this.food_name;
					ep_order_wh_ea = this.ep_order_wh_ea;
					ep_order_food_shelflife = this.ep_order_food_shelflife;
					ep_order_unit_price = this.ep_order_unit_price;
					ep_order_total_price = this.ep_order_total_price
					
					total = parseInt(ep_order_total_price) 
					tot += parseInt(total)
// 					alert(ep_order_wh_ea);
					$('#wh_body').append("<tr class='tr_reset'>"
							+"<td class='ep_id'>"+ep_id+"</td>"
							+"<td class='ep_name'>"+ep_name+"</td>"
							+"<td class='food_id'>"+food_id+"</td>"
							+"<td class='food_name'>"+food_name+"</td>"
							+"<td class='ep_order_wh_ea'>"+ep_order_wh_ea+"</td>"
							+"<td class='ep_order_food_shelflife'>"+ep_order_food_shelflife+"</td>"
							+"<td class='ep_order_unit_price'>"+ep_order_unit_price+"</td>"
							+"<td class='ep_order_total_price'>"+ep_order_total_price+"</td>"
							+"</tr>");
					})
					$('#total').html('<h3>총 발주액 : '+tot+' 원</h3>');
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
			}
			})//ajax end
			// 총 발주입고액 구하기
// 			alert('asd');
// 		var total = Array(); 
// // 		total = $('.ep_order_total_price').val();
// 		$('.ep_order_total_price').each(function(){
// 			var to = $(this).val();
// 			alert(to);
// 		})
					
// 					$('#total').html()			
		}); //상세보기 클릭 이벤트 end
		var wh_mody;
		$('#wh_mody').click(function(){
			var ep_order_id = $(this).val();
// 			var wh_mody = $('#wh_mody').val();
// 			alert(wh_mody);
			wh_mody = window.open('${pageContext.request.contextPath}/ep_wh_modify_view','popup','width=1050,height=700,left=0,top=0,toolbar=no,locaton=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no');
			wh_mody.document.getElementById("wh_mody").value = $('#wh_mody').val(); // id몇이 같아야함
			
		})
		
	});//ready End

</script>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<h3>발주·입고 목록</h3>
<div class="col-md-offset-10"><span style="font-size: 16px;">발주·입고 목록 수 : ${wh_count}</span></div>
	<div class="col-sm-5">
		
		<br>
		<div style="overflow:auto;height:500px;">
		<table class="chkclass table table-hover" style="text-align:center">
			<thead>
				<tr style='position:relative;top:expression(this.offsetParent.scrollTop);background:black;color:white;" align="left"'>
					<th>번호</th>
					<th>발주코드</th>
					<th>발주일자</th>
					<th>입고일자</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody style='width:100%;max-height:100px;overflow:auto;'>
				<c:forEach varStatus="status" var="w" items="${list}">
				<tr>					
					<td>${(wh_count-status.index)}</td>
					<td>${w.ep_order_id}</td>
					<td>${w.ep_order_date}</td>
					<td>${w.ep_order_wh_date}</td>
					<td><button class="wh_sangse" id="wh_sangse" type="button" value="${w.ep_order_id}">상세보기</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<center><c:if test="${empty list}"><div><h4>입고된 발주가 없습니다.</h4></div></c:if></center>
		<center>
		<ul class="pagination pagination-sm" style="text-align: center; width: 300px; margin-left: auto; margin-right: auto;">
		<c:if test="${currentPage > 1}">
			<li><a href="${pageContext.request.contextPath}/food_list?currentPage=${currentPage-1}">이전</a></li>
		</c:if>
		<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
			<c:choose>
				<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/ep_wh_list?currentPage=${i}">[${i}]</a></li></c:when>
				<c:otherwise><li><a href="${pageContext.request.contextPath}/ep_wh_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${currentPage < lastPage}">
			<li><a href="${pageContext.request.contextPath}/ep_wh_list?currentPage=${currentPage+1}">다음</a></li>
		</c:if>
		</ul>
		</center>	
		</div>	
	</div> <!-- 발주/입고목록 div끝 -->
<div id="div_wh" class="col-sm-6"> <!-- 상세보기 -->
	<h4>상세보기</h4>
		<span id="ep_order_id"></span>
		<div style="overflow:auto;height:500px;">
		<table  class="table table-hover" style="text-align:center">
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
		<center>
			<div>
			<button class="btn btn-primary" type="button" id="wh_mody" style="width: 91.9375px;height: 30px;padding-top: 5px;padding-bottom: 5px;">수정</button>
			</div>
		</center>
		<center>
			<div id = "total">
			<h3>총 발주액 : </h3>
			</div>
		</center>		
		</div>
		
	</div>

</body>
</html>