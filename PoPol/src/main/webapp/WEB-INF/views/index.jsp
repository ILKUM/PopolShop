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
						<div class="col-sm-7"
							style="margin: 0 0 0 3% ; border-radius: 0.5rem;">
							<div class="row" style="margin-left: 2%; margin-right: 2%" id="ialarm">
							<div class="col-sm-3 newissue" id="al"><p><b>협업공간</b></p></div>
							<div class="col-sm-4 newissue" id="ti"><p><b>제목</b></p></div>
							<div class="col-sm-2 newissue" id="ti"><p><b>작성자</b></p></div>
							<div class="col-sm-3 newissue" id="day"><p><b>작성시간</b></p></div>
							</div>
		<c:if test="${mypjtlist =='[]'}">
			<div class="row countRow" style="margin-left: 2%; margin-right: 2%" id="ialarm">
			<div class="col-sm-12 newissue" id="al">
			<img src= '<c:url value="/resources/images/logo/ScoopBig.png"/>' style="width: 60px;padding-right: 5px;">
				아직 이슈를 작성안하셨군요? 협업공간에서 새로운 이슈를 작성해 보세요 ^ㅁ^!
			</div>
			</div>
		</c:if>
	 <c:if test="${mytissuelist !=null }">
      <c:forEach items="${mytissuelist }" var="mynewtissue">
      
      <div class="row countRow" style="margin-left: 2%; margin-right: 2%" id="ialarm">
		
         <div class="col-sm-3 newissue" id="al">
         
         <p>
         	<c:if test="${fn:length(mynewtissue.pname) > 8}">
         	<a href="projectDetail.do?tseq=${mynewtissue.tseq }"><c:out value="${fn:substring(mynewtissue.pname,0,8)}"/>...</a>
         	</c:if>
         	<c:if test="${fn:length(mynewtissue.pname) <= 8}">
         	<a href="projectDetail.do?tseq=${mynewtissue.tseq }"><c:out value="${fn:substring(mynewtissue.pname,0,8)}"/></a>
         	</c:if>
         	</p>
         	
         </div>
         <div class="col-sm-4 newissue" id="ti">
         
        <p>
         	<c:if test="${fn:length(mynewtissue.tititle) > 16}">
         	<a href="teamissueDetail.do?tiseq=${mynewtissue.tiseq}"><c:out value="${fn:substring(mynewtissue.tititle,0,16)}"/>...</a>
         	</c:if>
         	<c:if test="${fn:length(mynewtissue.tititle) <= 16}">
         	<a href="teamissueDetail.do?tiseq=${mynewtissue.tiseq}"><c:out value="${fn:substring(mynewtissue.tititle,0,16)}"/></a>
         	</c:if>
         	</p>
         	
         </div>
         <div class="col-sm-2 newissue" id="ti">
         
        <p>
         	${mynewtissue.name}
         	</p>
         	
         </div>
         <div class="col-sm-3 newissue" id="day">
         
        <p>${fn:substring(mynewtissue.tidate,0,16)}</p>
         	
         	
         
         </div>
         
      </div>
      
      
      </c:forEach>
      </c:if>
	</div>
			<div class="col-sm-4">
			<h4 style="text-align: center;">협업공간 진행도</h4>
                <select id="selectDash" name="selectDash" class="form-control">
                  <%-- <option value="${sessionScope.email}">여기는 select공간</option> --%>
                  <c:choose>
                  	<c:when test="${fn:length(pjtlist) > 0}">
                  		<c:forEach items="${pjtlist}" var="p">
                           <option value="${p.tseq}">${p.pname}</option>
                 		</c:forEach>
                  	</c:when>
                  	<c:otherwise>
                  		<option value="-1">참여한 팀이 없습니다</option>
                  	</c:otherwise>
                  </c:choose>
                  
               </select>
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