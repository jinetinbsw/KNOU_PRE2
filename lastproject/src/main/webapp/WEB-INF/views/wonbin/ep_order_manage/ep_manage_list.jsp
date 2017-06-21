<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>업체 목록</title>
<%@ include file="../../modal/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
			
		$('#ebutton').click(function(){
			
			var va = $("#selbox option:selected").val();
			
			var regexp = /\s/g;
			if(va !=null || va != "" || va != regexp){
				
				frm.submit();
			}else{
				/* alert('asd'); */
			}
		});		
	});
</script>
<%-- <%@ include file="../../modal/wide_menu.jsp" %> --%>
<style type="text/css">
	.table th{
	text-align:center;
</style>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<h3>업체 목록</h3>
<div class="col-md-offset-11"><span style="font-size: 16px;">전체 업체 수 : ${ep_mcount}</span></div>
<a href="${pageContext.request.contextPath}/food_list"><button type="button" class="btn btn-primary">식재료 목록</button></a>
	<table class="table table-hover" style="text-align:center">
		<thead>
			<tr>
			<th>번호</th>
			<th>업체 코드 번호</th>
			<th>업체명</th>
			<th>업체 연락처</th>
			<th>업체 담당자</th>
			<th>업체 주소</th>
			<th>비고</th>
			<th>수정</th>
			</tr>			
		</thead>
		<tbody>
			
			<c:forEach varStatus="status" var="e" items="${list}">
			<tr>
				<td>${(ep_mcount-status.index)-((currentPage-1)*pageRow)}</td>
				<td id="ep_id">${e.ep_id}</td>
				<td id="ep_name">${e.ep_name}</td>
				<td id="ep_phone">${e.ep_phone}</td>
				<td id="ep_director">${e.ep_director}</td>
				<td id="ep_address">${e.ep_address}</td>
				<td id="ep_text">${e.ep_text}</td>
				<td><a href="${pageContext.request.contextPath}/ep_manage_modify_view?ep_id=${e.ep_id}"><button>상세보기</button></a></td>
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
	<center><c:if test="${empty list}"><div><h4>등록된 업체가 없습니다.</h4></div></c:if></center>
	<center>
	<ul class="pagination pagination-sm" style="text-align: center; width: 300px; margin-left: auto; margin-right: auto;">
		<c:if test="${currentPage > 1}">
			<li><a href="${pageContext.request.contextPath}/ep_manage_list?currentPage=${currentPage-1}">이전</a></li>
		</c:if>
		
<%-- 			<c:if test="${selbox != null && keyWord != null}"> --%>
<%-- 			<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/ep_msearch?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:when> --%>
<%-- 					<c:otherwise><li><a href="${pageContext.request.contextPath}/ep_msearch?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:otherwise> --%>
<%-- 				</c:choose> --%>
<%-- 			</c:forEach> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${selbox == null && keyWord == null}"> --%>
			<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
				<c:choose>
					<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/ep_manage_list?currentPage=${i}">[${i}]</a></li></c:when>
					<c:otherwise><li><a href="${pageContext.request.contextPath}/ep_manage_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
				</c:choose>
			</c:forEach>
<%-- 			</c:if> --%>
			
			
		<c:if test="${currentPage < lastPage}">
			<li><a href="${pageContext.request.contextPath}/ep_manage_list?currentPage=${currentPage+1}">다음</a></li>
		</c:if>
	</ul>
	</center>
<!-- 	<div> -->
<%-- 		<form id ="frm" name="frm" action="${pageContext.request.contextPath}/ep_msearch" method="get"> --%>
<!-- 			<select id="selbox"name="selbox" size="1"> -->
<!-- 				<option value="ep_name">업체명</option> -->
<!-- 				<option value="food_id">식재코드번호</option> -->
<!-- 			</select> -->
<!-- 			<input  size="16" name="keyWord" type="text"> -->
<!-- 			<input id="ebutton" type="button" value="검색"> -->
<!-- 		</form> -->
<!-- 	</div> -->
	
</body>
</html>