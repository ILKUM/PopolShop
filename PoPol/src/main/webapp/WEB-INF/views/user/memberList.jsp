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
$(function () {
    let table = $('#dataTable').DataTable({
   	 stateSave: true, // 페이지 상태 저장
   	"ordering": false
   });

   $('#dataTable_filter').prepend(
       '<select id="select" class="custom-select" style="margin-right : 10px; width: 100px"></select>');

   // 검색 th 칼럼 별로 할 수 있게 select 생성
   let ths = $('#dataTable > thead > tr > th');
   $('#select').append('<option>전체</option>');
   ths.each(function (index, element) {
       if (index < 3) // 앞에 3개만
           $('#select').append('<option>' + element.innerHTML + '</option>');
   });

   // select에 따라 검색 결과 table에 표현
   $('.dataTables_filter input').keyup(function () {
       tableSearch();
   });

   $("#deptSelect").change(function () {
       tableSearch();
   });

   function tableSearch() {
       let colIndex = document.querySelector('#select').selectedIndex;
       let searchText = $('.dataTables_filter input').val();
		// 전체 검색
       if(colIndex==0){
       	table.search(searchText).draw();
       } 
   	// 컬럼 검색
       else{
       	table.column(colIndex-1).search(searchText).draw();
       }
   }
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
        <div class="card">
		<div class="row" style="margin: 2% 2% 15px 2%">
			<div class="col-sm-12" style="padding-left: 0">
				<h3 style="padding-left: 15px;">멤버관리</h3>	
			</div>
		</div>
		 <hr style="margin-top: 0;margin-left: 2%; margin-right: 2%">
		 <table class="table table-bordered" id="dataTable">
							<thead>
								<tr>
									<th width="10%">No</th>
									<th width="60%">제목</th>
									<th width="20%">작성일</th>
									<th width="10%">조회수</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="member" items="${mem}">
									<tr >
										<td width="10%" style="text-align: center !important;">${member.email}</td>
										<td width="60%" class="sorting_1" >
											<a href="#">#{member.name}</a></td>
										<td width="20%" style="text-align: center !important;">
											변경
										</td>
										<td width="10%" style="text-align: center !important;">삭제</td>
									</tr>
									</c:forEach>
								
							</tbody>
						</table>
			</div>
		
            <!-- #/ container -->
            
            </div>
		</div>
		
        	
        </div>
        
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