<!-- 협업공간 이슈 detail jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<c:set var="role" value="${sessionScope.role}" />
<c:set var="img" value="${sessionScope.img}" />
<c:set var="count" value="${requestScope.count}" />
<c:set var="point" value="${sessionScope.point}" />
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#moCommentBtn').click(function(){
		if($("#moComment").val()==''){
			Swal.fire({
				  title: '댓글을 작성해주세요!',
				  showConfirmButton: false,
				  icon: 'warning',
				  timer: 1000
			})
			return false;
		}
	});
	
	$('#editMovie').click(function(){
		location.href = 'movieEdit.do?moseq='+${movie.moseq};
	});
	
	$('#deleteMovie').click(function(){
		   Swal.fire({
			   title: '정말로 영화를 삭제하시겠습니까??',
			   text: "삭제하시면 영화의 모든 정보가 사라집니다!",
			   icon: 'warning',
			   showCancelButton: true,
			   confirmButtonColor: '#d33',
			   cancelButtonColor: '#c8c8c8',
			   confirmButtonText: '확인',
			   cancelButtonText: '취소'
			 }).then((result) => {
			   if (result.value) {
				   location.href = 'deleteMovie.do?moseq='+${movie.moseq};
			   }
			 })
		});
	
	$('.deleteComment').click(function(){
		var temp=$(this);
		$.ajax({
			type:"GET",
			url:"delMovieComment.do",
			data:{
				morseq: $(this).attr("id")				
			},
			success:function(event){
				temp.closest(".row").remove();
				Swal.fire({
	 				  title: '댓글삭제완료!',
	 				  showConfirmButton: false,
	 				  icon: 'success',
	 				  timer: 1000
	 			})
			},
			error:function(error){
				alert("에러");
			}

				
		});
		
	});
	
	$('#download').click(function(){
		 var point = "<%=session.getAttribute("point")%>";
		 var mpoint = "<%=request.getAttribute("mpoint")%>";	
		     if(point > mpoint){
		    	 location.href="movieDownload.do?fileName=${movie.mophoto}";
		     }else{	 
		    	 Swal.fire({
		   			  title : '포인트가 부족합니다.',
		   			  text : '다운로드 하실 포인트가 부족합니다.',
		   			  icon : 'warning',
		   			  confirmButtonColor: '#ba90c4'
		   		})
		   }
	  });  
})
</script>
<style>
.newissue{
	border-bottom: 1px solid rgba(0,0,0,0.5);
	padding-top: 0.7%;
	padding-bottom: 0.7%;
}
.myissueDetail{
	font-size: 15px;
	margin-left: 3%;
	margin-bottom:1%;
}
.editdelete{
background-color: #ba90c4;
border-color: #CCCCCC;
color: #fff;
cursor: pointer;
border-radius: 5px;
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
        <div class="content-body"style="height: 910px;">
        <div class="container-fluid row" style="padding-right: 0px; margin-right: 0px;margin-left: 0px; padding-left: 15px;">
        <div class="card" style="padding-left: 2%;padding-right: 0px; padding-top:1%;min-width:900px;height: auto;overflow: auto;">
		<div class="row" style="margin:2% 2% 0 2%;">
		<input type="hidden" name="moseq" value="${movie.moseq}">
		<input type="hidden" id="count" value="${count}">
		<input type="hidden" id="point" value="${point}">
		<input type="hidden" id="mpoint" name="mpoint" value="${movie.mpoint}">
		<input type="hidden" name="email" value="${sessionScope.email}">
			<c:choose>
				<c:when test="${movie.monum==1}">
				<div class="col-sm-7" style="font-size: 17px; padding-left: 1%;">한국영화</div>
				</c:when>
				<c:when test="${movie.monum==2}">
				<div class="col-sm-7" style="font-size: 17px; padding-left: 1%;">미국영화</div>
				</c:when>
				<c:when test="${movie.monum==3}">
				<div class="col-sm-7" style="font-size: 17px; padding-left: 1%;">중국영화</div>
				</c:when>
				<c:when test="${movie.monum==4}">
				<div class="col-sm-7" style="font-size: 17px; padding-left: 1%;">유럽영화</div>
				</c:when>
				<c:otherwise>
				<div class="col-sm-7" style="font-size: 17px; padding-left: 1%;">일본영화</div>
				</c:otherwise>
			</c:choose>
			
		<div class="col-sm-4" style="float: right;margin-left: 5%;padding-left: 60px;">
		<c:if test="${role == 'ROLE_CHARGE' or role == 'ROLE_ADMIN'}">
		
		<span class="iconify" id="download" data-icon="bx:bxs-download" style="cursor: pointer;font-size:25px;cursor: pointer;"></span>	
		
		</c:if>
		<i id="chuchun" class="chuchun far fa-thumbs-up" style="cursor: pointer;font-size:25px; margin-bottom: 20px;">&nbsp;${movie.molike}</i>		
			<c:if test="${role=='ROLE_ADMIN'}">
	        	<span class="fas fa-cog"  id="editMovie" style="cursor: pointer;font-size:25px; margin-bottom: 20px;margin-left: 10px;"></span>
				<span class="iconify" id="deleteMovie" data-icon="topcoat:delete" data-inline="false" style="cursor: pointer;font-size:25px; margin-bottom: 15px;margin-left: 10px;"></span>
			</c:if>
			<c:choose>
				<c:when test="${movie.monum==1}">
				<a href="koreaGet.do"><span class="iconify" id="history" data-icon="entypo:back" data-inline="false" style="cursor: pointer; font-size: 25px; margin-bottom: 10px;margin-left: 10px;"></span></a>
				</c:when>
				<c:when test="${movie.monum==2}">
				<a href="americanGet.do"><span class="iconify" id="history" data-icon="entypo:back" data-inline="false" style="cursor: pointer; font-size: 25px; margin-bottom: 10px;margin-left: 10px;"></span></a>
				</c:when>
				<c:when test="${movie.monum==3}">
				<a href="chinaGet.do"><span class="iconify" id="history" data-icon="entypo:back" data-inline="false" style="cursor: pointer; font-size: 25px; margin-bottom: 10px;margin-left: 10px;"></span></a>
				</c:when>
				<c:when test="${movie.monum==4}">
				<a href="europeGet.do"><span class="iconify" id="history" data-icon="entypo:back" data-inline="false" style="cursor: pointer; font-size: 25px; margin-bottom: 10px;margin-left: 10px;"></span></a>
				</c:when>
				<c:otherwise>
				<a href="japanGet.do"><span class="iconify" id="history" data-icon="entypo:back" data-inline="false" style="cursor: pointer; font-size: 25px; margin-bottom: 10px;margin-left: 10px;"></span></a>
				</c:otherwise>
			</c:choose>
				
				</div>				
			
		</div>
			<div style="margin-right: 0; margin-left: 0;padding-top: 10px;">
			<span id="myissueSubject" style="padding-left: 20px;font-size: 20px;">${movie.moname}</span>
			<span style="float: right;padding-right: 5%;padding-top:1%;">${movie.modirector}&nbsp;&nbsp;${fn:substring(movie.modate,0,10)}</span>
			</div>
		<hr style="margin:10px 2% 0 0;">
		<img src="<c:url value='/user/movie/${movie.mophoto}' />" alt="사진" onerror="this.src='https://ssl.pstatic.net/static/movie/2012/09/dft_img99x141.png'" style="width: 150px; height: 213.675px;">
		<br>
		<div class="row" style="margin-right: 0;width:900px;">
		
        <div class="myissueDetail col-sm-11" id="myissueContent" style="height:100px;overflow: auto;">
        영화 설명 :       	${movie.mocontent}
        </div>
        <!-- <div class="col-sm-2"><span>네이버</span><br><img alt="logo" src="https://s.pstatic.net/static/www/mobile/edit/2016/0705/mobile_212852414260.png" style="width: 50%"></div> -->
        </div>
            <!-- #/ container -->
            </div> 
            <div class="card" style="height: 600px;float:right;background-color: #fff;margin-left:10px;padding-left: 0px;padding-right: 0px;width:400px;">
            <div id="commentMain" style="height:450px;padding-left: 3%;padding-top: 5%;padding-right: 3%;padding-bottom: 5%;overflow: auto;margin:5%;">
           <c:forEach items="${mocom}" var="mo">
            
            <div class="row" style="margin:2% 3% 2% 3%;">
            
            <div class="col-sm-1" style="margin-top: 5px;margin-right:10px;padding-left:0;">
            <c:choose>
            <c:when test="${img==null}">
            <img class="img-circle" alt="프로필 사진" src="<c:url value="/resources/images/avatar/avatar.png"/>" style="width:40px;height: 40px;padding-top: 1%;margin-left: 10px;margin-right: 10px;">
            </c:when>
            <c:otherwise>
            <img  class="img-circle" alt="프로필 사진 " src="<c:url value="/user/profile/${img}"/>" style="width:40px;height:40px;padding-top: 1%;margin-left: 10px;margin-right: 10px;">
            </c:otherwise>
            </c:choose>
            </div>
            <div class="col-sm-10">
            <div id="commentMain" style="margin: 3% 5% 3% 5%;" >
            <div style="margin-bottom: 1%;width: 260px;">
            <span>${mo.name}</span><span style="padding-left:3%"><i class="far fa-clock" style="color:#ba90c4 "></i>${fn:substring(mo.mortime,0,19)}</span>
            <c:if test="${mo.email==sessionScope.email}">
            <span id="${mo.morseq}" class="deleteComment">
            <span class="iconify" id="deleteComment"  data-icon="octicon:x" data-inline="false" style="cursor: pointer;font-size:15px;margin-bottom: 3px;"></span>
            </span>
            </c:if>
            <br>
            <div>${mo.morcontent}</div>
            </div>
            </div>
            </div>
            
            </div>
           </c:forEach>
                      
            </div>
            <form action="moComment.do">
            <input type="hidden" value="${movie.moseq}" name="moseq">
            <input type="hidden" value="${sessionScope.email}" name="email">
            <img src="resources/images/logo/ScoopTitle.png" style="width:150px;height: auto;opacity:0.3;position:absolute;top:25%;left: 32%;">
            <textarea id="moComment" rows="5" name="morcontent" placeholder="덧글 입력후 입력버튼을 눌러 주세요." style="resize: none;height:180px;width:370px;border: 1px solid rgba(0,0,0,0.5);border-radius: 0.5rem;margin-left: 15px;margin-bottom: 20px;margin-right: 15px;overflow:auto;padding: 4%"></textarea>
            <input id="moCommentBtn" type="submit" value="입력" style="width: 90px;border-radius:0.5rem ;padding-top:7px;padding-bottom:7px; background-color: #ba90c4;color: #fff; cursor: pointer;position: absolute;top:585px;left: 290px;">
            </form>
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
   <script type="text/javascript">
 
   
   $(function(){
		$('#chuchun').click(function(){
			
			
			let chu = $(this);
			
			let moseq = chu.closest('div.row').children('input[name=moseq]').val();
			let email = chu.closest('div.row').children('input[name=email]').val();
			let count = $("#count").val();
			if(count == 1){
				Swal.fire({
					  title : '추천 실패',
					  text : '이미 추천을 누르셨습니다.',
					  icon : 'warning',
					  confirmButtonColor: '#d33'
				})
				return false;
			}else{
				$.ajax({
					url : "molike.do",
					type : "POST",
					data : {"moseq" : moseq, 
							"email" : email
					       },
					
					success : function(result){	
							Swal.fire({
					    		  title: "추천하기 성공",
					    		  text: "추천하기 성공",
					    		  icon: "success",
					    		  button: "확인"
					    		})				
					},
					error : function(err){
						console.log('error' + err);
						Swal.fire({
				    		  title: "추천 중 에러",
				    		  text: "추천 중 에러발생",
				    		  icon: "error",
				    		  button: "확인"
				    		})
						return false;
					}
				
				});
			}
				
			
				
			
			
		});
	});
   </script>
    
	
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