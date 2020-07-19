<!-- 공지사항 jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="role" value="${sessionScope.role}" />
<c:set var="email" value="${sessionScope.email}" />

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
.listmem{
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
	
	$("#adminAdd").click(function(){
		$("#addAdmin").modal();
	})
	
	$("#adminDelete").click(function(){
		$("#deleteAdmin").modal();
	})
	
	$('.banMember').click(function(){
		   Swal.fire({
			   title: '정말로 삭제하시겠습니까?',
			   text: "확인을 누르시면 되돌릴수 없습니다!",
			   icon: 'warning',
			   showCancelButton: true,
			   confirmButtonColor: '#d33',
			   cancelButtonColor: '#c8c8c8',
			   confirmButtonText: '확인',
			   cancelButtonText: '취소'
			 }).then((result) => {
			   if (result.value) {
					$.ajax({
						type : 'post',
						url : 'banMember.do',
						data : {						
							email:$("#target").val();
						},
						success : function(data) {
							console.log("ajax success"+data);
							console.log(memDiv);	
						}
					});
			   }
			 })

})

})
function filter() {
    var value, name, item, i;
    value = document.getElementById("searchemail").value.toUpperCase();
    item = document.getElementsByClassName("search_member");

    for (i = 0; i < item.length; i++) {
       name = item[i].getElementsByClassName("listmem");
       if (name[0].innerHTML.toUpperCase().indexOf(value) > -1) {
          item[i].style.display = "flex";
       } else {
          item[i].style.display = "none";
       }
    }
 }


function checkadmin() {
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	   var id = "<%=session.getAttribute("email")%>";
	    //이메일 공백 확인
	     if($("#admin").val() == ""){
	        Swal.fire("이메일을 입력해주세요.");
	       $("#admin").focus();
	       return false;
	     }
	    
	   //이메일 유효성 검사
	      if(!getMail.test($("#admin").val())){
	    	Swal.fire("이메일 형식에 맞게 입력해주세요."); 
	        $("#admin").val("");
	        $("#admin").focus();
	        return false;
	      }
	    
	     //자기 자신 변경 금지 validation
	     if($("#admin").val() == id){
	        Swal.fire("자기 자신은 변경이 불가능 합니다.");
	       $("#admin").focus();
	       return false;
	     }
	     
	     Swal.fire({
	   		  title : '등록 성공',
	   		  text : '관리자가 등록 되었습니다.',
	   		  icon : 'success',
	   		  confirmButtonColor: '#ba90c4'
	   	})

	   return true;
		  
	   } 
	   
