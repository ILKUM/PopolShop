<!-- 공지사항 수정 jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
</head>
<style>
.newissue{
	border-bottom: 1px solid #c8c8c8;
	padding-top: 0.7%;
	padding-bottom: 0.7%;
}
.NoticeDetail{
	font-size: 15px;
	margin-left: 3%;
	margin-bottom:1%;
}
.editdelete{
background-color: #E71D36;
border-color: #CCCCCC;
color: #fff;
cursor: pointer;
border-radius: 5px;
}
</style>
<script type="text/javascript">
$(function(){
$('#editCheckNotice').click(function(){
	$('#editNotice').click();
})
})
</script>
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
        <div class="card" >
        <form action="editNoticeCheck.do?noseq=${n.noseq}" method="POST">
		<div class="row"style="margin:2% 2% 0 2%" >
		<div class="col-sm-9">
		<span class="iconify" style="font-size: 40px;margin-bottom: 5px;color: #E71D36;" data-icon="ant-design:notification-outlined" data-inline="false">
		</span>
		<span id="noticeSubject" style="font-size: 25px;padding-top: 2%;"><input type="text" class="form-control" name="notitle" value="${n.notitle}" style="border: 0px;font-size: 20px;padding-left: 0px;padding-bottom: 12px;"></span>
		
		
		</div>
		<div class="col-sm-3" style="padding-top: 2%;padding-left: 8%;">	
		<span id="editCheckNotice">
		<span class="iconify" data-icon="fa-solid:check" data-inline="false" style="cursor: pointer;font-size: 30px;margin-bottom: 20px;margin-left: 20px;"></span>
         </span>
         <span id="returnNotice">
		<span class="iconify" data-icon="entypo:back" data-inline="false" style="cursor: pointer; font-size: 35px;margin-bottom: 15px;margin-left: 15px;"></span>
		</span>
		</div>
		<input type="submit" class="form-control editdelete" value="완료" id="editNotice" hidden="">
		</div>	
		<hr>
		<div style="height:520px ;border: 1px solid rgba(0,0,0,0.5);margin-left: 2%;margin-right: 2%;border-radius: 0.5rem;padding: 1% 2% 1% 2%;margin-bottom: 80px;">
	        <div class="NoticeDetail" style="margin-left: 0px;margin-bottom: 0px;font-size: 17px;">
	       <textarea rows="5" style="width:100%;border: 0; border-bottom: 1px solid #ced4da; padding: 1%; height: 479px;" id="editIssuecontent" name="nocontent">${n.nocontent}</textarea>
	        </div>    
		</div>
		  </form>
            <!-- #/ container -->
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script type="text/javascript">

$('#returnNotice').click(function(){
	location.href ='noticeDetail.do?noseq='+${n.noseq};
});
$('.divDelete').click(function(){
	var dValue = $(this).parent().next().attr('value');
	$(this).parent().next().attr('value', dValue+'~delete');
	$(this).parent().remove();
})
$('.divDelete2').click(function(){
	var dValue = $(this).parent().next().attr('value');
	var dValue2 = $(this).parent().next().next().attr('value');
	$(this).parent().next().attr('value', dValue+'~delete');
	$(this).parent().next().next().attr('value', dValue2+'~delete');
	$(this).parent().remove();
})

</script>
</html>