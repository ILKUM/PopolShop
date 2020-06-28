<!-- 페이지에서 대부분 공통으로 쓰이는 head and left jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="role" value="${sessionScope.role}" />
<c:set var="count" value="${sessionScope.count}" />
<c:set var="img" value="${sessionScope.img}" />
<c:set var="status" value="${sessionScope.status}" />
<c:set var="email" value="${sessionScope.email}"/>
<c:set var="point" value="${sessionScope.point}"/>
<style>
input::placeholder {
   color: #fff;
}
.card{
	box-shadow: 0px 1px 10px 0px rgba(0, 0, 0, 0.5);
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta property="og:title" content>
<meta name="google-signin-client_id" content="806433148370-o0ss3i4kp8dhj6p0d2cvkdjfus8kivds.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js?onload=loadAuthClient" async defer></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href= 'https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css' rel='stylesheet'> 
<script src= "https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" ></script> 
<script type="text/javascript">
   $(function() {
	   for(let i=0; i<$('#memlist').children().length-1; i++){ //멘션에서 멤버리스트 불러올때 서로 다른 협업공간에 중복되는 유저 제거
			for(let j=i+1; j<$('#memlist').children().length;j++){
				if($('#memlist').children().eq(i).attr('id').split("/")[1] == $('#memlist').children().eq(j).attr('id').split("/")[1]){
					$('#memlist').children().eq(j).hide();
				}
			}
		}	

      //내정보 열기 (드롭다운)
      $('#myprofileEdit').click(function(){
    	  location.href="memberEdit.do?${sessionScope.email}";
          });
      
      //일반 회원 로그아웃 (드롭다운)
      $('#logout').click(function(){
			location.href="logout.do";
          });  

	 
	   
	});
					
	

     
</script>
<style>
.modal-content.modal-fullsize {
   height: auto;
   min-height: 100%;
   border-radius: 0;
   min-width: 950px;
   right: 230px;
}
/* The switch - the box around the slider */
.switch_alarm {
   position: relative;
   display: inline-block;
   width: 60px;
   height: 34px;
   vertical-align: middle;
}

/* Hide default HTML checkbox */
.switch_alarm input {
   display: none;
}


input:checked+.slider_alarm {
   background-color: #00D63D;
}

input:focus+.slider_alarm {
   box-shadow: 0 0 1px #00D63D;
}

input:checked+.slider_alarm:before {
   -webkit-transform: translateX(26px);
   -ms-transform: translateX(26px);
   transform: translateX(26px);
}

/* Rounded sliders */
.slider_alarm.round_alarm {
   border-radius: 34px;
}

.slider_alarm.round_alarm:before {
   border-radius: 50%;
}

span {
   margin: 0px;
   display: inline-block;
   font-size: 15px;
   font-weight: bold;
}
</style>

<!--**********************************
            Nav header start
        ***********************************-->
<c:choose>
<c:when test="${role == 'ROLE_USER'}">
<div id="pagelogo" class="nav-header">
   <div class="brand-logo">
      <a href="userindex.do" style="padding-top: 0px;"> <b
         class="logo-abbr"><img class="img-responsive center-block"
            src="<c:url value="/resources/images/logo/MoflexTitle.png" />"
            alt="mini"
            style="width: 100px; height: auto; padding-top: 0; margin-top: 30px;">
      </b> <span class="logo-compact"><img
            class="img-responsive center-block"
            src="<c:url value="/resources/images/logo/MOFLEXbig.png" />" alt=""
            style="margin-top: 20px; text-align: center;"></span> <span
         class="brand-title"> <img class="img-responsive center-block"
            src="<c:url value="/resources/images/logo/MOFLEXbig.png" />" alt=""
            style="margin-top: 3%;">
      </span>
      </a>
   </div>
</div>
</c:when>
<c:otherwise>
<div id="pagelogo" class="nav-header">
   <div class="brand-logo">
      <a href="userindex.do" style="padding-top: 0px;"> <b
         class="logo-abbr"><img class="img-responsive center-block"
            src="<c:url value="/resources/images/logo/MoflexTitle.png" />"
            alt="mini"
            style="width: 100px; height: auto; padding-top: 0; margin-top: 30px;">
      </b> <span class="logo-compact"><img
            class="img-responsive center-block"
            src="<c:url value="/resources/images/logo/MOFLEXbigPremium.png" />" alt=""
            style="margin-top: 20px; text-align: center;"></span> <span
         class="brand-title"> <img class="img-responsive center-block"
            src="<c:url value="/resources/images/logo/MOFLEXbigPremium.png" />" alt=""
            style="margin-top: 3%;">
      </span>
      </a>
   </div>
</div>
</c:otherwise>
</c:choose>
<!--**********************************
            Nav header end
        ***********************************-->

<!--**********************************
            Header start
        ***********************************-->
<div class="header">
   <div class="header-content clearfix">

      <div class="nav-control">
         <div class="hamburger">
            <span class="toggle-icon"><i class="icon-menu"></i></span>
         </div>
      </div>
      <div class="header-left">
         <div class="input-group icons">
            <div class="input-group-prepend">
               <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
                  id="searchSubmitIcon"><i class="mdi mdi-magnify" style="cursor: pointer;"></i></span>
            </div>
            <form action="searchMovie.do" id="searchSubmit">
            <input type="search" id="sIssue" name="word" class="form-control" placeholder="검색 후 Enter치세요"
               aria-label="Search">
            <input type="hidden" id="searchEmail" name="email" value=<%=session.getAttribute("email")%>>
            </form>          
               <c:choose>
                  <c:when test="${role == 'ROLE_ADMIN'}">
               <input type="button"class="form-control"
               style="background-color: #ba90c4; border-color: #CCCCCC; margin-left: 2%; color: #fff; cursor: pointer;width: 126px;"
               value="공지사항 작성" data-toggle="modal" data-target="#makenotice">
               <input type="button"class="form-control"
               style="background-color: #ba90c4; border-color: #CCCCCC; margin-left: 2%; color: #fff; cursor: pointer;width: 126px;"
               value="영화 추가" data-toggle="modal" data-target="#addMovie">
               </c:when>
               </c:choose>
            <div class="drop-down animated flipInX d-md-none">
               <form action="#">
                  <input type="text" class="form-control" placeholder="Search">
               </form>
            </div>
         </div>
      </div>
      <div class="header-right">
         <ul class="clearfix">
            <li class="icons dropdown d-none d-md-flex"><a
               href="javascript:void(0)" class="log-user" data-toggle="dropdown">
                  <span id="selectLang">${sessionScope.defaultlang}</span> <i class="fa fa-angle-down f-s-14"
                  aria-hidden="true"></i>
            </a>
               <div
                  class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                  <div class="dropdown-content-body">
                     <ul>
                        <li><a href="userindex.do?lang=ko" >한국어</a></li>
                        <li><a href="userindex.do?lang=en" >English</a></li>
                     </ul>
                  </div>
               </div></li>
               <li class="icons dropdown d-none d-md-flex"><i
               class="fas fa-envelope" data-toggle="modal" id="inviteModal_id"
               data-target="#adminMail"
               style="cursor: pointer; color: #535359; font-size: 18px; padding-bottom: 12px;"></i>
            </li>
            <li class="icons dropdown">
               <div class="user-img c-pointer position-relative"
                  data-toggle="dropdown">
                  <span class="activity active"></span>
                  <c:choose>
                  	<c:when test="${img==null}">
                  <img src="<c:url value="/resources/images/avatar/avatar.png" />"
                     height="40" width="40" alt="">
                  	</c:when>
                  	<c:otherwise>
                  	<img src="<c:url value="/user/profile/${img}" />"
                     height="40" width="40" alt="">
                  	</c:otherwise>
                  </c:choose> 
               </div>
               <div
                  class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                  <div class="dropdown-content-body">
                     <ul>
                        <li>
                        	<span id="myprofileEdit" style="cursor: pointer;">
                        	<span class="icon-user"></span> 
                        	<span>&nbsp;&nbsp;내 정보</span>
                        	</span>
                        </li>
                        <li>
                        	<span id="couponopen" style="cursor: pointer;">
                        	<span class="iconify" data-icon="emojione-monotone:admission-tickets" data-inline="false" style="font-size: 15px"></span> 
                        	<span>&nbsp;&nbsp;쿠폰 등록</span>
                        	</span>
                        </li>
                        <li>
                        	<span id="couponopen" style="cursor: pointer;">
                        	<span class="iconify" data-icon="emojione-monotone:money-with-wings" data-inline="false" style="font-size: 15px"></span> 
                        	<span>&nbsp;&nbsp;<%=session.getAttribute("point")%>P</span>
                        	</span>
                        </li>
                          		<li>
                          			<span id="logout" style="cursor: pointer;">
                              			<span class="iconify" data-icon="bx:bx-door-open" data-inline="false" style="font-size: 15px"></span> 
                              			<span>&nbsp;&nbsp;로그아웃</span>
                              		</span>
                              	</li>						                    
                     </ul>
                  </div>
               </div>
            </li>

         </ul>
      </div>
   </div>
</div>
<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

<!--**********************************
            Sidebar start
        ***********************************-->
<c:set var="email" value="${session.email}}"></c:set>

<div class="nk-sidebar" style="z-index: 0; padding-bottom: 0px;">
   <div id="scnav" class="nk-nav-scroll">
      <ul class="metismenu" id="menu">
         <li class="nav-label" style="padding-bottom: 10px;">
         <b style="padding-bottom: 2%;font-size:15px;"><spring:message code="boardtitle" /></b></li>
         <%-- <li><a href="dashboard.do" aria-expanded="false"><span class="iconify" data-icon="ps:megaphone" data-inline="false"></span>
         <span class="nav-text">
                  &nbsp;<spring:message code="dashboard" /></span> <!-- <i class="icon-speedometer menu-icon"> -->
         </a></li> --%>
         <li><a href="notice.do" aria-expanded="false"><span class="iconify" data-icon="ps:megaphone" data-inline="false"></span>
         <span class="nav-text">
                  &nbsp;<spring:message code="notice" /></span> <!-- <i class="icon-speedometer menu-icon"> -->
         </a></li>
         <%-- <li><a href="userindex.do" aria-expanded="false"> <span
               class="iconify" data-icon="mdi:bulletin-board" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;<spring:message code="freeboard" /></span> <!-- <i class="icon-speedometer menu-icon"> -->
         </a></li> --%>
         <li><a href="recom.do" aria-expanded="false"> <span
               class="iconify" data-icon="bx:bx-like"
               data-inline="false" style="width: 17px; height: auto;font: bold;"> </span><span
               class="nav-text"> &nbsp;<spring:message code="like" /></span>
         </a></li>
         <li><a href="review.do" aria-expanded="false"> <span
               class="iconify" data-icon="ic:outline-rate-review" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;<spring:message code="review" /></span>
         </a></li>     
         <li><a href="file.do" aria-expanded="false"> <span class="iconify" data-icon="mdi:cloud-upload" 
         data-inline="false" style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;<spring:message code="uploads" /></span>
         </a></li>     
         <li class="nav-label" style="padding-bottom: 0"><b><spring:message code="private.title" /></b></li>
         <li><a href="history.do" aria-expanded="false"> <span
               class="iconify" data-icon="ic:baseline-history" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;<spring:message code="historys" /></span>
         </a></li>
         <li><a href="writeMyRecom.do" aria-expanded="false"> <span class="iconify" data-icon="jam:write"
          data-inline="false" style="width: 20px; height: auto;"></span><span class="nav-text">
             &nbsp;<spring:message code="mywrites" /></span>
         </a></li>
         <c:if test="${role == 'ROLE_ADMIN'}">
          <li><a href="admin.do" aria-expanded="false"> <span
               class="iconify" data-icon="wpf:administrator" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;<spring:message code="admin" /></span>
         </a></li>
         </c:if>
         <c:if test="${role == 'ROLE_CHARGE' or role == 'ROLE_ADMIN'}">
         <li><a href="wishlist.do?email=${sessionScope.email}" aria-expanded="false" id="wish"> <span
               class="iconify" data-icon="el:heart" data-inline="false" id="wish"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;<spring:message code="wish" /></span>
         </a></li>
         </c:if>       
        <li class="nav-label" style="padding-bottom: 0"><b><spring:message code="movietitle" /></b></li>
               <li><a href="koreaGet.do" aria-expanded="false"> <span
               class="iconify" data-icon="bx:bxs-camera-movie" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;<spring:message code="korea" /></span>
         </a></li>    
               <li><a href="americanGet.do" aria-expanded="false"> <span
               class="iconify" data-icon="bx:bxs-camera-movie" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;<spring:message code="american" /></span>
         </a></li>    
               <li><a href="chinaGet.do" aria-expanded="false"> <span
               class="iconify" data-icon="bx:bxs-camera-movie" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;<spring:message code="china" /></span>
         </a></li>    
               <li><a href="europeGet.do" aria-expanded="false"> <span
               class="iconify" data-icon="bx:bxs-camera-movie" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;<spring:message code="europe" /></span>
         </a></li>    
               <li><a href="japanGet.do" aria-expanded="false"> <span
               class="iconify" data-icon="bx:bxs-camera-movie" data-inline="false"
               style="width: 20px; height: auto;"> </span><span class="nav-text">
                  &nbsp;<spring:message code="japan" /></span>
         </a></li>    
      </ul>
   </div>
</div>
<!--**********************************
            Sidebar end
        ***********************************-->
<!-- 
              협업공간 만들기 모달 생성
         -->
<style>
.createmodal {
   border: 1px solid rgba(0,0,0,0.5);
   background-color: white;
}
</style>

   <div class="list-group" id="mentionlist" style="display: none;border:10px solid #cbc9d4">
      <a href="#" class="list-group-item list-group-item-action menli" id="men1"style="padding: 5px;">@ 멘션</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men2"style="padding: 5px"><span class="iconify" data-icon="whh:googledrive" data-inline="false"></span> 구글 드라이브</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men3"style="padding: 5px"><span class="iconify" data-icon="si-glyph:file-box" data-inline="false"></span> 파일</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men4"style="padding: 5px"><span class="iconify" data-icon="bx:bx-check-circle" data-inline="false"></span> 할 일</a> 
      <a href="#" class="list-group-item list-group-item-action menli" id="men5"style="padding: 5px"><span class="iconify" data-icon="bx:bx-calendar" data-inline="false"></span> 일정</a>
   </div>
   <!--  -->
<div class="modal fade" id="makenotice">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h3 class="modal-title">공지사항 작성</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
   
         <form action="noticeWrite.do" method="POST" onsubmit="return checknotice()">
            <!-- Modal body -->
            <div class="modal-body">
               <!-- <p style="font-size: 12px">협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br>
             협업공간을 만들고 함께 일할 멤버들을 초대해보세요.</p> -->
               <label for="notitle">공지사항</label> <input
                  class="form-control createmodal" type="text" id="notitle"
                  name="notitle" style="width: 100%;border-radius: 0.5rem;" placeholder="제목을 입력해 주세요.">
               <br> <label for="noticecontent">공지 설명</label>
               <textarea class="form-control createmodal" rows="5"
                  id="nocontent" name="nocontent" style="width: 100%"
                  placeholder="내용을 적어주세요."></textarea>   
                  <input type="hidden" name="email" value="${sessionScope.email}">      
            <!-- Modal footer -->
            <div class="modal-footer">
               <button type="submit" class="btn btn-secondary"
                  style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;">만들기</button>
               <button type="button" class="btn btn-secondary"
                  style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;"
                  data-dismiss="modal">취소</button>
               </div>
            </div>
         </form>
      </div>
   </div>
   </div>
   <div class="modal fade" id="adminMail">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content modal-fullsize"
         style="border-radius: 0.5rem;">
         <!-- Modal Header -->
         <div class="modal-header" style="padding-bottom: 0px;height: 67px;">
            <h5 style="padding-top: 2%; padding-left: 5px;"><spring:message code="invite.title" /></h5>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>

         <!-- Modal body -->
         <form action="mailSending.do" method="post">
         
            <div class="row" style="margin-bottom: 1%;" id="inviteContent">
               <div class="col-sm-6"
                  style="border-right: 1px solid rgba(0,0,0,0.5); padding-left: 20px;">
                  <div class="modal-body">
                     <p style="font-size: 12px">
		              <spring:message code="invite.content1" /><br> 
		              <spring:message code="invite.content2" />
                     </p>
                     <label for="title"><spring:message code="invite.subject" /></label> 
                     <input class="form-control createmodal" type="text" id="invite_Submit" style="width: 100%; border-radius: 0.25rem;" value="모플렉스" name="tosend" disabled="disabled">
                     <p style="font-size: 13px; margin-top: 2%; margin-left: 1%;">
                     	<spring:message code="invite.subcon" />
                     </p>
                     <div id="invite_email_append"
                        style="min-width: 35%; border: 1px solid #c8c8c8; border-radius: 0.25rem; background-color: #fff; display: none; position: absolute; top: 145px; left: 18px;">

                     </div>
                     <label for="content"><spring:message code="invite.team" /></label> 
                     <select id="select_invite" name="mtitle" class="form-control" style="border-radius: 0.25rem;">                     
                           <option value="버그제보(Bug Report)"><spring:message code="mail.sel1" /></option>                    
                           <option value="모플렉스 문의 (Moflex Inquiry)"><spring:message code="mail.sel2" /></option>                    
                           <option value="모플렉스 피드백(Moflex FeedBack)"><spring:message code="mail.sel3" /></option>                    
                     </select>
                     <label for="tohave" style="margin-top: 8px;"><spring:message code="mail.have" /></label>
                    <input class="form-control createmodal" type="text" id="tohave" style="width: 100%; border-radius: 0.25rem;" value="${sessionScope.email}" name="tohave"> 
                  </div>
               </div>
               <div class="col-sm-6">
                  <label for="content" style="margin-top: 3%; margin-bottom: 0px;">
                  	<spring:message code="invite.list" />
                  </label>
                  <div id="invite_Input"
                     style="border: 2px solid rgba(0,0, 0, 0.3); border-radius: 0.5rem; margin-right: 3%; height: 280px; overflow: auto; margin-bottom: 10px;">
                     <textarea style="width:437px;height: 270px;resize: none;" name="mcontent"></textarea>
                  </div>
                  <input type="submit" class="btn btn-secondary" id="invitebtn" value="<spring:message code="invite.invite" />"
                     style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer; margin-left: 100px; padding-left: 75px; padding-right: 75px;">
               </div>
            </div>
</form>


      </div>
   </div>
</div>
<div class="modal fade" id="couponon">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h3 class="modal-title">쿠폰 등록</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
   
         <form onsubmit="return checkCoupon()" action="couponReg.do" method="POST">
            <!-- Modal body -->
            <div class="modal-body">
               <!-- <p style="font-size: 12px">협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br>
             협업공간을 만들고 함께 일할 멤버들을 초대해보세요.</p> -->
               <label for="cotitle">쿠폰번호</label> <input
                  class="form-control createmodal" type="text" id="couponnum"
                  name="coupon" style="width: 100%;border-radius: 0.5rem;" placeholder="번호 입력해주세요.">                
                  <input type="hidden" name="email" value="${sessionScope.email}">      
                  <input type="hidden" id="cpoint" name="cpoint" value="${sessionScope.cpoint}">      
            <!-- Modal footer -->
            <div class="modal-footer">
               <button type="submit" class="btn btn-secondary"
                  style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;">등록</button>
               <button type="button" class="btn btn-secondary"
                  style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;"
                  data-dismiss="modal">취소</button>
               </div>
            </div>
         </form>
      </div>
   </div>
   </div>
   
   <div class="modal fade" id="addMovie">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" align="center">
          <h4><label for="validationTextarea">영화 추가</label></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form class="was-validated" action="insertMovie.do" enctype="multipart/form-data" method="Post">
          
          <div class="form-label-group" text-align="center" align="center">
        	<img id="profile" name="mophoto" src="<c:url value="/resources/images/default/default.jpg" />" width="15%" height="15%" align="center" >
         </div>
  		
                            
  <hr class="my-4">
     <div class="row">
    <div class="col" width="33%" align="center" >영화 사진</div>
    <div class="col" width="33%" align="center">개봉 날짜</div>
    <hr class="my-4">
    <div class="w-100"></div>
    <div class="col" width="33%">
      <div class="custom-file">
       <input type="file" name="filesrc" id="Photo" accept="image/*" class="custom-file-input" required>
      <label class="custom-file-label" for="validatedCustomFile">영화사진</label>
      <div class="invalid-feedback">선택해주세요 영화 포스터를</div>
    </div>
    </div>

    <div class="col" width="33%">
      <div class="form-label-group">
        <input type="date" id="servdate" name="modate" class="form-control" required>
        <label class="custom-date-label" for="validatedCustomDate"></label>
  </div>
    </div>
    </div>
       <div class="form-label-group">
        <label for="validationTextarea">영화 가격</label>
        <input type="text" id="mpoint" name="mpoint" class="form-control is-invalid" placeholder="포인트를 입력 해주세요." required="required" style="width: 50%;" numberOnly>
  </div>
    <hr class="my-4">
     <select id="monum" name="monum" class="form-control">                
                           <option value="1">한국영화</option>
                            <option value="2">미국영화</option>
                             <option value="3">중국영화</option>
                              <option value="4">유럽영화</option>
                               <option value="5">일본영화</option>
     </select>
  <div class="form-label-group">
        <label for="validationTextarea">영화 제목</label>
        <input type="text" id="title" name="moname" class="form-control is-invalid" placeholder="영화 제목을 입력해주세요" required="required">
  </div>
    <div class="form-label-group">
        <label for="validationTextarea">영화 감독</label>
        <input type="text" id="release" name="modirector" class="form-control is-invalid" placeholder="영화 감독을 입력해주세요" required="required">
  </div>  
  <div class="mb-3">
    <label for="validationTextarea">영화 설명</label>
    <textarea class="form-control is-invalid" id="comment" name="mocontent" placeholder="영화 설명 300자이내로 설명해주세요." required></textarea>
    <div class="invalid-feedback">
    </div>
  </div>
  <input type="text" name="monum" class="form-control is-invalid" hidden="" value="0">
  <input type="text" name="iswish" class="form-control is-invalid"  hidden="" value="0">
    <button class="btn btn-sm btn-primary btn-block" type="submit" width="30%">추가하기</button>
        <br>
      <button class="btn btn-sm btn-primary btn-block" data-dismiss="modal" width="30%">닫기</button>
</form>
        </div>
        
      </div>
    </div>
    
    
  </div>
  
<script type="text/javascript">
		//내정보 열기 (드롭다운)
		$('#myprofileEdit').click(function(){
	  location.href="memberEdit.do?${sessionScope.email}";
		    });
	
		//쿠폰 열기
	      $('#couponopen').click(function(){
	    	  $('#couponon').modal();
	          });


//일반 회원 로그아웃 (드롭다운)
$('#logout').click(function(){
		location.href="logout.do";
    });  

$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});


