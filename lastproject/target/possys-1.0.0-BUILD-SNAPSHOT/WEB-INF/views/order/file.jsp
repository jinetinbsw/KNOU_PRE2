<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/order_insert" enctype="multipart/form-data">

<input  type="file" id="order_file" name="order_file"> <!-- 이미지 파일 -->
<button type = "submit">업로드</button>
<img src = "${pageContext.request.contextPath}/resources/upload/Chrysanthemum.jpg">
<img src = "${pageContext.request.contextPath}/resources/upload/lemon.jpg">

</form>
</body>
</html>