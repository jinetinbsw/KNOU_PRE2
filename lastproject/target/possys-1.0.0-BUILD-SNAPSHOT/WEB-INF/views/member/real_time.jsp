<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 검색</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>


<style type="text/css">
::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; display:none;}
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url(`./images/bg.png`) #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}

.highlight {
    background-color: #fff34d;
    -moz-border-radius: 2px; /* FF1+ */
    -webkit-border-radius: 2px; /* Saf3-4 */
    border-radius: 2px; /* Opera 10.5, IE 9, Saf5, Chrome */
    -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); /* FF3.5+ */
    -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1); /* Saf3.0+, Chrome */
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); /* Opera 10.5+, IE 9.0 */
}

.highlight {
    padding:1px 1px;
    margin:0 2px;
}

.table4_1 table {
	width:100%;
	margin:15px 0;
	border:0;
	line-height: 1.5;
}
.table4_1 th {
	background-color:#F56E6E;
	color:#FFFFFF
}
.table4_1,.table4_1 th,.table4_1 td {
	font-size:0.95em;
	text-align:center;
	padding:4px;
	border-collapse:collapse;
}
.table4_1 th,.table4_1 td {
	border: 1px solid #f9acac;
	border-width:1px 0 1px 0
}
.table4_1 tr {
	border: 1px solid #f9acac;
}
.table4_1 tr:nth-child(odd){
	background-color:#fbcece;
}
.table4_1 tr:nth-child(even){
	background-color:#fdfdfd;
}

tr{
font-size: 15px;
}  		
</style>

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
   
</head>

<body>

<%@ include file="../modal/header.jsp" %>
 <script>

	 $(document).ready(function () {
		 if($('#tags').val()==""||$('#tags').val()==null){
			 var insert = $('#tags').val();
			 var input ={"insert":insert};
				
			 $.ajax({
	                type:'GET',
					url: "${pageContext.request.contextPath}/E_real_time",
	                dataType: "JSON",
	                data : input,
	                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	                success: function (data) {
	                	
	                	decodeURIComponent( data.member_name );
	                	console.log(insert);
	                	console.log(data);
	                	var member_phone = [];
	                	
	                	
		             for(var i=0; i<data.length; i++){
		                	member_phone.push(data[i]["member_phone"])		
		                	var mp = data[i]["member_phone"];
		             	
		             }
	                	

	                	
	                    $.each(data, function () {
	                    	
	                        $('#tb').append("<tr class = 'test'><td>"
	                        		+ this.member_phone + "</td><td>"
	                        		+ this.member_name  +"</td><td>"
	                        		+ this.member_join  +"</td><td>"
	                        		+ this.member_point +"</td><td>"
	                        		+ this.member_sign + "</td></tr>");
	                    });
	                    $('tr:odd').addClass('table table-striped');
		                },
		                error: function () { alert('에러발생'); }
		        	});
		 		}
			 });
			 
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources//modal/jquery-1.5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources//modal/highlight.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$('#tags').keyup(function(){
			
		var insert = $('#tags').val();
			
		var input ={"insert":insert};
			/* alert(insert); */
			/* 검색어 하이라이트 */
			var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
			
			//하이라이트 주는 부분
			$('#tags').bind('keydown change', function(ev) {
			 var go = $(this).val();

	        // remove any old highlighted terms
	     	 $('body').removeHighlight();

	        // disable highlighting if empty
		        if (go) {
		            // highlight the new term
		            $('table').highlight(go);
		        }    
		        
			});
	        
		if($('#tags').val()!=""){
			$('.test').remove();
			$('.retd').remove();
			/* var insert = $('#tags').val();
			var input ={"insert":insert};
 */			
 		//한글체크 if문 시작
			if(check.test(insert)){
				console.log('한글이 있습니다.');

				$.ajax({
	                type:'GET',
					url: "${pageContext.request.contextPath}/K_real_time",
	                dataType: "JSON",
	                data : input,
	                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	                success: function (data) {
	                	
	                	decodeURIComponent( data.member_name );
	                	console.log(insert);
	                	console.log(data);
	                	var member_phone = [];
	                	
	                	
		             for(var i=0; i<data.length; i++){
		                	member_phone.push(data[i]["member_phone"])		
		                	var mp = data[i]["member_phone"];
		             	
		             }
	                	

	                	
	                    $.each(data, function () {
	                    	
	                        $('#tb').append("<tr class = 'test'><td>"
	                        		+ this.member_phone + "</td><td>"
	                        		+ this.member_name  +"</td><td>"
	                        		+ this.member_join  +"</td><td>"
	                        		+ this.member_point +"</td><td>"
	                        		+ this.member_sign + "</td></tr>");
	                    });
	                    $('tr:odd').addClass('table table-striped');
		                },
		                error: function () { alert('에러발생'); }
		        	});
			
			}else{
				console.log('한글이 없습니다');
			
			
			$.ajax({
                type:'GET',
				url: "${pageContext.request.contextPath}/E_real_time",
                dataType: "JSON",
                data : input,
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                success: function (data) {
                	
                	decodeURIComponent( data.member_name );
                	console.log(insert);
                	console.log(data);
                	var member_phone = [];
                	
                	
	             for(var i=0; i<data.length; i++){
	                	member_phone.push(data[i]["member_phone"])		
	                	var mp = data[i]["member_phone"];
	             	
	             }
                	

                	
                    $.each(data, function () {
                    	
                        $('#tb').append("<tr class = 'test'><td>"
                        		+ this.member_phone + "</td><td>"
                        		+ this.member_name  +"</td><td>"
                        		+ this.member_join  +"</td><td>"
                        		+ this.member_point +"</td><td>"
                        		+ this.member_sign + "</td></tr>");
                    });
                    $('tr:odd').addClass('table table-striped');
	                },
	                error: function () { alert('에러발생'); }
	        	});
		//한글체크 if문 끝
				}
			
			
			
			 }
		//길이가 0이면 작동함
		if(insert.length == 0){
			
			//길이가 0일때 리스트가 계속 생기는걸 방지하기 위하여 remove시킨다.
			$('.test').remove();
			
			//tags의 밸류값이 없으면 기존 리스트를 보여준다.
			 if($('#tags').val()==""||$('#tags').val()==null ){
				
				console.log(insert.length+"<<");
			 var insert = $('#tags').val();
			 var input ={"insert":insert};
				
			 $.ajax({
	                type:'GET',
					url: "${pageContext.request.contextPath}/E_real_time",
	                dataType: "JSON",
	                data : input,
	                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	                success: function (data) {
	                	
	                	decodeURIComponent( data.member_name );
	                	console.log(insert);
	                	console.log(data);
	                	var member_phone = [];
	                	
	                	
		             for(var i=0; i<data.length; i++){
		                	member_phone.push(data[i]["member_phone"])		
		                	var mp = data[i]["member_phone"];
		             	
		             }
	                	

	                	
	                    $.each(data, function () {
	                    	
	                        $('#tb').append("<tr class = 'test'><td>"
	                        		+ this.member_phone + "</td><td>"
	                        		+ this.member_name  +"</td><td>"
	                        		+ this.member_join  +"</td><td>"
	                        		+ this.member_point +"</td><td>"
	                        		+ this.member_sign + "</td></tr>");
	                   
	                    });
	                    $('tr:odd').addClass('table table-striped');
		                },
		                error: function () { alert('에러발생'); }
		        	}); // 값이 없을때 실행되는 ajax 끝
		 		}else{
		 			
		 		}//값이 있나 없나 판단하는 if문 끝
		 		
		}//길이 판단하는 if문
		
	
	
	
	});
	 <!-- 하이라이트 기능 -->
	/*  $('#tags').bind('keyup change', function(ev) {
	        // pull in the new value
	        var searchTerm = $(this).val();

	        // remove any old highlighted terms
	        $('body').removeHighlight();

	        // disable highlighting if empty
	        if ( searchTerm ) {
	            // highlight the new term
	            $('body').highlight( searchTerm );
	        }
	    }); */ 
 });
  </script>
  <div class="container">
