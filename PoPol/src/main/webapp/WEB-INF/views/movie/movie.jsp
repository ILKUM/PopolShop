<!-- 공지사항 jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="role" value="${sessionScope.role}" />

<head>
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

</head>

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->

<style>
.newissue{
	border-bottom: 1px solid #c8c8c8;
	padding-top: 0.7%;
	padding-bottom: 0.7%;
}
</style>

<body>
<script type="text/javascript">
	
$(document).ready(function(){
	//더보기 스타일 변경
	$('#load').mouseover(function(){
		$(this).css("color","#E71D36");
	});
	$('#load').mouseout(function(){
		$(this).css("color","#464a53");
	});
	var temp = 0;
	var moreEventArray = document.querySelectorAll(".card > a > .row ");
	if(moreEventArray.length<=10){
		 $('#load').remove();
         $('#loadPlus').remove();
         $('.tooltip').remove();
	}
	 $(moreEventArray).attr("hidden","hidden");
	 $(moreEventArray).slice(0,10).removeAttr("hidden");
	 $(moreEventArray).slice(0,10);
	 temp = 10;
	$("#load").click(function(e){
		console.log(moreEventArray);
		console.log("if");
		$(moreEventArray).slice(temp,temp+10).removeAttr("hidden");
		 temp +=10;
		if(moreEventArray.length<temp+10){
			$(moreEventArray).slice(temp,10).removeAttr("hidden");
			if(temp-moreEventArray.length>=0){
	            $('#load').remove();
	            $('#loadPlus').remove();
	            $('.tooltip').remove();
	         }

			}
		
			
	}); 
	
	

});
</script>	

    <jsp:include page="/WEB-INF/views/commons/preloader.jsp"></jsp:include>

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <jsp:include page="/WEB-INF/views/commons/headerAndLeft.jsp"></jsp:include>

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
        <div class="card" style="min-height: 1080px">
        	<div class="row">
        	<c:forEach items="${movie}" var="m">
        	<input type="hidden" name="moseq" value="${m.moseq}" id="mos"> 
        	<input type="hidden" name="monum" value="${m.monum}"> 
        	<input type="hidden" name="email" value="${sessionScope.email}" id="moa"> 
			<div class="col-md-4 col-lg-3 ftco-animate fadeInUp ftco-animated" style="padding-left: 30px; padding-top: 15px;">
						
		        			<div class="project">
		        					<div class="img">
		        						<a href="movieDetail.do?moseq=${m.moseq}">
		        						<img src="<c:url value='/user/movie/${m.mophoto}' />" alt="사진" onerror="this.src='https://ssl.pstatic.net/static/movie/2012/09/dft_img99x141.png'" style="width: 150px; height: 213.675px;">
		        						</a>
		        					</div>        					
		        						<div class="text">
		        							<h4>
		        								${m.moname}
		        								</h4>	     								
		        								<h4>${m.modirector}</h4>
		        								<h4>${m.mpoint}P</h4>
		        								<h4><c:out value="${fn:substring(m.modate,0,10)}"/></h4>
												<h6>
		        									<span>추천수 : </span>
		        									${m.molike}
		        									</h6>
		        									</div>
		        									
		        									
		        									
		        			<c:set var="mark" value="true" />
							<c:set var="loop" value="false" />
							<c:forEach items="${jjimlist}" var="jjim">
							<c:if test="${not loop}" />
							<c:if test="${m.moseq == jjim.jseq}">
								<c:set var="mark" value="false" />
								<c:set var="loop" value="true" />
							</c:if>
				         	</c:forEach>
								
							<c:choose>
							<c:when test="${mark}">
							<i class="jjim far fa-heart" id="like" name="likeoff"  style="cursor: pointer; font-size: 20px;"></i>		
							</c:when>
							<c:otherwise>		
							<i class="jjim fas fa-heart" id="like" name="likeon"  style="cursor: pointer; font-size: 20px;"></i>	
							</c:otherwise>
							</c:choose>
		        								
		        			</div>					
		        			</div>
		        			</c:forEach>
		        			<div id="loadPlus" data-toggle="tooltip" data-placement="bottom" title="더 보기" >
			<div id="load" class="iconify" style="font-size: 40px; color:#464a53;cursor: pointer; margin-left: 627px; margin-top: 1%;" data-icon="mdi:chevron-double-down" data-inline="false">더 보기</div>
		        			</div>
							
		        			
							
		        			</div>
		        		
							
		        			
		        			
		        			
		        		
			
            </div>
            </div>
		</div>
		 <script type="text/javascript">
		$(function(){
			$('.jjim').click(function(){
				let like = $(this);
				
				let icon = like.attr('class').split(' ');
				let status = like.attr('name');
				let moseq = like.closest('div.row').children('input[name=moseq]').val();
				let monum = like.closest('div.row').children('input[name=monum]').val();
				

				console.log(icon);
				console.log(status);
				console.log(moseq);
				
				let dat;
				let mark;
				
				$.ajax({
					url : "jjimMovie.do",
					type : "POST",
					data : {"moseq" : moseq, 
							"status" : status,
							"monum" : monum
					       },
					success : function(datadata){
						mark = like.attr('class').split(' ');
						if(status == "likeoff"){
							console.log('likeclass ? ' + like.attr('class'));
							console.log('icon : ' + mark);
							console.log('likeoff if');
							like.removeAttr('name').attr('name', 'likeon');
							like.removeClass(mark[1]+" "+mark[2]).addClass("fas fa-heart");

							Swal.fire({
					    		  title: "찜하기 성공",
					    		  text: "찜하기 성공",
					    		  icon: "success",
					    		  button: "확인"
					    		})
						}else if(status == "likeon"){
							console.log('likeon if');
							like.removeAttr("name").attr("name", "likeoff");
							like.removeClass(mark[1]+" "+mark[2]).addClass("far fa-heart");

							Swal.fire({
					    		  title: "찜하기 취소",
					    		  text: "찜하기 취소",
					    		  icon: "warning",
					    		  button: "확인"
					    		})
						}
						

					},
					error : function(err){
						console.log('error' + err);
						Swal.fire({
				    		  title: "찜하기 중 에러",
				    		  text: "찜하기 중 에러발생",
				    		  icon: "error",
				    		  button: "확인"
				    		})
						return false;
					}
				});
			});
		});
		
		
	</script> 
        	
    
        <!--**********************************
            Content body end
        ***********************************-->

        
  <jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
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
	
</body>

</html>