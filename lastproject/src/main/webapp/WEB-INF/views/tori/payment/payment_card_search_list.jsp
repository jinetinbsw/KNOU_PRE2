<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>카드결제검색결과</title>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
Optional theme
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> -->
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

<%-- <%@ include file="../../modal/wide_menu.jsp" %> --%>
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
    <h1>Payment Card Search List</h1>
    <div>전체행의 수 : ${CPScount}</div>
     <br><br>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>승인번호</th>
                <th>결제번호</th>
                <th>승인구분</th>
                <th>결제일자</th>
                <th>카드사</th>
                <th>카드공급대가</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cp" items="${CPSlist}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/tori/payment/payment_card_view?card_id=${cp.card_id}">${cp.card_id}</a></td>
                    <td>${cp.payment_id}</td>
                    <td>${cp.card_app}</td>
                    <td>${cp.card_date}</td>
                    <td>${cp.card_company}</td>
                    <td>${cp.card_total}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/tori/payment/payment_card_search_list?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${select != null && keyWord != null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/tori/payment/payment_card_search_list?currentPage=${i}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/tori/payment/payment_card_search_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
        	</c:choose>
        </c:forEach>
        </c:if>
         <c:if test="${select == null && keyWord == null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/tori/payment/payment_card_search_list?currentPage=${1}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/tori/payment/payment_card_search_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
        		</c:choose>
        	</c:forEach>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/tori/payment/payment_card_search_list?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    <div>
        <%-- <a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_add_form">카드거래입력</a> --%>
        <a href="${pageContext.request.contextPath}/tori/payment/payment_card_list" class="btn btn-primary">카드거래목록</a>
        <%-- <a href="${pageContext.request.contextPath}/tori/payment/payment_card_search_form" class="btn btn-primary">조건검색</a> --%>
    </div>
    <br><br>
</div>
</body>
</html>