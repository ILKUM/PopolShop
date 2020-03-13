<!-- 새로운 소식 jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
<!-- Favicon icon -->
<!-- Pignose Calender -->
<link
   href="<c:url value="/resources/plugins/pg-calendar/css/pignose.calendar.min.css" />"
   rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet"
   href="<c:url value="/resources/plugins/chartist/css/chartist.min.css" />">
<link rel="stylesheet"
   href="<c:url value="/resources/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css" />">
<!-- Custom Stylesheet -->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	
</script>

<style>
.newissue {
   border-bottom: 1px solid #c8c8c8;
   padding-top: 0.7%;
   padding-bottom: 0.7%;
}
</style>
<body>
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
            <div class="card">
               <div class="row" style="margin-left: 4%;margin-top: 3%">
                  <select id="selectMenu" name="menu" class="nav-item" onchange="changeItem()" style="color: #E71D36; border: 0;font-size: 17px;">
                 	<option value="0" selected="selected" style="color: black">새로운 팀이슈</option>
            	 	<option value="1" style="color: black">새로운 댓글</option>	
            	 	<option value="3" style="color: black">새로운 공지사항</option>
          		  </select>
                  <ul class="nav nav-pills" style="font-size: 17px;">
                    <!--  <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">정렬</a>
                        <div class="dropdown-menu">
                           <a class="dropdown-item" data-toggle="tab" href="#">안읽음</a> <a
                              class="dropdown-item" data-toggle="tab" href="#">읽음</a>
                        </div></li>
                     <li class="nav-item"><a class="nav-link active"
                        data-toggle="tab" href="#">협업 진행률</a></li>
                     <li class="nav-item"><a class="nav-link active"
                        data-toggle="tab" href="#">이슈 업데이트</a></li> -->
                     <li class="nav-item"><a href="mention.do" class="nav-link">@호출됨</a></li>
                     <li class="nav-item"><a href="dowork.do" class="nav-link"><span class="iconify" data-icon="bx:bx-check-circle" data-inline="false"></span>할 일</a></li>
                  </ul>
               </div>
               <hr style="margin-top: 0; margin-left: 4%; margin-right: 4%">
               <div class="row" style="height: 560px;">
						
	<ul class="lst_detail_t1">
					<li>
					<div class="thumb">
								<a href="/movie/bi/mi/basic.nhn?code=189001"><img src="https://movie-phinf.pstatic.net/20200221_216/1582251798358N3QEz_JPEG/movie_image.jpg?type=m99_141_2" alt="인비저블맨" onerror="this.src='https://ssl.pstatic.net/static/movie/2012/09/dft_img99x141.png'"></a><!-- N=a:nol.img,r:1,i:189001 -->
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
			
                  
               <
               <div id="myChartDiv" style="width:100%;height:550px;margin: 5% 0 5% 0;float: right;padding-top:2%;padding-bottom: 2%;border-radius: 0.5rem;">
                 	<!-- 차트 -->
                 	<canvas id="myChart"></canvas>
               </div>
              </div>
             </div>

            </div>
         </div>
      </div>
      <!--**********************************
            Content body end
        ***********************************-->


      <jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>

   </div>
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
   <script
      src="<c:url value="/resources/plugins/chart.js/Chart.bundle.min.js" />"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
   <!-- Circle progress -->
   <script
      src="<c:url value="/resources/plugins/circle-progress/circle-progress.min.js" />"></script>
   <!-- Datamap -->
   <script src="<c:url value="/resources/plugins/d3v3/index.js"/>"></script>
   <script
      src="<c:url value="/resources/plugins/topojson/topojson.min.js"/>"></script>
   <script
      src="<c:url value="/resources/plugins/datamaps/datamaps.world.min.js"/>"></script>
   <!-- Morrisjs -->
   <script
      src="<c:url value="/resources/plugins/raphael/raphael.min.js"/>"></script>
   <script src="<c:url value="/resources/plugins/morris/morris.min.js"/>"></script>
   <!-- Pignose Calender -->
   <script src="<c:url value="/resources/plugins/moment/moment.min.js"/>"></script>
   <script
      src="<c:url value="/resources/plugins/pg-calendar/js/pignose.calendar.min.js"/>"></script>
   <!-- ChartistJS -->
   <script
      src="<c:url value="/resources/plugins/chartist/js/chartist.min.js"/>"></script>
   <script
      src="<c:url value="/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"/>"></script>

   <script src="<c:url value="/resources/js/dashboard/dashboard-1.js"/>"></script>

		
</body>
</html>