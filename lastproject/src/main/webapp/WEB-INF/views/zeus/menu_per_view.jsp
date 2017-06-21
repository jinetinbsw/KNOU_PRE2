<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>메뉴 화면</title>
<script type="text/javascript">
	$(document).ready(function(){
			
		$('#fbutton').click(function(){
			
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
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">홍락이짱</a></center></h1>
<h1>메뉴 - ${menu.menu_id} 식재 화면</h1>
<br>
		
		<div>메뉴코드 : <input name ="menu_id" id ="menu_id" type ="text" value="${param.menu_id}" readonly="readonly"/></div>
		<div>메뉴명: <input name ="menu_name" id ="menu_name" type ="text" value="${param.menu_name}" readonly="readonly"/></div>
<table border=1>
		<thead>
			
			<th>식재코드</th>
			<th>상품</th>		
		</thead>
		<tbody>
			<c:forEach varStatus="status" var="f" items="${list}">
			<tr>
						
				<td>${f.food_id}</td>
				<td>${f.food_name}</td>
				<td><a href="${pageContext.request.contextPath}/menu_per_modify?menu_id=${param.menu_id}&food_id=${f.food_id}"><button>추가</button></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>		
	<ul>
		<c:if test="${currentPage > 1}">
			<li><a href="${pageContext.request.contextPath}/menu_per_view?currentPage=${currentPage-1}&menu_id=${param.menu_id}&menu_name=${param.menu_name}">이전</a></li>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<li><a href="${pageContext.request.contextPath}/menu_per_view?currentPage=${currentPage+1}&menu_id=${param.menu_id}&menu_name=${param.menu_name}">다음</a></li>
		</c:if>
	</ul>	
	<form id ="frm" name="frm" action="${pageContext.request.contextPath}/menu_searchz" method="get">
			<select id="selbox"name="selbox" size="1">
				<option value="food_id">식재코드</option>
				<option value="food_name">상품명</option>
			</select>
			<input name="menu_id" value="${param.menu_id}" type="hidden">
			<input name="menu_name" value="${param.menu_name}" type="hidden">
			<input  size="16" name="keyWord" type="text" placeholder="검색해주세요">
			<input id="fbutton" type="submit" value="검색">
		</form>
			<a href="${pageContext.request.contextPath}/menu_list">메뉴 목록</a>
			<td><a href="${pageContext.request.contextPath}/food_add_form?menu_id=${m.menu_id}">식자재 입력 </a></td>
		</div>
	</form>

</body>
</html>