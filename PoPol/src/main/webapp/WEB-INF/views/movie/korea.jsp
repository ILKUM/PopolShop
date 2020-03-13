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
     
			
			<div class="lst_wrap">
				<ul class="lst_detail_t1">	
				<li>
					<div class="thumb">
								<a href="/movie/bi/mi/basic.nhn?code=189001"><img src="https://movie-phinf.pstatic.net/20200221_216/1582251798358N3QEz_JPEG/movie_image.jpg?type=m99_141_2" alt="인비저블맨" onerror="this.src='https://ssl.pstatic.net/static/movie/2012/09/dft_img99x141.png'"></a>
					</div>
					<dl class="lst_dsc">
					<dt class="tit">				
								<span class="ico_rating_15">15세 관람가</span>					
						<a href="/movie/bi/mi/basic.nhn?code=189001">인비저블맨</a>
						<!-- N=a:nol.title,r:1,i:189001 -->
					</dt>							
					<dd class="star">								
								<dl class="info_star">
									<dt class="tit_t1">네티즌</dt>
									<dd>
										<div class="star_t1">
											<a href="/movie/bi/mi/point.nhn?code=189001#pointAfterTab"><span class="st_off"><span class="st_on" style="width:80.8%"></span></span><span class="num">8.08</span><span class="num2">참여 <em>1,665</em>명</span></a><!-- N=a:nol.urating -->
										</div>					
											<span class="split">|</span>									
									</dd>																					
								</dl>
												<dl class="info_exp">
												<dt class="tit_t1">예매율</dt>
												<dd>
													<div class="star_t1 b_star">
													
														
															<span class="num">21.01</span><span class="txt">%</span>																																									
													</div>
												</dd>
											</dl>
				
					</dd>
					<dd>
						<dl class="info_txt1">
						<dt class="tit_t1">개요</dt>
						<dd>
							<span class="link_txt">
								
									<a href="/movie/sdb/browsing/bmovie.nhn?genre=4">공포</a><!-- N=a:nol.genre,r:1 -->, 
								
									<a href="/movie/sdb/browsing/bmovie.nhn?genre=7">스릴러</a><!-- N=a:nol.genre,r:2 -->
								
							</span>					
								<span class="split">|</span>
								124분
				<span class="split">|</span>
								2020.02.26 개봉
						</dd>
						<dt class="tit_t2">감독</dt>
						<dd>
							<span class="link_txt">
									<a href="/movie/bi/pi/basic.nhn?code=51988">리 워넬</a><!-- N=a:nol.director,r:1 -->
							</span>
						</dd>
						<dt class="tit_t3">출연</dt>
						<dd>
							<span class="link_txt">
									<a href="/movie/bi/pi/basic.nhn?code=21737">엘리자베스 모스</a><!-- N=a:nol.actor,r:1 -->
							</span>
						</dd>
						</dl>
					</dd>
					<dd class="info_t1">
						<div class="btn_area">
								<a href="/movie/bi/mi/reserve.nhn?code=189001" class="btn_rsv">예매하기</a><!-- N=a:nol.ticket,r:1,i:189001 -->
							<span class="btn_t1">
									<a href="/movie/bi/mi/photoView.nhn?code=189001" class="item1">포토보기</a><!-- N=a:nol.photo,r:1,i:189001 -->
									<a href="/movie/bi/mi/mediaView.nhn?code=189001&amp;mid=45394#tab" class="item2">예고편</a><!-- N=a:nol.trailer,r:1,i:189001 -->
									<a href="/movie/bi/mi/mediaView.nhn?code=189001&amp;mid=45455#tab" class="item4">메이킹</a><!-- N=a:nol.making,r:1,i:189001 -->
							</span>
						</div>
					</dd>
					</dl>
				</li>
				</ul>
			</div>
		</div>
	</div>
		
</div>
        
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