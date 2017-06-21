<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>식자재 목록</title>
<%@ include file="../../modal/header.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		//식자재 추가시 새창
		$(document).on('click','#add_food',function(){
			window.open('${pageContext.request.contextPath}/food_add_form','popup','width=770,height=700,left=0,top=0,toolbar=no,locaton=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no');
		});
		//식자재 수정시 새창
				
// 		$('[data-toggle="tooltip"]').tooltip(); 
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
		//전체보기/미등록/등록 목록보기 select
		$('#sel_list').change(function(){
			
			var va = $("#sel_list option:selected").val();
// 			alert(va);
			var regexp = /\s/g;
			if(va !=null || va != "" || va != regexp){
				
				sel_list_sub.submit();
			}else{
// 				alert('asd');
			}
		});
		
		//체크박스 전체 선택/해제
		$("#food_chkall").click(function(){
			if($("#food_chkall").prop("checked")){
				$("input[name=food_id]").prop("checked",true);
			}else{
				$("input[name=food_id]").prop("checked",false);
			}
		});
	//발주업체 관리 버튼을 클릭하면 체크박스 행(row) 값 가져오기
		$("#ep_submit").click(function(){
			if($("input[name=food_id]").is(":checked") == false){
				alert("선택된 항목이 없습니다.");
				return;	
			}else{ 
				//중복 체크
				var arr = Array();
				var count = 0;
				var td_chk = $(".td_chk"); 
				for(var i=0;i<td_chk.length;i++){ // 20length
					if(td_chk[i].checked == true){
						arr[count] = td_chk[i].value; // val()안됨
						count++;
					}
				}
				jQuery.ajaxSettings.traditional = true;
				
				$.ajax({
					type: "post",
					url : "${pageContext.request.contextPath}/ajax/food_chck",
					data : {arr: arr},
					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					dataType : "JSON", //string 으로 리턴하기 때문에 
					success : function(data){
// 						console.log('성공');
						console.log(data);
// 						console.log(data[0]); // FN17050845
// 						console.log(data.length); // 3
						var count = 0;
						for(var i=0;i<data.length;i++){
							var f_chk = data[i];
							if(f_chk != "N"){
								alert("식재 코드 : "+f_chk+"이(가) 이미 업체등록 되있습니다.");
								count++; //카운트를 주어서 중복된 갯수가 없으면 등록할수 있게 if문에 사용
							}else{
								
								//hidden으로 준 체크박스 체크
// 								$("input[name=chk_jung]").prop("checked",true);
							}						
						}
						if(count == 0){
							alert("등록화면으로 넘어갑니다."); // 나중에 주석처리
							ep_chkbox.submit();
						}
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
					}				
				});//ajax 중복체크		
			
				/* alert("선택됐습니다."); */
				
				/* $("input[name=food_chk]:checked").each(function() {
					var test = $(this).val();
					var food_id = $(this).closest("tr").find(".td_id").text();
					var food_name = $(this).closest("tr").find("#td_name").text(); */
// 					var param = "";
// 						if(param == "")
// 							param = "food_id="+id
// 						else param = param + "&food_id"+id
// 						param = param + "&food_name="+name
//						ep_chkbox.submit();
// 					 console.log(food_id);
//				})
			}
		});
		
	});

</script>
<style type="text/css">
.table th{
	text-align:center;
}
.td_chk{	
    width: 15px;
    height: 15px;	
}
</style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<h3>식자재 목록</h3>

