<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  
  <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>종합 매출현황</title>

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/animate.min.css"/>
  <link href="${pageContext.request.contextPath}/resources/asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/asset/img/logomi.png">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
</head>

<body id="mimin" class="dashboard">
 <%@ include file="../modal/header.jsp" %>

      <div class="container-fluid mimin-wrapper">
  
        <%@ include file="../modal/left.jsp" %>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	if($('#pbtn').val()=="null"){
		/* alert('조회하실 목록을 선택하세요'); */
		 $('#container').hide(); 
		 $('#C_container').hide();
		 
	}
	$('#pbtn').change(function(){
		
			var pbtn_val = $('#pbtn').val();
			
		//셀렉트 박스가 변할때 선택없음 이면 다 지워라
		if(pbtn_val=="null"){
			 
			 $('#container').hide(); 
			 $('#C_container').hide();
			 
		}else{
			 $('#container').show(); 
			 $('#C_container').show();
			
		}
	var selbox = $('#pbtn').val();
	 /* alert(selbox+'pbtn 실행 확인'); */
	var input ={"selbox":selbox};
	var date = new Array();
	var Ptotal = new Array();
	
	var Mdate = new Array();
	var Mcate = new Array();
	
	var CDate = new Array();
	var CDcate = new Array();
	/* alert('pbtn 실행 확인'); */
	
	//통합매출내역	
	$.ajax({
			type:'GET',
			url:"${pageContext.request.contextPath}/graph",
			async:false,
			data:input,
			dataType:"JSON",
			success:function(data){
					
			
				
				/* 반복문 시작 */
				$.each(data, function(){
				date.push(this.payment_date);
				Ptotal.push(this.payment_total);
				
				/* Ptotal += this.payment_total+",";
				 */
				/* console.log('ajax 내부 each 내부'+date); */
				
				});	
				/*  console.log('ajax 내부 each 외부'+date); */
			}
		});
	//현금결제
	$.ajax({
		type:'GET',
		url:"${pageContext.request.contextPath}/Mcate",
		async:false,
		data:input,
		dataType:"JSON",
		success:function(data){
				
		
			
			/* 반복문 시작 */
			$.each(data, function(){
			Mdate.push(this.payment_date);
			Mcate.push(this.payment_total);
			
			/* console.log('ajax 내부 each 내부'+date); */
			
			});	
			 console.log('Mcate ajax 내부 each 외부'+Mcate+Mdate);
		}
	})
	
				
		//카드결제
		$.ajax({
			type:'GET',
			url:"${pageContext.request.contextPath}/CDcate",
			async:false,
			data:input,
			dataType:"JSON",
			success:function(data){
					
			
				
				/* 반복문 시작 */
				$.each(data, function(){
				CDate.push(this.payment_date);
				CDcate.push(this.payment_total);
				
				/* console.log('ajax 내부 each 내부'+date); */
				
				});	
				 console.log('CDate ajax 내부 each 외부'+CDate+CDcate);
			}
		})
				
					/* console.log('ajax 외부 each 외부'+ date) */
 				Highcharts.chart('container', {
					    chart: {
					        type: 'column',
					        options3d: {
					            enabled: true,
					            alpha: 15,
					            beta: 15,
					            viewDistance: 25,
					            depth: 40
					        }
					    },
					
					    title: {
					        text: '매출 현황 조회(정상 처리)'
					    },
					
					    xAxis: {
					    	
					    	categories:date
					    	
					    	
					    },
					
					    yAxis: {
					        allowDecimals: false,
					        min: 0,
					        title: {
					            text: 'Number of fruits'
					        }
					    },
					
					    tooltip: {
					        headerFormat: '<b>{point.key}</b><br>',
					        pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
					    },
					
					    plotOptions: {
					        column: {
					            stacking: 'normal',
					            depth: 40
					        }
					    },
					
					    series: [{
					        name: '전체 매출액',
					        data:  Ptotal,
					        stack: 'male'
					    
					    },{
					        name: '현금 매출액',
					        data: Mcate,
					        stack: 'male'
					    
					    },{
					        name: '카드 매출액',
					        data: CDcate,
					        stack: 'male'
					    
					    }]
					}); 
	var C_date = new Array();
	var C_Ptotal = new Array();
	
	var C_Mdate = new Array();
	var C_Mcate = new Array();
	
	var C_CDate = new Array();
	var C_CDcate = new Array();
	//통합매출내역(취소)	
	$.ajax({
			type:'GET',
			url:"${pageContext.request.contextPath}/C_graph",
			async:false,
			data:input,
			dataType:"JSON",
			success:function(data){
					
			
				
				/* 반복문 시작 */
				$.each(data, function(){
					C_date.push(this.payment_cancel_date);
					C_Ptotal.push(this.payment_cancel_total);
				
				/* Ptotal += this.payment_total+",";
				 */
				/* console.log('C_ajax 내부 each 내부'+C_date); */
				
				});	
				/*  console.log('ajax 내부 each 외부'+date); */
			}
		});
	//현금결제(취소)
	$.ajax({
		type:'GET',
		url:"${pageContext.request.contextPath}/C_Mcate",
		async:false,
		data:input,
		dataType:"JSON",
		success:function(data){
				
		
			
			/* 반복문 시작 */
			$.each(data, function(){
				C_Mdate.push(this.payment_cancel_date);
				C_Mcate.push(this.payment_cancel_total);
			
			/* console.log('ajax 내부 each 내부'+date); */
			
			});	
			 console.log('C_Mcate ajax 내부 each 외부'+C_Mcate+C_Mdate);
		}
	})
	
				
		//카드결제(취소)
		$.ajax({
			type:'GET',
			url:"${pageContext.request.contextPath}/C_CDcate",
			async:false,
			data:input,
			dataType:"JSON",
			success:function(data){
					
			
				
				/* 반복문 시작 */
				$.each(data, function(){
					C_CDate.push(this.payment_cancel_date);
					C_CDcate.push(this.payment_cancel_total);
				
				/* console.log('ajax 내부 each 내부'+date); */
				
				});	
				 console.log('C_CDate ajax 내부 each 외부'+C_CDate+C_CDcate);
			}
		})					
				//취소 결제내역 그래프
				Highcharts.chart('C_container', {
				    chart: {
				        type: 'column',
				        options3d: {
				            enabled: true,
				            alpha: 15,
				            beta: 15,
				            viewDistance: 25,
				            depth: 40
				        }
				    },
				
				    title: {
				        text: '매출 현황 조회(취소 처리)'
				    },
				
				    xAxis: {
				    	
				    	categories:C_date
				    	
				    	
				    },
				
				    yAxis: {
				        allowDecimals: false,
				        min: 0,
				        title: {
				            text: 'Number of fruits'
				        }
				    },
				
				    tooltip: {
				        headerFormat: '<b>{point.key}</b><br>',
				        pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
				    },
				
				    plotOptions: {
				        column: {
				            stacking: 'normal',
				            depth: 40
				        }
				    },
				
				    series: [{
				        name: '전체 취소내역',
				        data:  C_Ptotal,
				        stack: 'male'
				    
				    },{
				        name: '현금 취소내역',
				        data: C_Mcate,
				        stack: 'male'
				    
				    },{
				        name: '카드 취소내역',
				        data: C_CDcate,
				        stack: 'male'
				    
				    }]
				});
				

								
			});
	});
