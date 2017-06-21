<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 리스트</title>
<%@ include file="../modal/header.jsp" %>
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
		
	})
</script>
<style>
	.pager{
		width : 70%;
		
	}
</style>
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
		.buttons:hover{
		color:black;
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

<br/><br/><br/><br/><br/>
<div class="container" align="center" >
	<table id="racetimes">
		<tbody>
		     <tr>
                <td>주문 코드</td>
                <td>테이블 번호</td>
                <td>상태</td>
                <td>주문일시</td>
                <td>주문수정</td>
                <td>종결처리</td>
                
            </tr>
			<c:forEach var="f" items="${order_list}">
			
			<tr>
				<td><a href="${pageContext.request.contextPath}/order_detail?table_order_id=${f.table_order_id}" >${f.table_order_id}</a></td>
				<td>${f.table_order_num}</td>
				<td>${f.table_order_end}</td>
				<td>${f.table_order_date}</td>
				
				
				<td><a href="${pageContext.request.contextPath}/order_modify_form?table_order_id=${f.table_order_id}">주문수정</a></td>
				<td><a href="${pageContext.request.contextPath}/order_end_t?table_order_id=${f.table_order_id}">종결처리</a></td>
				
				
			</tr>
			</c:forEach>
			<tr>
				<td colspan = '4'>
				    <form class="col-sm-3"id ="frm" name="frm" action="${pageContext.request.contextPath}/order_search_list" method="get" style="padding-right: 1px;width: 354px;">
						<select id="selbox"name="selbox" size="1" style="width: 172px;height: 30.22222px;padding-bottom: 0px;padding-top: 0px;">
							<option value="table_order_num">테이블 번호</option>
							<option value="table_order_date">날짜</option>
						</select>
						<input  size="16" name="keyWord" type="text" style="padding-bottom: 4px; padding-top: 6px; height: 31px;">			
					</form>
				</td>
				<td colspan = '2'>
				<input class = "buttons" id="fbutton" type="button" value="검색" style="padding-top: 4.5;padding-bottom: 4.5;padding-top: 4px;padding-bottom: 4px;">
				</td>
			</tr>
		</tbody>
	</table>
	<br/>
	
	    <ul class="pager">
        <c:if test="${currentPage > 1}">
        
        <li class="previous"><a class = "buttons" href="${pageContext.request.contextPath}/order_list?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${selbox != null && keyWord != null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a class = "buttons" href="${pageContext.request.contextPath}/order_list?currentPage=${i}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a class = "buttons" href="${pageContext.request.contextPath}/order_list?currentPage=${i}">[${i}]</a></li>></c:otherwise>
        	</c:choose>
        </c:forEach>
        </c:if>
        <c:if test="${selbox == null && keyWord == null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a class = "buttons" href="${pageContext.request.contextPath}/order_list?currentPage=${1}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a class = "buttons" href="${pageContext.request.contextPath}/order_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
        		</c:choose>
        	</c:forEach>
        </c:if>
        <c:if test="${currentPage < lastPage}">
        <li class="next"><a class = "buttons" href="${pageContext.request.contextPath}/order_list?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
        
    </ul>
    

	
    
    
		
	
    
    
 </div>
</body>
</html>