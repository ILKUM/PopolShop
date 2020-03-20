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

function checkz() {
//공지사항 제목 공백 확인
 if($("#retitle").val() == ""){
    Swal.fire("제목을 입력해주세요.");
   $("#retitle").focus();
   return false;
 }

 //공지사항 설명 공백 확인
 if($("#recontent").val() == ""){
    Swal.fire("내용을 입력해주세요.");
   $("#recontent").focus();
   return false;
 }
 
return true;
}
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
            <h3 style="padding-left: 1%;">리뷰게시판  		
            </h3>
            <p style="padding-left: 1%;margin-bottom: 0px;">자신이 본 영화를 리뷰 해주세요.</p>
         </div>
         <div class="col-sm-2" style="text-align: right">      	
         		<span id="writeletter" style="cursor: pointer;">
	         	<span id="write" class="iconify" data-icon="jam:write-f" data-inline="false" style="font-size: 20px;" data-toggle="modal" data-target="#writereview"></span> 
	         	<span id="letter" data-toggle="modal" data-target="#writereview">리뷰 글쓰기</span>
         	</span>

         </div>
      </div>     
      <hr style="margin-top: 0;margin-left: 2%; margin-right: 2%;margin-bottom:0;">
      <div class="row" style="margin-left: 2%; margin-right: 2%">      
         <div class="col-sm-7 newissue" style="padding-left: 87px;" >
         	제목
         </div>
         <div class="col-sm-2 newissue">
         	작성자 
         </div>
         <div class="col-sm-2 newissue">
         	작성시간 
         </div>
         <div class="col-sm-1 newissue">
         	위시리스트
         </div>
      </div>    
         <div class="row" style="margin-left: 2%; margin-right: 2%" id="row">
         <div class="col-sm-7 newissue">	
         <a href="reviewDetail.do?reseq=${re.reseq}" style="margin-left: 5%;">제목자리</a>     
         </div>
         <div class="col-sm-2 newissue" >
         	글쓴자리
         </div>
         <div class="col-sm-2 newissue">
        	글쓴시간 
         </div>
				<div class="col-sm-1 newissue" style="padding-left: 30px;">
					<i class="fas fa-heart"></i>
				</div>
      </div>
    
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
 <div class="modal fade" id="writereview">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         
         <div class="modal-header">
            <h3 class="modal-title">리뷰 작성</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
   
         <form onsubmit="return checkz()" action="writeReview.do" method="POST" enctype="multipart/form-data">
            <!-- Modal body -->
            <div class="modal-body">
               <!-- <p style="font-size: 12px">협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br>
             협업공간을 만들고 함께 일할 멤버들을 초대해보세요.</p> -->
               <label for="title">리뷰글 제목</label> <input
                  class="form-control createmodal" type="text" id="retitle"
                  name="retitle" style="width: 100%;border-radius:0.5rem;" placeholder="제목을 입력해 주세요.">
               <br> <label for="content">리뷰 설명</label> <span id="filename"></span>
               <img id="imgpreview" alt="사진 미리보기 자리"
                  style="display: none; width: 40px; height: 40px" src="#" /> 
                  <input type="file" multiple="multiple"  id="fclick" name="files" hidden="">
               <button type="button" id="auth" disabled hidden="">Authenticate</button>
               <textarea class="form-control createmodal" rows="5"
                  id="recontent" name="recontent" style="width: 100%;border-radius: 0.5rem;"
                  placeholder="@를 입력하여 멘션, 할 일, 파일 등을 추가해 보세요."></textarea>
               <br>
               <label for="annota">첨부</label>
               <div id="todoresult" style="overflow: auto; height: 100px; border: 1px solid #000; border-radius: 0.5rem;">
                  <!-- mention -->
               </div>
               <!-- The Google API Loader script. -->
               <script type="text/javascript"
                  src="https://apis.google.com/js/api.js?onload=onApiLoad"></script>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">      
               <button type="submit" class="btn btn-secondary"
                  style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">만들기</button>
               <button type="button" class="btn btn-secondary"
                  style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;"
                  data-dismiss="modal">취소</button>
            </div>
         </form>
      </div>
   </div>

   <div class="list-group" id="filelist" style="display: none;border:10px solid #cbc9d4">
      <a href="#" class="list-group-item list-group-item-action menli" id="selfile" style="padding: 5px"><span class="iconify" data-icon="si-glyph:file-box" data-inline="false"></span> 파일</a> 
   </div>
   <!--  -->
   <!-- 멘션할 사람 목록 -->
   <div class="list-group" id="todo" style="display: none;">
    
      <textarea class="form-control createmodal" rows="3" id="todolist"
         style="width: 100%; margin-bottom: 2%" placeholder="할 일을 작성해주세요."></textarea>
      <button type="button" id="todomake" class="btn btn-secondary"
         style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">만들기</button>
      <button type="button" id="todocancle" class="btn btn-secondary"
         style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer;">취소</button>
   </div>
   <div class="list-group" id="datepick" style="display: none;">
      <label>일정 작성</label>
       </div>
      </div>
      <br> <!-- <label>할 일</label>
      <textarea class="form-control createmodal" rows="3" id="datecontent"
         style="width: 100%; margin-bottom: 2%" placeholder="일정을 작성해주세요."></textarea> -->
         <div class="row">
         <div class="col-sm-6" style="padding-right: 2px">
      <button type="button" id="datemake" class="btn btn-secondary"
         style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer; width: 100%">작성완료</button>
         </div>
         <div class="col-sm-6" style="padding-left: 2px">
      <button type="button" id="datecancle" class="btn btn-secondary"
         style="background-color: #E71D36; border-color: #CCCCCC; color: #fff; cursor: pointer; width: 100%">취소</button>
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

