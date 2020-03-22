<!-- 협업공간 이슈 detail jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<c:set var="img" value="${sessionScope.img}" />
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
	$('#commentMain').scrollTop($('#commentMain')[0].scrollHeight);
	$('#teamCommentBtn').click(function(){
		if($("#teamComment").val()==''){
			Swal.fire({
				  title: '댓글을 작성해주세요!',
				  showConfirmButton: false,
				  icon: 'warning',
				  timer: 1000
			})
			return;
		}
		var tiseqq = ${tissue.tiseq};
		$.ajax({
			
			url:"teamComment.do",
			data:{
				rcontent: $("#teamComment").val(),
				tiseq: "${tissue.tiseq}",
				email:"${sessionScope.email}"
			},
			success:function(data){
				console.log(data);
				$.ajax({
					type:"GET",
					dataType:"json",
					url:"teamCommentOk.do",
					data:{
						tiseq: "${tissue.tiseq}"						
					},
					success:function(event){
						$('#commentMain').empty();
						$.each(event,function(index,object){
							var src = "";
		                     if(object.profile==''){
		                        src = '/SCOOP/resources/images/avatar/avatar.png';
		                     }else{
		                        src = '/SCOOP/user/upload/'+object.profile;
		                     }
							var xButton = '';
							if(object.email=="${sessionScope.email}"){
								xButton = '<span id="'+object.replyseq+'" class="deleteComment"><span class="iconify" id="deleteComment"  data-icon="octicon:x" data-inline="false" style="cursor: pointer;font-size:15px;margin-bottom: 3px;"></span></span>';
								}
						$('#commentMain').append(

					            '<div class="row" style="margin:2% 3% 2% 3%;">'+
					            '<div class="col-sm-1" style="margin-top: 5px;margin-right:10px;padding-left:0;">'+
					            '<img class="img-circle" alt="멤버 프로필 사진 넣는 곳" src="'+src+'" style="width:40px;height: 40px;padding-top: 1%;margin-left: 10px;margin-right: 10px;">'+
					            '</div>'+
					            '<div class="col-sm-10">'+
					            '<div id="commentMain" style="margin: 3% 5% 3% 5%;" >'+
					            '<div style="margin-bottom: 1%;width: 260px;">'+
					            '<span>'+object.name+'</span><span style="padding-left:3%"><i class="far fa-clock" style="color:#E71D36 "></i>'+object.rdate.substring(0,16)+'</span>'+
					            xButton +
					            '<br><div>'+object.rcontent+'</div></div></div></div></div>'
						           
							);
						$('#teamComment').val("");
						$('#commentMain').scrollTop($('#commentMain')[0].scrollHeight);
						Swal.fire({
							  title: '댓글작성 완료!',
							  showConfirmButton: false,
							  icon: 'success',
							  timer: 1000
						})
						
						})
						
						//댓글 삭제 
						$('.deleteComment').click(function(){
							var temp=$(this);
							$.ajax({
								type:"GET",
								url:"delComment.do",
								data:{
									replyseq: $(this).attr("id")				
								},
								success:function(event){
									
									temp.closest(".row").remove();
									Swal.fire({
						 				  title: '댓글삭제 완료!',
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
			            
					},
					error:function(error){
						alert("에러");
					}
						
				});
	            
			},
			error:function(error){
				alert(error);
			}
				
		});
	});
	$('#editIssue').click(function(){
		location.href = 'teamIssueEdit.do?tiseq='+${tissue.tiseq};
	})
	$('#deleteIssue').click(function(){
	   Swal.fire({
		   title: '정말로 이슈를 삭제하시겠습니까??',
		   text: "삭제하시면 이슈의 모든 정보가 사라집니다!",
		   icon: 'warning',
		   showCancelButton: true,
		   confirmButtonColor: '#d33',
		   cancelButtonColor: '#c8c8c8',
		   confirmButtonText: '확인',
		   cancelButtonText: '취소'
		 }).then((result) => {
		   if (result.value) {
			   location.href = 'deleteTeamIssue.do?tiseq='+${tissue.tiseq}+'&tseq='+${tissue.tseq};
		   }
		 })
	})
	//댓글 삭제 
	$('.deleteComment').click(function(){
		var temp=$(this);
		$.ajax({
			type:"GET",
			url:"delComment.do",
			data:{
				replyseq: $(this).attr("id")				
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
});

$('.like').click(function(){
	let like = $(this);

	let reseq = book.closest('div.row').children('input[name=reseq]').val();
	let email = book.closest('div.row').children('input[name=email]').val();
	let status = book.attr('name');

	$.ajax({
		url : "relike.do",
		type : "POST",
		data : {"email" : email,
				"reseq" : reseq, 
				"status" : status
		       },
		success : function(datadata){
				Swal.fire({
		    		  title: "추천",
		    		  text: "북마크 성공",
		    		  icon: "success",
		    		  button: "확인"
		    		})
		    		if(status == "bookoff"){					
						like.removeAttr('name').attr('name', 'bookon');				
			}else if(status == "likeon"){			
				book.removeAttr("name").attr("name", "bookoff");		
				Swal.fire({
		    		  title: "북마크 취소",
		    		  text: "북마크 취소",
		    		  icon: "warning",
		    		  button: "확인"
		    		})
			}

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
});
});

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
background-color: #E71D36;
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
        <div class="content-body"style="height: 680px;">
        <div class="container-fluid row" style="padding-right: 0px; margin-right: 0px;margin-left: 0px; padding-left: 15px;">
        <div class="card" style="padding-left: 2%;padding-right: 0px; padding-top:1%;min-width:900px;height: auto;overflow: auto;">
		<div class="row" style="margin:2% 2% 0 2%;">
		<input type="hidden" name="reseq" value="${review.reseq}">
		<input type="hidden" name="email" value="${sessionScope.email}">
			
			<div class="col-sm-7" style="font-size: 17px; padding-left: 1%;">리뷰 게시판</div>
			
			<c:if test="${review.email==sessionScope.email}">
				<div class="col-sm-4" style="float: right;margin-left: 5%;padding-left: 60px;">
				<span class="iconify like" name="likeoff" data-icon="ant-design:like-outlined" data-inline="false" style="cursor: pointer; font-size: 25px;margin-bottom: 10px;margin-left: 25px;"></span>
	        	<span class="fas fa-cog"  id="editIssue" style="cursor: pointer;font-size:25px; margin-bottom: 20px;margin-left: 25px;"></span>
				<span class="iconify" id="deleteIssue" data-icon="topcoat:delete" data-inline="false" style="cursor: pointer;font-size:25px; margin-bottom: 15px;margin-left: 20px;"></span>
				<a href="review.do"><span class="iconify" id="history" data-icon="entypo:back" data-inline="false" style="cursor: pointer; font-size: 25px; margin-bottom: 10px;margin-left: 15px;"></span></a>
				</div>				
			</c:if>
			
		</div>
			<div style="margin-right: 0; margin-left: 0;padding-top: 10px;">
			<span id="myissueSubject" style="padding-left: 20px;font-size: 20px;">${review.retitle}</span>
			<span style="float: right;padding-right: 5%;padding-top:1%;">${review.name}&nbsp;&nbsp;${review.retime}</span>
			</div>
		
		
		<hr style="margin:10px 2% 0 0;">	
		<br>
		<div class="row" style="margin-right: 0;width:900px;">
        <div class="myissueDetail col-sm-11" id="myissueContent" style="height:100px;overflow: auto;">
       	${review.recontent}
        </div>
        <!-- <div class="col-sm-2"><span>네이버</span><br><img alt="logo" src="https://s.pstatic.net/static/www/mobile/edit/2016/0705/mobile_212852414260.png" style="width: 50%"></div> -->
        </div>
            <!-- #/ container -->
            </div> 
            <div class="card" style="height: 600px;float:right;background-color: #fff;margin-left:10px;padding-left: 0px;padding-right: 0px;width:400px;">
            <div id="commentMain" style="height:450px;padding-left: 3%;padding-top: 5%;padding-right: 3%;padding-bottom: 5%;overflow: auto;margin:5%;">
           
            
            <div class="row" style="margin:2% 3% 2% 3%;">
            
            <div class="col-sm-1" style="margin-top: 5px;margin-right:10px;padding-left:0;">
            <c:choose>
            <c:when test="${img==null}">
            <img class="img-circle" alt="프로필 사진" src="<c:url value="/resources/images/avatar/avatar.png"/>" style="width:40px;height: 40px;padding-top: 1%;margin-left: 10px;margin-right: 10px;">
            </c:when>
            <c:otherwise>
            <img  class="img-circle" alt="프로필 사진 " src="<c:url value="/user/upload/${img}"/>" style="width:40px;height:40px;padding-top: 1%;margin-left: 10px;margin-right: 10px;">
            </c:otherwise>
            </c:choose>
            </div>
            <div class="col-sm-10">
            <div id="commentMain" style="margin: 3% 5% 3% 5%;" >
            <div style="margin-bottom: 1%;width: 260px;">
            <span>이름</span><span style="padding-left:3%"><i class="far fa-clock" style="color:#E71D36 "></i>작성시간</span>
            <c:if test="${review.email==sessionScope.email }">
            <span id="${r.replyseq}" class="deleteComment">
            <span class="iconify" id="deleteComment"  data-icon="octicon:x" data-inline="false" style="cursor: pointer;font-size:15px;margin-bottom: 3px;"></span>
            </span>
            </c:if>
            <br>
            <div>덧글내용</div>
            </div>
            </div>
            </div>
            
            </div>
            
            
            </div>
            <img src="resources/images/logo/ScoopTitle.png" style="width:150px;height: auto;opacity:0.3;position:absolute;top:25%;left: 32%;">
            <textarea id="teamComment" rows="5" placeholder="말하지 않아도 아는것은 초코파이뿐입니다                        댓글 입력 후 저장을 클릭해주세요" style="resize: none;height:180px;width:auto;border: 1px solid rgba(0,0,0,0.5);border-radius: 0.5rem;margin-left: 15px;margin-bottom: 20px;margin-right: 15px;overflow:auto;padding: 4%"></textarea>
            <input id="teamCommentBtn" type="submit" value="저장" style="width: 90px;border-radius:0.5rem ;padding-top:7px;padding-bottom:7px; background-color: #E71D36;color: #fff; cursor: pointer;position: absolute;top:585px;left: 290px;">
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
   
    <!-- <script type="text/javascript">
		$(function(){
			console.log('start')
			let content = $('#myissueContent').text()
			let contentline = content.split('\n')
			let urlData = [];
			
			for(let i = 0; i < contentline.length; i++){
				if(contentline[i].indexOf("http") != -1 || contentline[i].indexOf("www") != -1) {
					let link = contentline[i].split(' ')
					for(let j = 0; j < link.length; j++){
						if(link[j].indexOf("http") != -1 || link[j].indexOf("www") != -1){
							urlData.push(link[j])
						}
					}
				}
			}
			
			console.log(urlData)
			
			console.log('start')
			for(let i = 0; i < urlData.length; i++){
				console.log(urlData[i])
				let udata = urlData[i]
				$.ajax({
					url: 'http://192.168.6.45:8091/index',
					type: 'GET',
					data: 'url='+udata,
					success: function(data){
						console.log('success')
						console.log(data)
					},
					error: function(xhr, status, error){
						console.log('xhr : ' + xhr.status)
						console.log(error)
					}
				})
			}
		})
		
		
	</script> -->
	
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