//사진 변경
$(function(){
	
	$('#Photo').change(function(){
		var reader = new FileReader();
		
		reader.onload = function(e) {
			
			document.getElementById("profile").src = e.target.result;
		};
		
		reader.readAsDataURL(this.files[0]);
	});
	

});

//공지사항작성 validation
function checknotice() {
	  //이슈 제목 공백 확인
    if($("#notitle").val() == ""){
       Swal.fire("제목을 입력해주세요.");
      $("#notitle").focus();
      return false;
    }

    //이슈 설명 공백 확인
    if($("#nocontent").val() == ""){
       Swal.fire("내용을 입력해주세요.");
      $("#nocontent").focus();
      return false;
    }
    
return true;
} 

function checkCoupon() {
//쿠폰번호 공백 확인
 if($("#couponnum").val() == ""){
    Swal.fire("번호를 입력해주세요.");
   $("#couponnum").focus();
   return false;
 }
	
if($("#couponnum").val() !="50005000"){
	Swal.fire("번호를 확인해주세요.");
	return false;
}

if($("#cpoint").val() == 1) {
	Swal.fire({
		  title : '등록 실패',
		  text : '이미 쿠폰을 등록 하셨습니다.',
		  icon : 'warning',
		  confirmButtonColor: '#d33'
	})
	return false;
}

Swal.fire({
	  title : '등록 성공',
	  text : '쿠폰이 등록 되었습니다.',
	  icon : 'success',
	  confirmButtonColor: '#d33'
})
	return true;
} 
</script>