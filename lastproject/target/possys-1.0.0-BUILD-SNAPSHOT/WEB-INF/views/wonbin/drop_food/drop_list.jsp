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
<title>폐기 목록</title>
<%@ include file="../../modal/header.jsp" %>
<style type="text/css">
.table th{
	text-align:center;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#sangse_diply').css("display","none");
		// 검색	
		$('#dbutton').click(function(){
			
			var va = $("#selbox option:selected").val();
			
			var regexp = /\s/g;
			if(va !=null || va != "" || va != regexp){
				
				frm.submit();
			}else{
				/* alert('asd'); */
			}
		});
		
		//상세보기 관련
	$(document).on('click','#bt_sangse',function(){
		
		$('#sangse_diply').show(100);
		var drop_id =$(this).val();
// 		alert(drop_id);
		$.ajax({
			type: "get",
			url : "${pageContext.request.contextPath}/ajax/aj_drop_sangse",
			data : "drop_id="+drop_id,
			dataType : "JSON",
			success : function(data){
// 				alert('성공');
				console.log(data);
				$('#drop_id').val(data.drop_id); // 상세보기 가져온 값을 input value에 넣어줌.
				$('#food_id').val(data.food_id);
				$('#food_name').val(data.food_name);
				$('#drop_reason').val(data.drop_reason);
				$('#drop_ea').val(data.drop_ea);
				$('#in_drop_ea').val(data.drop_ea); // 폐기수량을 히든으로 하나 더 주어 수정시 계산식을 만듬
				$('#staff_id').val(data.staff_id);
				$('#food_nowquantity').val(data.food_nowquantity);
				$('#ep_order_id').val(data.ep_order_id);
				//초기 남은수량 히든 값에 넣어줌
				var f_drop_ea = $('#in_drop_ea').val();
				var f_food_nowquantity = $('#food_nowquantity').val();
				var _f_drop_ea = parseInt(f_drop_ea);
				var _f_food_nowquantity = parseInt(f_food_nowquantity);
				var first = parseInt(_f_drop_ea + _f_food_nowquantity);
// 				alert(first);
				$('#first_food_nowquantity').val(first);
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
			}	
		})//ajax End
	})// 상세보기 버튼 End	
	
	var first_food_nowquantity = $('#food_nowquantity').val();
	// 상세보기 화면 - 수정 액션 요청
	$(document).on('click','#sangse_up',function(){		
		var food_nowquantity = $('#food_nowquantity').val();
		var _food_nowquantity = parseInt(food_nowquantity);
		//상세보기 초기 수정괎과 입력된 수정값의 차를 구함. 
		var in_drop_ea = $('#in_drop_ea').val();
		var drop_ea = $('#drop_ea').val();
		var on_drop_ea = parseInt(drop_ea);
		var _drop_ea = parseInt(in_drop_ea - drop_ea);
		// 원래 남은수량 구함
		var food_now_ea = $('#first_food_nowquantity').val();
		var _food_now_ea = parseInt(food_now_ea);
// 		alert(_food_now_ea);
		$('#cha_drop_ea').val(_drop_ea);	
		var up_form_lize = $('#up_form').serialize(); // Form 태그내의 항목들을 자동으로 읽어와 queryString 형식으로 변환시켜 준다
// 		alert(_ep_order_wh_ea);
		if(on_drop_ea > _food_now_ea){
			alert('폐기수량이 남은 수량보다 많습니다. [남은 수량 : '+_food_now_ea+']');
		}else if(on_drop_ea == 0){
			alert('입력된 수량이 0입니다. 전체삭제를 원하시면 하단 전체삭제버튼을 클릭하세요.')
			$('#drop_ea').val(in_drop_ea);
// 			alert(in_drop_ea);
			return false;
		}else{
			$.ajax({
				type: "get",
				url : "${pageContext.request.contextPath}/ajax/aj_drop_sangse_up",
				data : up_form_lize,
				success : function(data){
					alert('폐기정보가 수정되었습니다.');
					var cnt = 1;
					if(cnt == 1) {
					   location.reload(); //한번 새로고침 시켜준다.
					   cnt = 0;
					}
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
				}				
			})//ajax End
		}
		
	}) // 수정 버튼 End
	
	// 상세보기 - 폐기 삭제
	$(document).on('click','#sangse_del',function(){
// 		alert('폐기 전체삭제');
		var drop_id = $('#drop_id').val();
		var food_id = $('#food_id').val();
		var ep_order_id = $('#ep_order_id').val();
		// 폐기된 갯수 + 남은 수량
		var food_nowquantity = $('#food_nowquantity').val();
		var _food_nowquantity = parseInt(food_nowquantity);
		var drop_ea = $('#drop_ea').val();
		var _drop_ea = parseInt(drop_ea);
		var re_dorder_wh_ea = _food_nowquantity + _drop_ea; // 폐기된 갯수와 남은수량을 더하여 초기 갯수를 구해서 다시 ep_order_food_details테이블을 업데이트 시켜준다.
// 		alert(re_dorder_wh_ea);
		var re = confirm('폐기 삭제를 하시면 해당 폐기등록된 상품이 취소됩니다. 계속 진행하시겠습니까?');
		if(re){
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/ajax/aj_sangse_del",
				data : "re_dorder_wh_ea="+re_dorder_wh_ea+"&drop_id="+drop_id+"&food_id="+food_id+"&ep_order_id="+ep_order_id,
				success : function(data){
					alert('해당 폐기등록을 삭제하였습니다.');					
					var cnt = 1;
					if(cnt == 1) {
					   location.reload(); //한번 새로고침 시켜준다.
					   cnt = 0;
					}
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
				}
			})//ajax End
		}
	})	
	$('#censel').click(function(){
		$('#sangse_diply').hide(100);
	});
	}); // ready End
