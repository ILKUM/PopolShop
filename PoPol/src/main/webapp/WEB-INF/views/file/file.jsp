<!-- 협업공간 이슈 detail jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.newissue{
   border-bottom: 1px solid #c8c8c8;
   padding-top: 0.7%;
   padding-bottom: 0.7%;
}
</style>
<script type="text/javascript">
$('#writeletter').mouseover(function(){
	 $('#write').attr("style","font-size: 20px;color:#E71D36;");
});
$('#writeletter').mouseout(function(){
	 $('#write').attr("style","font-size: 20px;");
});

$(function(){
	$('[data-toggle="tooltip"]').tooltip();
	$('#profiles').click(function() { 
		$('#Photo').click();
	});
 
});
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
        <div class="card" style="min-height: 1080px;">
      <div class="row" style="margin: 2% 2% 15px 2%">
         <div class="col-sm-10" style="padding-left: 0">
            <h3 style="padding-left: 1%;">자료 공유 게시판 		
            </h3>
            <p style="padding-left: 1%;margin-bottom: 0px;">자신의 자료를 공유 해주세요.</p>
         </div>
         <div class="col-sm-2" style="text-align: right">      	
         		<span id="writeletter" style="cursor: pointer;">
	         	<span id="write" class="iconify" data-icon="jam:write-f" data-inline="false" style="font-size: 20px;" data-toggle="modal" data-target="#likeWrite"></span> 
	         	<span id="letter" data-toggle="modal" data-target="#likeWrite">자료 글쓰기</span>
         	</span>

         </div>
      </div>     
      <hr style="margin-top: 0;margin-left: 2%; margin-right: 2%;margin-bottom:0;">
      <div class="row" style="margin-left: 2%; margin-right: 2%">      
         <div class="col-sm-6 newissue" style="padding-left: 87px;" >
         	제목
         </div>
         <div class="col-sm-2 newissue">
         	작성자 
         </div>
         <div class="col-sm-2 newissue">
         	작성시간 
         </div>
         <div class="col-sm-1 newissue">
         	조회수
         </div>
         <div class="col-sm-1 newissue">
         	추천수
         </div>
      </div>
      <c:forEach items="${file}" var="f">   
       <a href="detailFile.do?fseq=${f.fseq}"> 
         <div class="row" style="margin-left: 2%; margin-right: 2%" id="row">
         <div class="col-sm-6 newissue">	
        <p style="margin-left: 60px;"> ${fn:substring(f.ftitle,0,25)}</p>    
         </div>
         <div class="col-sm-2 newissue" >
         	${f.name}
         </div>
         <div class="col-sm-2 newissue">
         ${fn:substring(f.ftime,0,10)}
         </div>
			<div class="col-sm-1 newissue" style="padding-left: 30px;">
				${f.frnum}	
			</div>
			<div class="col-sm-1 newissue" style="padding-left: 30px;">
				${f.flike}	
			</div>
      </div>
      </a>
      </c:forEach>
    
      		<div id="loadPlus" data-toggle="tooltip" data-placement="bottom" title="더 보기" >
			<div id="load" class="iconify" style="font-size: 40px; color:#464a53;cursor: pointer; margin-left: 627px; margin-top: 1%;" data-icon="mdi:chevron-double-down" data-inline="false">더 보기</div>
			</div>
            <!-- #/ container -->
            </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
 	<div class="modal fade" id="likeWrite">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" align="center">
          <h4><label for="validationTextarea">파일공유 글 작성</label></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form class="was-validated" action="writeFile.do" enctype="multipart/form-data" method="Post">
          <div class="col" width="33%" align="center" >추천 영화 사진</div> 
          <div class="form-label-group" text-align="center" align="center">
        	<span id="profiles"></span>
         </div>
        	<br>
        	<input type="file" id="Photo" name="filesrc" class="form-control is-invalid" required="required" onchange="readURL(this);" >  
  		
                            
  <hr class="my-4">
     <div class="row">   
    </div>
  <div class="form-label-group">
        <label for="validationTextarea">파일 글 제목</label>
        <input type="text" id="title" name="ftitle" class="form-control is-invalid" placeholder="제목을 입력해주세요" required="required">
  </div>   
  <div class="mb-3">
    <label for="validationTextarea">파일 글 내용</label>
    <textarea class="form-control is-invalid" id="content" name="fcontent" placeholder="글 내용 300자이내로 설명해주세요." required></textarea>
    <div class="invalid-feedback">
    </div>
  </div>
  <input type="text" name="email" class="form-control is-invalid" hidden="" value="${sessionScope.email}">
  <input type="hidden" name="flike" value="0">
  <input type="hidden" name="frnum" value="0">
  <input type="hidden" name="fdnum" value="0">
  <span class="txsub" style="margin-bottom: 16px;">남은글자수 : <input type="text" readonly  value="300" id="counter"></span>
    <button class="btn btn-sm btn-primary btn-block" type="submit" width="30%">작성완료</button>
        <br>
      <button class="btn btn-sm btn-primary btn-block" data-dismiss="modal" width="30%">닫기</button>
</form>
        </div>
        
      </div>
    </div>
    
  </div>
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
	var moreEventArray = document.querySelectorAll(".card > #row ");
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
		/* console.log($('.card'));
		console.log($('.card > a'));
		console.log($('.card > a > .row'));
		console.log($(".card > a > .row").val()); */
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

function readURL(input) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
	   $('#profiles').attr('src', e.target.result);  
	  }
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	  
	$("#Photo").change(function(){
	   readURL(this);
	});
	
	$('#content').keyup(function (e){
	      var content = $(this).val();       
	      $('#counter').val(300-content.length);

	          if(content.length > 300) {
	            $(this).val($(this).val().substring(0, 300));
	          }
	      });
	
	 $(document).ready(function(){

         $('input[type="file"]').change(function(e){

             var fileName = e.target.files[0].name; //getting the file name 
             var display = $("#profiles"); //where to display
             display.html(fileName);

         });

     });
</script>
</body>
</html>