function checkDelete() {
	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	   var id = "<%=session.getAttribute("email")%>";
	    //이메일 공백 확인
	     if($("#admin").val() == ""){
	        Swal.fire("이메일을 입력해주세요.");
	       $("#admin").focus();
	       return false;
	     }
	    
	   //이메일 유효성 검사
	      if(!getMail.test($("#admin").val())){
	    	Swal.fire("이메일 형식에 맞게 입력해주세요."); 
	        $("#admin").val("");
	        $("#admin").focus();
	        return false;
	      }
	    
	     //자기 자신 변경 금지 validation
	     if($("#admin").val() == id){
	        Swal.fire("자기 자신은 변경이 불가능 합니다.");
	       $("#admin").focus();
	       return false;
	     }
	     
	     Swal.fire({
	   		  title : '변경 성공',
	   		  text : '관리자가 취소 되었습니다.',
	   		  icon : 'success',
	   		  confirmButtonColor: '#ba90c4'
	   	})

	   return true;
		  
	   } 
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
        <div class="content-body" style="height: 900px;">
            <div class="container-fluid">
        <div class="card">
		<div class="row" style="margin: 2% 2% 15px 2%">
			<div class="col-sm-12" style="padding-left: 0">
				<h3 style="padding-left: 15px;"><spring:message code="admin.main" /></h3>
			</div>
		</div>
		<div class="row" style="margin-left: 2%;">
			<ul class="nav nav-pills">
			    <li class="nav-item">
			      <a class="nav-link" href="admin.do" style="color: #ba90c4;"><spring:message code="admin.main" /></a>
			    </li>		
			    <li class="nav-item">
			      <a class="nav-link" style="cursor: pointer;" id="adminAdd"><spring:message code="admin.main2" /></a>
			    </li>		
			    <li class="nav-item">
			      <a class="nav-link" style="cursor: pointer;" id="adminDelete"><spring:message code="admin.main3" /></a>
			    </li>		
		    </ul>
		</div>
		 <hr style="margin-top: 0;margin-left: 2%; margin-right: 2%">
		 <div class="row" style="margin-left: 2%; margin-right: 2%">
		 <input
            onkeyup="filter()" type="search" id="searchemail" class="form-control"
            style="border-radius: 0.25rem; height: 20px" placeholder="<spring:message code="admin.eholder" />">
				<div class="col-sm-4 listmem" >
				<spring:message code="admin.email" />
				</div>
				<div class="col-sm-3 listmem">
				<spring:message code="admin.name" />
				</div>
				<div class="col-sm-2 listmem">
				<spring:message code="admin.rank" />
				</div>
				<div class="col-sm-2 listmem">
				<spring:message code="admin.point" />
				</div>
				<div class="col-sm-1 listmem">
				<spring:message code="all.manage" />
				</div>
		</div>
		<c:forEach items="${member}" var="m">
		<div class="row search_member resultmember" style="margin-left: 2%; margin-right: 2%" id="row">	
			
			<div class="col-sm-4 listmem">   
           		${m.email}       
			</div>			
			<div class="col-sm-3 listmem">    
           		${m.name}      
			</div>
			<div class="col-sm-2 listmem">
				<c:choose>
					<c:when test="${m.rname == 'ROLE_ADMIN'}">
						<spring:message code="admin.rank1" />
					</c:when>				
					<c:when test="${m.rname == 'ROLE_CHARGE'}">
						<spring:message code="admin.rank2" />
					</c:when>
					<c:otherwise>
						<spring:message code="admin.rank3" />
					</c:otherwise>				
				</c:choose>				
			</div>		
			<div class="col-sm-2 listmem">
				${m.point}
			</div>
			<div class="col-sm-1 listmem ">
			<c:choose>
				<c:when test="${m.rname == 'ROLE_ADMIN'}">
						<spring:message code="admin.change" />
				</c:when>
				<c:otherwise>
				<span class="iconify banMember" data-icon="bx:bxs-user-x" data-inline="false" style="cursor: pointer;" ><input type="hidden" name="${m.email}" id="target"></span>
				</c:otherwise>
			</c:choose>
			</div>
		
      </div>	
			</c:forEach>
			<div id="loadPlus" data-toggle="tooltip" data-placement="bottom" title="더 보기" >
			<div id="load" class="iconify" style="font-size: 40px; color:#464a53;cursor: pointer; margin-left: 627px; margin-top: 1%;" data-icon="mdi:chevron-double-down" data-inline="false">더 보기</div>
			</div>
			</div>
		
            <!-- #/ container -->
            
            </div>
		</div>
		
        	
        </div>
        <div class="modal fade" id="addAdmin">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h3 class="modal-title"><spring:message code="admin.main2" /></h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
   
         <form action="addAdmin.do" method="POST" onsubmit="return checkadmin()">
            <!-- Modal body -->
            <div class="modal-body">
               <label for="etitle"><spring:message code="admin.email" /></label> <input
                  class="form-control createmodal" type="text" id="admin"
                  name="email" style="width: 100%;border-radius: 0.5rem;" placeholder="<spring:message code="admin.eholder" />">                              
            <!-- Modal footer -->
            <div class="modal-footer">
               <button type="submit" class="btn btn-secondary"
                  style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;"><spring:message code="all.submit" /></button>
               <button type="button" class="btn btn-secondary"
                  style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;"
                  data-dismiss="modal"><spring:message code="all.cancel" /></button>
               </div>
            </div>
         </form>
      </div>
   </div>
   </div>
   
        <div class="modal fade" id="deleteAdmin">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h3 class="modal-title"><spring:message code="admin.main3" /></h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
   
         <form action="deleteAdmin.do" method="POST" onsubmit="return checkDelete()">
            <!-- Modal body -->
            <div class="modal-body">

               <label for="etitle"><spring:message code="admin.email" /></label> <input
                  class="form-control createmodal" type="text" id="admin"
                  name="email" style="width: 100%;border-radius: 0.5rem;" placeholder="<spring:message code="admin.eholder" />">                              
            <!-- Modal footer -->
            <div class="modal-footer">
               <button type="submit" class="btn btn-secondary"
                  style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;"><spring:message code="all.submit" /></button>
               <button type="button" class="btn btn-secondary"
                  style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;"
                  data-dismiss="modal"><spring:message code="all.cancel" /></button>
               </div>
            </div>
         </form>
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