</script>
<%-- <%@ include file="../../modal/wide_menu.jsp" %> --%>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<h3>폐기 목록</h3>
<div>전체 식자재 수 : ${dropcount}</div>
	<br>
	<div class="col-sm-5">
		<table class="table table-hover" style="text-align:center">
			<thead>
				<tr style="background:black;color:white;">
				<th>번호</th>
				<th>폐기 번호</th>
				<th>상품 번호</th>
				<th>수량</th>
				<th>폐기 사유</th>
				<th>담당자</th>
				<th>폐기 일자</th>
				<th>상세 보기</th>
				</tr>		
			</thead>
			<tbody>
				<c:forEach varStatus="status" var="d" items="${list}">
				<tr>
					<td>${(dropcount-status.index)-((currentPage-1)*pageRow)}</td>
					<td>${d.drop_id}</td>
					<td>${d.food_id}</td>
					<td>${d.drop_ea}</td>
					<td>${d.drop_reason}</td>
					<td>${d.staff_id}</td>
					<td>${d.drop_date}</td>				
					<td><button type="button" id="bt_sangse" value="${d.drop_id}">상세보기</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<center><c:if test="${empty list}"><div><h4>등록된 폐기 식재료가 없습니다.</h4></div></c:if></center>
		<center>
		<ul class="pagination pagination-sm" style="text-align: center; width: 300px; margin-left: auto; margin-right: auto;">
			<c:if test="${currentPage > 1}">
				<li><a href="${pageContext.request.contextPath}/drop_list?currentPage=${currentPage-1}">이전</a></li>
			</c:if>
			
				<c:if test="${selbox != null && keyWord != null}">
				<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
					<c:choose>
						<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/drop_search?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:when>
						<c:otherwise><li><a href="${pageContext.request.contextPath}/drop_search?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:otherwise>
					</c:choose>
				</c:forEach>
				</c:if>
				<c:if test="${selbox == null && keyWord == null}">
				<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
					<c:choose>
						<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/drop_list?currentPage=${i}">[${i}]</a></li></c:when>
						<c:otherwise><li><a href="${pageContext.request.contextPath}/drop_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
					</c:choose>
				</c:forEach>
				</c:if>
				
				
			<c:if test="${currentPage < lastPage}">
				<li><a href="${pageContext.request.contextPath}/drop_list?currentPage=${currentPage+1}">다음</a></li>
			</c:if>
		</ul>
		</center>
		<div>
			<form id ="frm" name="frm" action="${pageContext.request.contextPath}/drop_search" method="get">
				<select id="selbox"name="selbox" size="1" style="width: 172px;height: 30.22222px;padding-bottom: 0px;padding-top: 0px;">
					<option value="drop_id">폐기코드</option>
					<option value="food_id">식재코드</option>
				</select>
				<input  size="16" name="keyWord" type="text" style="padding-bottom: 4px; padding-top: 6px; height: 31px;">
				<input id="dbutton" type="button" value="검색" style="padding-top: 4.5;padding-bottom: 4.5;padding-top: 4px;padding-bottom: 4px;">
			</form>
		</div>
	</div>
<!-- 	상세보기 폼 -->
<div id="sangse_diply">
	<div class="container">
		<form class="form-horizontal col-sm-7" id="up_form">		
			<div class="form-group">
				<label class="control-label col-sm-2">폐기 코드</label>
				<div class="col-xs-7">
					<input  class="form-control" name ="drop_id" id ="drop_id" type ="text" readonly="readonly"/>
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
					<input  class="form-control" name ="staff_id" id ="staff_id" type ="text" value="<%-- ${sessionScope.admin.admin_id} --%>"readonly="readonly"/>
				</div>
			</div>
			<br>
			<div class="form-group col-sm-12">
				<center>
				<input class="btn btn-primary" type="button" id="sangse_up" value="폐기 수정">
				<input class="btn btn-default" type="button" id="sangse_del" value="폐기 삭제">
				<button class="btn btn-default" type="button" id="censel">취소</button>
				</center>
			</div>
			<input type="hidden" name="ep_order_id" id="ep_order_id"/>
			<input type="hidden" name="food_nowquantity" id="food_nowquantity"/>
			<input type="hidden" name="cha_drop_ea" id="cha_drop_ea">
			<input type="hidden" id="in_drop_ea"/>
		</form>
			<input type="hidden" id="first_food_nowquantity"/>
	</div>
</div>	
</body>
</html>