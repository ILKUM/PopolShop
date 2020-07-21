<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<c:set var="scontent" value="${requestScope.scontent}"/>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
     <!-- Pignose Calender -->
    <link href="<c:url value="/resources/plugins/pg-calendar/css/pignose.calendar.min.css" />" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="<c:url value="/resources/plugins/chartist/css/chartist.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css" />">
    <!-- Custom Stylesheet -->
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<head>
    <script type="text/javascript">
    	$(function(){
    		$("#frm").submit(submitFn);
    	})
    
    	function submitFn(){
    		$.ajax({
    			url : "SendMail",
    			data : {cmd:"disable",id : $("#id").val() , email : $("#email").val(), content : $("#content").val()},
    			success : function(data){
    				console.log(data);
    				if(data=='true'){
    					successAlert("관리자에게 문의메일을 전송했습니다.");
    				}
    				else{
    					errorAlert("메일 발송 실패!");
    				}
    			},
    			error : function(){
    				errorAlert("메일 발송 실패!");
    			}
    		});
    		
    	   	return false;
    	}
    </script>
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
    <!-- Contant -->
    <section class="ftco-section contact-section ftco-no-pb" id="contact-section">
      <div class="container">
      	<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate fadeInUp ftco-animated">
            <span class="subheading font-pen" style="font-size: 30px"><spring:message code="mail.utitle" /></span>
            <h2 class="mt-4 mb-4"><spring:message code="mail.use1" /></h2>
            <p class="font-pen" style="font-size: 30px"><spring:message code="mail.use2" /></p>
          </div>
        </div>

        <div class="row block-9">
          <div class="col-md-7 order-md-last d-flex">
            <form  action="#" class="bg-light p-4 p-md-5 contact-form" id="frm">
              <div class="form-group">
               	<label for="title"><spring:message code="mail.email" /></label> 
                <input type="text" class="form-control" id="id" name="tosend" placeholder="Your Name" value="<spring:message code="moflex" />" disabled="disabled">
              </div>
              <div class="form-group">
              	<label for="content"><spring:message code="mail.mtitle" /></label> 
                <input type="text" class="form-control" id="id" name="mtitle" placeholder="Your Stop" value="${scontent}">
              </div>
              <div class="form-group">
             	 <label for="tohave" style="margin-top: 8px;"><spring:message code="mail.have" /></label>
                <input class="form-control createmodal" type="text" id="tohave" style="width: 100%; border-radius: 0.25rem;" value="${sessionScope.email}" name="tohave"> 
              </div>
              <div class="form-group">
              
                <textarea name="mcontent" id="content" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div>
              <div class="form-group text-right">
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>

          <div class="col-md-5 d-flex">
          	<div class="row d-flex contact-info mb-5">
		          <div class="col-md-12 ftco-animate fadeInUp ftco-animated">
		          	<div class="box p-2 px-3 bg-light d-flex">
		          		<div class="icon mr-3">
		          			<span class="icon-map-signs"></span>
		          		</div>
		          		<div>
			          		<h3 class="mb-3"><spring:message code="admin.ban" /></h3>
				            <p>${scontent}</p>
			            </div>
			          </div>
		          </div>
		         
		          <div class="col-md-12 ftco-animate fadeInUp ftco-animated">
		          	<div class="box p-2 px-3 bg-light d-flex">
		          		<div class="icon mr-3">
		          			<span class="icon-paper-plane"></span>
		          		</div>
		          		<div>
			          		<h3 class="mb-3"><spring:message code="admin.email" /></h3>
				            <p>${sessionScope.email}</p>
			            </div>
			          </div>
		          </div>
		          <div class="col-md-12 ftco-animate fadeInUp ftco-animated">
		          	<div class="box p-2 px-3 bg-light d-flex">
		          		<div class="icon mr-3">
		          			<span class="icon-globe"></span>
		          		</div>
		          		<div>
			          		<h3 class="mb-3">Website</h3>
				            <p><a href="#">www.모플렉스.com</a></p>
			            </div>
			          </div>
		          </div>
		        </div>
          </div>
        </div>
      </div>
    </section>

</body>
 <script src="<c:url value="/resources/plugins/common/common.min.js" />"></script>
    <script src="<c:url value="/resources/js/custom.min.js" />"></script>
    <script src="<c:url value="/resources/js/settings.js" />"></script>
    <script src="<c:url value="/resources/js/gleek.js" />"></script>
    <script src="<c:url value="/resources/js/styleSwitcher.js" />"></script>

    <!-- Chartjs -->
    <script src="<c:url value="/resources/plugins/chart.js/Chart.bundle.min.js" />"></script>
    <!-- Circle progress -->
    <script src="<c:url value="/resources/plugins/circle-progress/circle-progress.min.js" />"></script>
    <!-- Datamap -->
    <script src="<c:url value="/resources/plugins/d3v3/index.js"/>"></script>
    <script src="<c:url value="/resources/plugins/topojson/topojson.min.js"/>"></script>
    <script src="<c:url value="/resources/plugins/datamaps/datamaps.world.min.js"/>"></script>
    <!-- Morrisjs -->
    <script src="<c:url value="/resources/plugins/raphael/raphael.min.js"/>"></script>
    <script src="<c:url value="/resources/plugins/morris/morris.min.js"/>"></script>
    <!-- Pignose Calender -->
    <script src="<c:url value="/resources/plugins/moment/moment.min.js"/>"></script>
    <script src="<c:url value="/resources/plugins/pg-calendar/js/pignose.calendar.min.js"/>"></script>
    <!-- ChartistJS -->
    <script src="<c:url value="/resources/plugins/chartist/js/chartist.min.js"/>"></script>
    <script src="<c:url value="/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"/>"></script>

    <script src="<c:url value="/resources/js/dashboard/dashboard-1.js"/>"></script>

</html>