var tar = 0;
var tar2 = 1;
$('.menli').keydown(function(event) { //이슈작성에서 @단축키 사용했을때 방향키로 조절가능
	   var key = event.keyCode;
	    switch (key) {
	    case 38:
	       tar2--;
	       break;
	    case 40:
	       tar2++;
	       break;
	    case 39:
	       break;
	    case 37:
	       break;
	    }
	    if (tar2 < 0) {
	       tar2 = 0;
	    }
	    if (tar2 > 1) {
	       tar2 = 1;
	    }
	    $('#men' + tar2).focus();
	    if ($('#men' + tar2).focus()) {
	       $('.menli').css('background-color', '#fff');
	       $('#men' + tar2).css(
	             'background-color',
	             'rgba(225, 225, 225,0.5)');
	    }
	    if(event.keyCode == 13){
	       $(this).click();
	    }
	});
		$('#recontent').keydown( //이슈작성에서 @단축키 사용했을때 방향키로 조절가능
				function(event) {
					if($('#filelist').css('display')==('flex')){
						var key = event.keyCode;
			               switch (key) {
			               case 38:
			                  tar--;
			                  break;
			               case 40:
			                  tar++;
			                  break;
			               case 39:
			                  break;
			               case 37:
			                  break;
			               }
			               if (tar < 0) {
			                  tar = 0;
			               }
			               if (tar > 1) {
			                  tar = 1;
			               }
			               $('#men' + tar).focus();
			               if ($('#men' + tar).focus()) {
			                  $('.menli').css('background-color', '#fff');
			                  $('#men' + tar).css(
			                        'background-color',
			                        'rgba(225, 225, 225,0.5)');
			               }
			               if(event.keyCode == 13){
			               	$(this).click();
			               }
					}
					var top = ($('#recontent').offset().top);
					var left = ($('#recontent').offset().left + 490);
					if (event.shiftKey && event.keyCode == 50) {
						$('#filelist').attr(
								'style',
								'position:fixed;border:1px solid black;border-radius:0.5rem; width:20%;top:' + top + 'px;left:'
										+ left + 'px; z-index:5');
						$('#filelist').show();
						$('div').not('#filelist').click(function() {
							$('#filelist').hide();
						});
					}
				});
		
		$('#selfile').click(function() { //파일 클릭하면 hidden으로 숨겨놓은 파일선택 실행
			$('#fclick').click();
		});
</script>
</body>
</html>