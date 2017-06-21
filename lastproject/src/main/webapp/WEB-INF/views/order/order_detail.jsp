<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 상세</title>
<%@ include file="../modal/header.jsp" %>
<script>
$(document).ready(function(){
	$('#cancel').click(function() { 
		var result = confirm('주문을 취소 하시겠습니까?');
		var ins = $('#cancel').val();
		var end_ea = parseInt($('.end_ea').text());
		
		
		if(result){
			if(end_ea > 0){
				alert("종결된 메뉴가 존재합니다.");
			}
			else{
			location.replace(ins);
			}
			
		}
		
		else{
			
			return false;
		}

	});
});
</script>
<style>

		.buttons{
		  background: #3498db;
		  background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
		  background-image: -moz-linear-gradient(top, #3498db, #2980b9);
		  background-image: -ms-linear-gradient(top, #3498db, #2980b9);
		  background-image: -o-linear-gradient(top, #3498db, #2980b9);
		  background-image: linear-gradient(to bottom, #3498db, #2980b9);
		  -webkit-border-radius: 28;
		  -moz-border-radius: 28;
		  border-radius: 28px;
		  font-family: Arial;
		  color: #ffffff;
		  font-size: 12px;
		  padding: 5px 7px 5px 7px;
		  text-decoration: none;
	    
	}
	
h1, table { text-align: center; }

table {border-collapse: collapse;  width: 70%; margin: 0 auto 5rem;}

th, td { padding: 1.5rem; font-size: 1.3rem; }

tr {background: hsl(50, 50%, 80%); }

tr, td { transition: .4s ease-in; } 

/* tr:first-child {background: hsla(12, 100%, 40%, 0.5); } */

tr:nth-child(even) { background: hsla(50, 50%, 80%, 0.7); }

td:empty {background: hsla(50, 25%, 60%, 0.7); }

/* tr:hover:not(#firstrow), tr:hover td:empty {background: #ff0; pointer-events: visible;}
tr:hover:not(#firstrow) { transform: scale(1.2); font-weight: 700; box-shadow: 0px 3px 7px rgba(0, 0, 0, 0.5);} */
.f_td {background: hsl(50, 50%, 80%);}
.s_td {background: hsla(50, 25%, 60%, 0.7);}
</style>

</head>
<body>
<div class="container" align="center">
<br/><br/><br/><br/><br/>
		<table id="racetimes">
			<tr>
				<td class = "f_td">주문 번호</td>
				<td class = "f_td">${order.table_order_id}</td>
				<td class = "s_td">테이블 번호</td>
				<td class = "s_td">${order.table_order_num}</td>
				
			</tr>
			<tr>
				<td class = "f_td">주문종결</td>
				<td class = "f_td">${order.table_order_end}</td>
				<td class = "s_td">주문날짜</td>
				<td class = "s_td">${order.table_order_date}</td>
			</tr>
		
		</table>
		
		<table id="racetimes">
					<tr>
						<td class = "f_td" >메뉴코드</td>
						
						<td class = "s_td">메뉴명</td>
						
						<td class = "f_td">수량</td>
						
						<td class = "s_td">소계</td>
						
						<td class = "f_td">종결수</td>
						
						
					</tr>				
		<c:forEach var="f" items="${order_list}">
			<tr>
					
					<td class = "f_td" >${f.menu_id}</td>
					
					<td class = "s_td">${f.menu_name}</td>
					
					<td class = "f_td">${f.order_detail_ea}</td>
					
					<td class = "s_td">${f.order_detail_sum}</td>
					<td class = "f_td end_ea">${f.order_detail_end_ea}</td>
					
			</tr>							
		</c:forEach>
			<tr>
			</tr>
		</table>

<br>
		<div>
			
			<button type = "button" class = "buttons" onclick="location.href = '${pageContext.request.contextPath}/order_list'">목록</button>
			<button type = "button" id = "cancel" class = "buttons" value = '${pageContext.request.contextPath}/order_cancel?table_order_id=${order.table_order_id}' onclick="location.href = '#'">주문취소 처리</button>
		</div>
</div>

</body>
</html>