</script>
          <!-- start: Content -->
      		<div id="content">
            <div class="col-md-12 padding-0" style="margin-top:20px;">

              <div class="col-md-12 padding-0">
                 <div class="col-md-6">
                    <div class="col-md-12">
                      <div class="panel chart-title">
                        <h3><span class="fa fa-pie-chart"></span> 종합 매출현황</h3>
                     
                      </div>
                     <!--   <div class="panel">
                           <div class="panel-heading panel-heading-white text-center">
                             <h4>Doughnut Chart</h4>
                            </div>
                            <div class="panel-body">
                               <div id="doughnut-chart"></div>
                            </div>
					        </div>   -->

                 
                    </div>
                     
                     <!--   <div class="panel">
                           <div class="panel-heading panel-heading-white text-center">
                             <h4>Doughnut Chart</h4>
                            </div>
                            <div class="panel-body">
                               <div id="doughnut-chart"></div>
                            </div>
                      </div>   -->
                       <div class="col-md-12">
	                      <div class="col-md-12">
	                        <div class="panel">
	                             <div class="panel-heading panel-heading-white text-center">
	                                <h4>Line Chart</h4>
	                              </div>
	                              <div class="panel-body">                              
	                                  <div id="container" style="width:100%; height:100%;"></div>
	                                  <!-- <div id="line-chart"></div> -->
	                              </div>
	                        </div>
	                    </div>
	                    
                    </div>
                    <div class="col-md-12">
