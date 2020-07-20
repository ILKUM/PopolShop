<!-- 내정보 jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
    <c:set var="img" value="${requestScope.img}" />
    <c:set var="role" value="${sessionScope.role}" />
    
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <jsp:include page="/WEB-INF/views/commons/title.jsp"></jsp:include>
    <!-- Custom Stylesheet -->
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$('#userDelete').click(function(){
		Swal.fire({
			   title: '정말로 회원을 탈퇴시키겠습니까??',
			   text: "삭제하시면 모플렉스의 모든 정보가 사라집니다!",
			   icon: 'warning',
			   showCancelButton: true,
			   confirmButtonColor: '#d33',
			   cancelButtonColor: '#c8c8c8',
			   confirmButtonText: '확인',
			   cancelButtonText: '취소'
			 }).then((result) => {
			   if (result.value) {
				   location.href = 'banMember.do?email='+${member.email};
			   }
			 })
		});
	
	$("#home_btn").click(function(){
		location.href = "userindex.do";
	});


	
	

</script>

<style>
.myinfo{
 border: 0;
 border-bottom: 1px solid #c8c8c8;
 background-color: white;
}
.form-control[readonly]{
	background-color: white;
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
        <br>
            <div class="container-fluid">
        <div class="card" style="min-height: 1080px">
		<div class="row" style="margin:2% 2% 15px 2%">
			<div class="col-sm-12" style="padding-left: 0">
				<h3 style="padding-left: 1%;">${member.name} <spring:message code="you.main" /></h3>
			</div>
		</div>
		<hr style="margin-top: 0">
	<form onsubmit="return pwdcheck()" action="editCheck.do" method="post" enctype="multipart/form-data">
		<div class="row" style="margin-left: 4%; margin-right: 2%; margin-top: 1%">
			<div class="media align-items-center mb-4">
					<c:choose>
						<c:when test="${img==null}">
							<img id="profiles" class="mr-3 img-circle" src="<c:url value='/resources/images/avatar/avatar.png' />" width="120" height="120" alt="" name="profile" style="cursor: pointer;" data-placement="bottom">
						</c:when>
						<c:otherwise>
                             <img id ="profiles" class="mr-3 img-circle" src="<c:url value='/user/profile/${img}' />" width="120" height="120" alt="" name="profile" style="cursor: pointer;" data-placement="bottom">
						</c:otherwise>
					</c:choose>
					<c:if test="${role=='ROLE_ADMIN'}">
					<div class="media-body">
                                        <input type="button" id="userDelete" class="btn" style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;margin-top: 3%;" value="<spring:message code="you.del" />"> 
                                        <c:if test="${member.isstop == 0}">
                                        <input type="button" id="userDisable" class="btn" style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;margin-top: 3%;" value="<spring:message code="you.able2" />"> 
                                        </c:if>
                                        <c:if test="${member.isstop == 1}">
                                        <input type="button" id="userAble" class="btn" style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;margin-top: 3%;" value="<spring:message code="you.able" />"> 
                                        </c:if>
                                    </div>            
					</c:if>            
                                </div>
		</div>
		<div class="row" style="margin-left: 4%; margin-top: 2%">
		<div class="form-group" style="width: 100%">   		
    		<br>
    		<label for="name"><spring:message code="admin.name" /></label>
    		<input class="form-control myinfo" type="text" id="name" name="name" style="width: 60%" placeholder="7자까지 입력가능합니다" value="${member.name}" disabled="disabled">
    		<br>
    		<label for="point"><spring:message code="admin.point" /></label>
    		<input class="form-control myinfo" type="text" id="point" name="point" style="width: 60%" value="${member.point} P" disabled="disabled">
    		<br>
    		<label for="mlike"><spring:message code="all.like" /></label>
    		<input class="form-control myinfo" type="text" id="point" name="mlike" style="width: 60%" value="${member.mlike} <spring:message code="you.ea" />" disabled="disabled">
    		<br>
    		<c:if test="${role=='ROLE_ADMIN'}">
    		<c:if test="${member.isstop == 0}">
    		<label for="mlike"><spring:message code="you.use" /></label>
    		<input class="form-control myinfo" type="text" id="point" name="isstop" style="width: 60%" value="<spring:message code="you.use2" />" disabled="disabled">
    		</c:if>
    		<c:if test="${member.isstop == 1}">
    		<label for="mlike"><spring:message code="you.use" /></label>
    		<input class="form-control myinfo" type="text" id="point" name="isstop" style="width: 60%" value="<spring:message code="you.ban" />" disabled="disabled">
    		</c:if>
    		</c:if>
    		<input type="button" id="home_btn" class="btn" style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;margin-top: 3%;" value="<spring:message code="you.home" />">   		
    		</div>
    		</div>
    		</form>	
    
    	</div>
    	
    	</div>
            <!-- #/ container -->
            </div>
            </div>
        
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
       <jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
        <!--**********************************
            Footer end
        ***********************************-->
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
</body>

</html>