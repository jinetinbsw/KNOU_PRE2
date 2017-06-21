<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결제취소검색결과</title>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/bootstrap.min.css">

      <!-- plugins -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/font-awesome.min.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/simple-line-icons.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/fullcalendar.min.css"/>
	<link href="${pageContext.request.contextPath}/resources/asset/css/style.css" rel="stylesheet">
	<!-- end: Css -->

	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/asset/img/logomi.png">
   
<%@ include file="../../modal/header.jsp" %>
<style>
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
	<br><br><br>
	<div class="container">
    <h1>Payment Cancel Search List</h1>
    <div>전체행의 수 : ${paymentCSRcount}</div>
     <br><br>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>결제취소아이디</th>
                <th>결제아이디</th>
                <th>테이블주문번호</th>
                <th>결제취소금액</th>
                <th>결제취소총액</th>
                <th>결제취소일자</th>
                <th>결제취소유형</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="pc" items="${paymentCSRsearch}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_view?payment_cancel_id=${pc.payment_cancel_id}">${pc.payment_cancel_id}</a></td>
                    <td>${pc.payment_id}</td>
                    <td>${pc.table_order_id}</td>
                    <td>${pc.payment_cancel_pay}</td>
                    <td>${pc.payment_cancel_total}</td>
                    <td>${pc.payment_cancel_date}</td>
                    <td>${pc.payment_cate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_search_list?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${select != null && keyWord != null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_search_list?currentPage=${i}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_search_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
        	</c:choose>
        </c:forEach>
        </c:if>
         <c:if test="${select == null && keyWord == null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_search_list?currentPage=${1}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_search_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
        		</c:choose>
        	</c:forEach>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_search_list?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    <div>
        <%-- <a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_cancel_form">결제취소정보입력</a> --%>
        <a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_list" class="btn btn-primary">결제취소목록</a>
 <%--        <a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_search_form" class="btn btn-primary">조건검색</a> --%>
    </div>
    <br><br>
    <div>
    <!-- payment_search_date.jsp를 payment_search_form.jsp로 이름을 변경하였다.
    왜냐하면 form으로 날짜별검색, 카드결제검색 등을 수행하기 위해서 -->
	    <!-- <button class="btn btn-default">카드결제내역이동</button>
		<button class="btn btn-default">결제취소내역확인</button>
		<button class="btn btn-default">조건검색</button> -->
		<%-- <a href="${pageContext.request.contextPath}/tori/payment/payment_card_form?payment_cate=${p.payment_cate}" class="btn btn-default">카드결제내역</a>
		<a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_form?payment_state=${p.payment_state}" class="btn btn-default">결제취소내역</a> --%>
		
    </div>
</div>
</body>
</html>