<!--                           <div class="panel">
                             <div class="panel-heading panel-heading-white text-center">
                              <h4>Area Chart</h4>
                              </div>
                              <div class="panel-body">
                                  <div id="area-chart"></div>
                                  <div id="C_container" style="width:100%; height:100%;"></div>
                                  
                                  
                              </div>
                        </div> -->
                    
                    
                    </div>
                 </div>
                 <div class="col-md-6">
         
         
          <!--  <div class="col-md-12">
                        <div class="panel" style="padding:15px;">
                             <div class="panel-heading panel-heading-white text-center">
                                <h4>Bar Chart</h4>
                              </div>
                              <div class="panel-body">
                                  <div id="bar-chart"></div>
                              </div>
                        </div> 
                    </div> -->
                    
<!--                     <div class="col-md-12">
                        <div class="panel">
                             <div class="panel-heading panel-heading-white text-center">
                                <h4>Line Chart</h4>
                              </div>
                              <div class="panel-body">                              
                                  <div id="container" style="width:100%; height:100%;"></div>
                                  <div id="line-chart"></div>
                              </div>
                        </div>
                    </div> -->
                 <div class="panel chart-title">
                        <b><span style="color: red">셀렉트 박스를 선택하세요</span></b>
                        </br>
                        
                      	<select id="pbtn">
						<option value="null">선택하세요</option>
						<option value="%Y-%m-%d">일자별 조회</option>
						<option value="%Y-%m">월별 조회</option>
						<option value="%Y">연도별 조회</option>
						</select>
                      </div>
                                         <div class="panel">
                             <div class="panel-heading panel-heading-white text-center">
                              <h4>Area Chart</h4>
                              </div>
                              <div class="panel-body">
                                  <!-- <div id="area-chart"></div> -->
                                  <div id="C_container" style="width:100%; height:100%;"></div>           
                              </div>
                        </div>
                 </div>
              </div>
            </div>
      		</div>
          <!-- end: Content -->

          <!-- start: right menu -->
            <div id="right-menu">
              <ul class="nav nav-tabs">
                <li class="active">
                 <a data-toggle="tab" href="#right-menu-user">
                  <span class="fa fa-comment-o fa-2x"></span>
                 </a>
                </li>
                <li>
                 <a data-toggle="tab" href="#right-menu-notif">
                  <span class="fa fa-bell-o fa-2x"></span>
                 </a>
                </li>
                <li>
                  <a data-toggle="tab" href="#right-menu-config">
                   <span class="fa fa-cog fa-2x"></span>
                  </a>
                 </li>
              </ul>

              <div class="tab-content">
                <div id="right-menu-user" class="tab-pane fade in active">
                  <div class="search col-md-12">
                    <input type="text" placeholder="search.."/>
                  </div>
                  <div class="user col-md-12">
                   <ul class="nav nav-list">
                    <li class="online">
                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                      <div class="name">
                        <h5><b>Bill Gates</b></h5>
                        <p>Hi there.?</p>
                      </div>
                      <div class="gadget">
                        <span class="fa  fa-mobile-phone fa-2x"></span> 
                      </div>
                      <div class="dot"></div>
                    </li>
                    <li class="away">
                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                      <div class="name">
                        <h5><b>Bill Gates</b></h5>
                        <p>Hi there.?</p>
                      </div>
                      <div class="gadget">
                        <span class="fa  fa-desktop"></span> 
                      </div>
                      <div class="dot"></div>
                    </li>
                    <li class="offline">
                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                      <div class="name">
                        <h5><b>Bill Gates</b></h5>
                        <p>Hi there.?</p>
                      </div>
                      <div class="dot"></div>
                    </li>
                    <li class="offline">
                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                      <div class="name">
                        <h5><b>Bill Gates</b></h5>
                        <p>Hi there.?</p>
                      </div>
                      <div class="dot"></div>
                    </li>
                    <li class="online">
                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                      <div class="name">
                        <h5><b>Bill Gates</b></h5>
                        <p>Hi there.?</p>
                      </div>
                      <div class="gadget">
                        <span class="fa  fa-mobile-phone fa-2x"></span> 
                      </div>
                      <div class="dot"></div>
                    </li>
                    <li class="offline">
                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                      <div class="name">
                        <h5><b>Bill Gates</b></h5>
                        <p>Hi there.?</p>
                      </div>
                      <div class="dot"></div>
                    </li>
                    <li class="online">
                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                      <div class="name">
                        <h5><b>Bill Gates</b></h5>
                        <p>Hi there.?</p>
                      </div>
                      <div class="gadget">
                        <span class="fa  fa-mobile-phone fa-2x"></span> 
                      </div>
                      <div class="dot"></div>
                    </li>
                    <li class="offline">
                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                      <div class="name">
                        <h5><b>Bill Gates</b></h5>
                        <p>Hi there.?</p>
                      </div>
                      <div class="dot"></div>
                    </li>
                    <li class="offline">
                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                      <div class="name">
                        <h5><b>Bill Gates</b></h5>
                        <p>Hi there.?</p>
                      </div>
                      <div class="dot"></div>
                    </li>
                    <li class="online">
                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                      <div class="name">
                        <h5><b>Bill Gates</b></h5>
                        <p>Hi there.?</p>
                      </div>
                      <div class="gadget">
                        <span class="fa  fa-mobile-phone fa-2x"></span> 
                      </div>
                      <div class="dot"></div>
                    </li>
                    <li class="online">
                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                      <div class="name">
                        <h5><b>Bill Gates</b></h5>
                        <p>Hi there.?</p>
                      </div>
                      <div class="gadget">
                        <span class="fa  fa-mobile-phone fa-2x"></span> 
                      </div>
                      <div class="dot"></div>
                    </li>

                  </ul>
                </div>
                <!-- Chatbox -->
                <div class="col-md-12 chatbox">
                  <div class="col-md-12">
                    <a href="#" class="close-chat">X</a><h4>Akihiko Avaron</h4>
                  </div>
                  <div class="chat-area">
                    <div class="chat-area-content">
                      <div class="msg_container_base">
                        <div class="row msg_container send">
                          <div class="col-md-9 col-xs-9 bubble">
                            <div class="messages msg_sent">
                              <p>that mongodb thing looks good, huh?
                                tiny master db, and huge document store</p>
                                <time datetime="2009-11-13T20:00">Timothy â¢ 51 min</time>
                              </div>
                            </div>
                            <div class="col-md-3 col-xs-3 avatar">
                              <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" class=" img-responsive " alt="user name">
                            </div>
                          </div>

                          <div class="row msg_container receive">
                            <div class="col-md-3 col-xs-3 avatar">
                              <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" class=" img-responsive " alt="user name">
                            </div>
                            <div class="col-md-9 col-xs-9 bubble">
                              <div class="messages msg_receive">
                                <p>that mongodb thing looks good, huh?
                                  tiny master db, and huge document store</p>
                                  <time datetime="2009-11-13T20:00">Timothy â¢ 51 min</time>
                                </div>
                              </div>
                            </div>

                            <div class="row msg_container send">
                              <div class="col-md-9 col-xs-9 bubble">
                                <div class="messages msg_sent">
                                  <p>that mongodb thing looks good, huh?
                                    tiny master db, and huge document store</p>
                                    <time datetime="2009-11-13T20:00">Timothy â¢ 51 min</time>
                                  </div>
                                </div>
                                <div class="col-md-3 col-xs-3 avatar">
                                  <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" class=" img-responsive " alt="user name">
                                </div>
                              </div>

                              <div class="row msg_container receive">
                                <div class="col-md-3 col-xs-3 avatar">
                                  <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" class=" img-responsive " alt="user name">
                                </div>
                                <div class="col-md-9 col-xs-9 bubble">
                                  <div class="messages msg_receive">
                                    <p>that mongodb thing looks good, huh?
                                      tiny master db, and huge document store</p>
                                      <time datetime="2009-11-13T20:00">Timothy â¢ 51 min</time>
                                    </div>
                                  </div>
                                </div>

                                <div class="row msg_container send">
                                  <div class="col-md-9 col-xs-9 bubble">
                                    <div class="messages msg_sent">
                                      <p>that mongodb thing looks good, huh?
                                        tiny master db, and huge document store</p>
                                        <time datetime="2009-11-13T20:00">Timothy â¢ 51 min</time>
                                      </div>
                                    </div>
                                    <div class="col-md-3 col-xs-3 avatar">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" class=" img-responsive " alt="user name">
                                    </div>
                                  </div>

                                  <div class="row msg_container receive">
                                    <div class="col-md-3 col-xs-3 avatar">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" class=" img-responsive " alt="user name">
                                    </div>
                                    <div class="col-md-9 col-xs-9 bubble">
                                      <div class="messages msg_receive">
                                        <p>that mongodb thing looks good, huh?
                                          tiny master db, and huge document store</p>
                                          <time datetime="2009-11-13T20:00">Timothy â¢ 51 min</time>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="chat-input">
                                <textarea placeholder="type your message here.."></textarea>
                              </div>
                              <div class="user-list">
                                <ul>
                                  <li class="online">
                                    <a href=""  data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <div class="user-avatar"><img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name"></div>
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                  <li class="offline">
                                    <a href="" data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                  <li class="away">
                                    <a href="" data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                  <li class="online">
                                    <a href="" data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                  <li class="offline">
                                    <a href="" data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                  <li class="away">
                                    <a href="" data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                  <li class="offline">
                                    <a href="" data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                  <li class="offline">
                                    <a href="" data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                  <li class="away">
                                    <a href="" data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                  <li class="online">
                                    <a href="" data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                  <li class="away">
                                    <a href="" data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                  <li class="away">
                                    <a href="" data-toggle="tooltip" data-placement="left" title="Akihiko avaron">
                                      <img src="${pageContext.request.contextPath}/resources/asset/img/avatar.jpg" alt="user name">
                                      <div class="dot"></div>
                                    </a>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                          <div id="right-menu-notif" class="tab-pane fade">

                            <ul class="mini-timeline">
                              <li class="mini-timeline-highlight">
                               <div class="mini-timeline-panel">
                                <h5 class="time">07:00</h5>
                                <p>Coding!!</p>
                              </div>
                            </li>

                            <li class="mini-timeline-highlight">
                             <div class="mini-timeline-panel">
                              <h5 class="time">09:00</h5>
                              <p>Playing The Games</p>
                            </div>
                          </li>
                          <li class="mini-timeline-highlight">
                           <div class="mini-timeline-panel">
                            <h5 class="time">12:00</h5>
                            <p>Meeting with <a href="#">Clients</a></p>
                          </div>
                        </li>
                        <li class="mini-timeline-highlight mini-timeline-warning">
                         <div class="mini-timeline-panel">
                          <h5 class="time">15:00</h5>
                          <p>Breakdown the Personal PC</p>
                        </div>
                      </li>
                      <li class="mini-timeline-highlight mini-timeline-info">
                       <div class="mini-timeline-panel">
                        <h5 class="time">15:00</h5>
                        <p>Checking Server!</p>
                      </div>
                    </li>
                    <li class="mini-timeline-highlight mini-timeline-success">
                      <div class="mini-timeline-panel">
                        <h5 class="time">16:01</h5>
                        <p>Hacking The public wifi</p>
                      </div>
                    </li>
                    <li class="mini-timeline-highlight mini-timeline-danger">
                      <div class="mini-timeline-panel">
                        <h5 class="time">21:00</h5>
                        <p>Sleep!</p>
                      </div>
                    </li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                  </ul>

                </div>
                <div id="right-menu-config" class="tab-pane fade">
                  <div class="col-md-12">
                    <div class="col-md-6 padding-0">
                      <h5>Notification</h5>
                    </div>
                    <div class="col-md-6">
                      <div class="mini-onoffswitch onoffswitch-info">
                        <input type="checkbox" name="onoffswitch2" class="onoffswitch-checkbox" id="myonoffswitch1" checked>
                        <label class="onoffswitch-label" for="myonoffswitch1"></label>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="col-md-6 padding-0">
                      <h5>Custom Designer</h5>
                    </div>
                    <div class="col-md-6">
                      <div class="mini-onoffswitch onoffswitch-danger">
                        <input type="checkbox" name="onoffswitch2" class="onoffswitch-checkbox" id="myonoffswitch2" checked>
                        <label class="onoffswitch-label" for="myonoffswitch2"></label>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="col-md-6 padding-0">
                      <h5>Autologin</h5>
                    </div>
                    <div class="col-md-6">
                      <div class="mini-onoffswitch onoffswitch-success">
                        <input type="checkbox" name="onoffswitch2" class="onoffswitch-checkbox" id="myonoffswitch3" checked>
                        <label class="onoffswitch-label" for="myonoffswitch3"></label>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="col-md-6 padding-0">
                      <h5>Auto Hacking</h5>
                    </div>
                    <div class="col-md-6">
                      <div class="mini-onoffswitch onoffswitch-warning">
                        <input type="checkbox" name="onoffswitch2" class="onoffswitch-checkbox" id="myonoffswitch4" checked>
                        <label class="onoffswitch-label" for="myonoffswitch4"></label>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="col-md-6 padding-0">
                      <h5>Auto locking</h5>
                    </div>
                    <div class="col-md-6">
                      <div class="mini-onoffswitch">
                        <input type="checkbox" name="onoffswitch2" class="onoffswitch-checkbox" id="myonoffswitch5" checked>
                        <label class="onoffswitch-label" for="myonoffswitch5"></label>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="col-md-6 padding-0">
                      <h5>FireWall</h5>
                    </div>
                    <div class="col-md-6">
                      <div class="mini-onoffswitch">
                        <input type="checkbox" name="onoffswitch2" class="onoffswitch-checkbox" id="myonoffswitch6" checked>
                        <label class="onoffswitch-label" for="myonoffswitch6"></label>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="col-md-6 padding-0">
                      <h5>CSRF Max</h5>
                    </div>
                    <div class="col-md-6">
                      <div class="mini-onoffswitch onoffswitch-warning">
                        <input type="checkbox" name="onoffswitch2" class="onoffswitch-checkbox" id="myonoffswitch7" checked>
                        <label class="onoffswitch-label" for="myonoffswitch7"></label>
                      </div>
                    </div>
                  </div>


                  <div class="col-md-12">
                    <div class="col-md-6 padding-0">
                      <h5>Man In The Middle</h5>
                    </div>
                    <div class="col-md-6">
                      <div class="mini-onoffswitch onoffswitch-danger">
                        <input type="checkbox" name="onoffswitch2" class="onoffswitch-checkbox" id="myonoffswitch8" checked>
                        <label class="onoffswitch-label" for="myonoffswitch8"></label>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <div class="col-md-6 padding-0">
                      <h5>Auto Repair</h5>
                    </div>
                    <div class="col-md-6">
                      <div class="mini-onoffswitch onoffswitch-success">
                        <input type="checkbox" name="onoffswitch2" class="onoffswitch-checkbox" id="myonoffswitch9" checked>
                        <label class="onoffswitch-label" for="myonoffswitch9"></label>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-12">
                    <input type="button" value="More.." class="btnmore">
                  </div>

                </div>
              </div>
            </div>  
          <!-- end: right menu -->
          
      </div>

      <!-- start: Mobile -->
      <div id="mimin-mobile" class="reverse">
        <div class="mimin-mobile-menu-list">
            <div class="col-md-12 sub-mimin-mobile-menu-list animated fadeInLeft">
                <ul class="nav nav-list">
                    <li class="active ripple">
                      <a class="tree-toggle nav-header">
                        <span class="fa-home fa"></span>Dashboard 
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                      <ul class="nav nav-list tree">
                          <li><a href="dashboard-v1.html">Dashboard v.1</a></li>
                          <li><a href="dashboard-v2.html">Dashboard v.2</a></li>
                      </ul>
                    </li>
                    <li class="ripple">
                      <a class="tree-toggle nav-header">
                        <span class="fa-diamond fa"></span>Layout
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                      <ul class="nav nav-list tree">
                        <li><a href="topnav.html">Top Navigation</a></li>
                        <li><a href="boxed.html">Boxed</a></li>
                      </ul>
                    </li>
                    <li class="ripple">
                      <a class="tree-toggle nav-header">
                        <span class="fa-area-chart fa"></span>Charts
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                      <ul class="nav nav-list tree">
                        <li><a href="chartjs.html">ChartJs</a></li>
                        <li><a href="morris.html">Morris</a></li>
                        <li><a href="flot.html">Flot</a></li>
                        <li><a href="sparkline.html">SparkLine</a></li>
                      </ul>
                    </li>
                    <li class="ripple">
                      <a class="tree-toggle nav-header">
                        <span class="fa fa-pencil-square"></span>Ui Elements
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                      <ul class="nav nav-list tree">
                        <li><a href="color.html">Color</a></li>
                        <li><a href="weather.html">Weather</a></li>
                        <li><a href="typography.html">Typography</a></li>
                        <li><a href="icons.html">Icons</a></li>
                        <li><a href="buttons.html">Buttons</a></li>
                        <li><a href="media.html">Media</a></li>
                        <li><a href="panels.html">Panels & Tabs</a></li>
                        <li><a href="notifications.html">Notifications & Tooltip</a></li>
                        <li><a href="badges.html">Badges & Label</a></li>
                        <li><a href="progress.html">Progress</a></li>
                        <li><a href="sliders.html">Sliders</a></li>
                        <li><a href="timeline.html">Timeline</a></li>
                        <li><a href="modal.html">Modals</a></li>
                      </ul>
                    </li>
                    <li class="ripple">
                      <a class="tree-toggle nav-header">
                       <span class="fa fa-check-square-o"></span>Forms
                       <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                      <ul class="nav nav-list tree">
                        <li><a href="formelement.html">Form Element</a></li>
                        <li><a href="#">Wizard</a></li>
                        <li><a href="#">File Upload</a></li>
                        <li><a href="#">Text Editor</a></li>
                      </ul>
                    </li>
                    <li class="ripple">
                      <a class="tree-toggle nav-header">
                        <span class="fa fa-table"></span>Tables
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                      <ul class="nav nav-list tree">
                        <li><a href="datatables.html">Data Tables</a></li>
                        <li><a href="handsontable.html">handsontable</a></li>
                        <li><a href="tablestatic.html">Static</a></li>
                      </ul>
                    </li>
                    <li class="ripple">
                      <a href="calendar.html">
                         <span class="fa fa-calendar-o"></span>Calendar
                      </a>
                    </li>
                    <li class="ripple">
                      <a class="tree-toggle nav-header">
                        <span class="fa fa-envelope-o"></span>Mail
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                      <ul class="nav nav-list tree">
                        <li><a href="mail-box.html">Inbox</a></li>
                        <li><a href="compose-mail.html">Compose Mail</a></li>
                        <li><a href="view-mail.html">View Mail</a></li>
                      </ul>
                    </li>
                    <li class="ripple">
                      <a class="tree-toggle nav-header">
                        <span class="fa fa-file-code-o"></span>Pages
                        <span class="fa-angle-right fa right-arrow text-right"></span>
                      </a>
                      <ul class="nav nav-list tree">
                        <li><a href="forgotpass.html">Forgot Password</a></li>
                        <li><a href="login.html">SignIn</a></li>
                        <li><a href="reg.html">SignUp</a></li>
                        <li><a href="article-v1.html">Article v1</a></li>
                        <li><a href="search-v1.html">Search Result v1</a></li>
                        <li><a href="productgrid.html">Product Grid</a></li>
                        <li><a href="profile-v1.html">Profile v1</a></li>
                        <li><a href="invoice-v1.html">Invoice v1</a></li>
                      </ul>
                    </li>
                     <li class="ripple"><a class="tree-toggle nav-header"><span class="fa "></span> MultiLevel  <span class="fa-angle-right fa right-arrow text-right"></span> </a>
                      <ul class="nav nav-list tree">
                        <li><a href="view-mail.html">Level 1</a></li>
                        <li><a href="view-mail.html">Level 1</a></li>
                        <li class="ripple">
                          <a class="sub-tree-toggle nav-header">
                            <span class="fa fa-envelope-o"></span> Level 1
                            <span class="fa-angle-right fa right-arrow text-right"></span>
                          </a>
                          <ul class="nav nav-list sub-tree">
                            <li><a href="mail-box.html">Level 2</a></li>
                            <li><a href="compose-mail.html">Level 2</a></li>
                            <li><a href="view-mail.html">Level 2</a></li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li><a href="credits.html">Credits</a></li>
                  </ul>
            </div>
        </div>       
      </div>
      <button id="mimin-mobile-menu-opener" class="animated rubberBand btn btn-circle btn-danger">
        <span class="fa fa-bars"></span>
      </button>
       <!-- end: Mobile -->

    <!-- start: Javascript -->
    <script src="${pageContext.request.contextPath}/resources/asset/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/asset/js/jquery.ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/asset/js/bootstrap.min.js"></script>
   
    
    <!-- plugins -->
    <script src="${pageContext.request.contextPath}/resources/asset/js/plugins/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/asset/js/plugins/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/asset/js/plugins/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/asset/js/plugins/jquery.nicescroll.js"></script>


    <!-- custom -->
     <script src="${pageContext.request.contextPath}/resources/asset/js/main.js"></script>
     <script type="text/javascript">
      (function(jQuery){
          Morris.Area({
            element: 'area-chart',
            data: [
               { y: '2006', a: 25, b: 20 },
               { y: '2007', a: 50,  b: 45 },
               { y: '2008', a: 75,  b: 70 },
               { y: '2009', a: 50,  b: 40 },
               { y: '2010', a: 75,  b: 70 },
               { y: '2011', a: 50,  b: 45 },
               { y: '2012', a: 25, b: 20 }
            ],
            xkey: 'y',
            ykeys: ['a', 'b'],
            labels: ['Series A', 'Series B'],
            lineColors: ['#444','#6C76FF']
          });

          Morris.Line({
              element: 'line-chart',
              data: [
                { y: '2006', a: 25, b: 20 },
                { y: '2007', a: 50,  b: 45 },
                { y: '2008', a: 75,  b: 70 },
                { y: '2009', a: 50,  b: 40 },
                { y: '2010', a: 75,  b: 70 },
                { y: '2011', a: 50,  b: 45 },
                { y: '2012', a: 25, b: 20 }
              ],
              xkey: 'y',
              ykeys: ['a', 'b'],
              labels: ['Series A', 'Series B'],
              lineColors: ['#6C76FF','#ddd']
            });
            
            Morris.Donut({
              element: 'doughnut-chart',
              data: [
                {value: 70, label: 'foo'},
                {value: 15, label: 'bar'},
                {value: 10, label: 'baz'},
                {value: 5, label: 'A really really long label'}
              ],
              colors:['#FF3835','#515151','#6C76FF','#ddd'],
              formatter: function (x) { return x + "%"}
            }).on('click', function(i, row){
              console.log(i, row);
            });

            Morris.Bar({
              element: 'bar-chart',
              data: [
                {x: '2011 Q1', y: 3, z: 2, a: 3},
                {x: '2011 Q2', y: 2, z: null, a: 1},
                {x: '2011 Q3', y: 0, z: 2, a: 4},
                {x: '2011 Q4', y: 2, z: 4, a: 3}
              ],
              xkey: 'x',
              ykeys: ['y', 'z', 'a'],
              labels: ['Buyer', 'Creditor', 'Investor'],
              barColors: ['#FF3835','#515151','#6C76FF']
            }).on('click', function(i, row){
              console.log(i, row);
            });

        })(jQuery);
     </script>
  <!-- end: Javascript -->
  </body>
</html>