<br/>
<br/>
<br/>
<br/>



     <h1>회원 검색</h1>
  <div class="member">전체행의 수 : ${memberCount}</div>
    <label for="tags">검색어를 입력하세요: </label>  
  <input type="text" id="tags" />
  <div style="overflow:scroll; width:100%; height:550px;">
    <table class="table table-striped table4_1"  >
        <thead>
            <tr>
                <th>member_phone</th>
                <th>member_name</th>
                <th>member_point</th>
                <th>member_sign</th>
                <th>member_join</th>
            </tr>
        </thead>
        <tbody id="tb"> 
               <tr> 
                </tr>
        </tbody>

    </table>
    </div>
   <%-- <ul class="pager">
        <c:if test="${currentPage < lastpage}">
            <li class="previous"><a href="${pageContext.request.contextPath}/real_time?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
      
      	<c:forEach var="i" begin="${expage}" end="${lastpage}" step="1">
             <c:choose>
                <c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/real_time?currentPage=${i}"><button class ="bu">${i}</button></a></li></c:when>
                <c:otherwise><li><a href="${pageContext.request.contextPath}/real_time?currentPage=${i}" ><button class ="bu">${i}</button></a></li></c:otherwise>
            </c:choose>

        </c:forEach>
        
        <c:if test="${currentPage > 4}">
            <li class="next"><a href="${pageContext.request.contextPath}/real_time?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul> --%>
     	
  </div>
  
<!--   <select id="selbox">
  <option value="0">선택하세요</option>
  <option value="1">핸드폰</option>
  <option value="2">이름</option>
  </select> -->
  
</body>
</html>