<div class="col-md-offset-10"><span style="font-size: 16px;">전체 식재료 수 : ${foodcount}</span></div>
	<div>
	<input class="btn btn-primary" id="ep_submit" type="button" value="발주업체 등록" data-toggle="tooltip" data-placement="bottom" title="발주업체 등록을 위해서는 아래 체크박스를 체크하시고 등록하셔야합니다."/>
		<%-- <a href="${pageContext.request.contextPath}/food_add_form"> --%><button type="button" class="btn btn-primary" id="add_food">식자재 추가</button><!-- </a> -->
	</div>	
	<form class="col-md-offset-10"id="sel_list_sub" name="sel_list_sub" action="${pageContext.request.contextPath}/sel_list" method="get">
		<select class="form-control"id="sel_list" name="sel_list" style="padding-top: 0px; padding-bottom: 0px; height: 30px; width: 230px;">
			<option  value="sel_all" <c:if test="${sel_list eq 'sel_all'}">selected</c:if>>전체보기</option> <!-- 선택된값 select 상태 남기기위한 jstl 적용 -->
			<option value="sel_y" <c:if test="${sel_list eq 'sel_y'}">selected</c:if>>업체 등록 식재료보기</option>
			<option value="sel_n" <c:if test="${sel_list eq 'sel_n'}">selected</c:if>>업체 미등록 식재료보기</option>
		</select>		
	</form>	
	
	<form id="ep_chkbox" action="${pageContext.request.contextPath}/ep_chkbox" method="post">
	
	
		<table class="table table-hover" style="text-align:center">
			<thead>
				<tr style="background:black;color:white;">
					<th><input type="checkbox" id="food_chkall" style=" width: 15px; height: 15px;"/>
						<a href="#">
		         			<span class="glyphicon glyphicon-chevron-down"></span>
		        		</a>
		        	</th>
					<th>번호</th>
					<th>식재코드번호</th>
					<th>상품명</th>					
					<th>단위</th>
					<th>유통기한</th>
					<th>담당자</th>
					<th>등록일자</th>
					<th>수정</th>
				</tr>		
			</thead>
			<tbody>
			
				<c:forEach varStatus="status" var="f" items="${list}">
				
				<tr>
					<td><input class = "td_chk" type="checkbox" name="food_id" value="${f.food_id}"></td>
					<td>${(foodcount-status.index)-((currentPage-1)*pageRow)}</td>
					<td>${f.food_id}</td>
					<td>${f.food_name}</td>
					<td>${f.food_unit}</td>
					<td>제조일로 부터 ${f.food_shelflife}일 까지</td>
					<td>${f.staff_id}</td>
					<td>${f.food_date}</td>
					<td><a href="${pageContext.request.contextPath}/food_modify_view?food_id=${f.food_id}">수정</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<div>
	<center>
	<ul class="pagination pagination-sm" style="text-align: center; width: 300px; margin-left: auto; margin-right: auto;">
		<c:if test="${currentPage > 1}">
			<li><a href="${pageContext.request.contextPath}/food_list?currentPage=${currentPage-1}">이전</a></li>
		</c:if>
		
			<c:if test="${selbox != null && keyWord != null}">
			<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
				<c:choose>
					<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/food_search?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:when>
					<c:otherwise><li><a href="${pageContext.request.contextPath}/food_search?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:otherwise>
				</c:choose>
			</c:forEach>
			</c:if>
			<c:if test="${selbox == null && keyWord == null}">
			<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
				<c:choose>
					<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/food_list?currentPage=${i}">[${i}]</a></li></c:when>
					<c:otherwise><li><a href="${pageContext.request.contextPath}/food_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
				</c:choose>
			</c:forEach>
			</c:if>
			
			
		<c:if test="${currentPage < lastPage}">
			<li><a href="${pageContext.request.contextPath}/food_list?currentPage=${currentPage+1}">다음</a></li>
		</c:if>
	</ul>
	</center>
	</div>
	<div class="in-line">
		<form class="col-sm-3"id ="frm" name="frm" action="${pageContext.request.contextPath}/food_search" method="get" style="padding-right: 1px;width: 354px;">
			<select id="selbox"name="selbox" size="1" style="width: 172px;height: 30.22222px;padding-bottom: 0px;padding-top: 0px;">
				<option value="food_id">식재코드번호</option>
				<option value="food_name">상품명</option>
			</select>
			<input  size="16" name="keyWord" type="text" style="padding-bottom: 4px; padding-top: 6px; height: 31px;">			
		</form>
		<input class="col-sm-1"id="fbutton" type="button" value="검색" style="padding-top: 4.5;padding-bottom: 4.5;padding-top: 4px;padding-bottom: 4px;width: 64px;padding-right: 5px;padding-left: 5px;">
		<div class="alert alert-info alert-dismissable col-sm-offset-6"  style="margin-top: 5px; margin-bottom: 5px; padding-bottom: 5px; padding-top: 5px;">
		  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>도움말 - </strong> 체크박스를 통해 업체등록을 하실수 있습니다. / "전체보기" 선택창을 통해 등록,미등록된 식재료를 확인하실수있습니다.
		</div>
	</div>
	
	
	
</body>
</html>