<!-- 내정보 jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
    <c:set var="img" value="${sessionScope.img}" />
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
<script>

	//회원정보 유효성검사
	function pwdcheck() {
			var getCheck = RegExp(/^[a-zA-Z0-9]{8,16}$/);
			var getName= RegExp(/^[가-힣|a-z|A-Z]+$/);
			if($('#name').val().length>7){
				alert("name은 7자 까지 입력가능합니다.")
				return false;
			}
			
			 //이름 유효성
		      if (!getName.test($("#name").val())) {
		    	Swal.fire("이름 형식에 맞게 입력해주세요.");
		        $("#name").val("");
		        $("#name").focus();
		        return false;
		      }
		    //이름 공백 확인
		      if($("#name").val() == ""){
		    	Swal.fire("이름을 입력해주세요");
		        $("#name").focus();
		        return false;
		      }
		      if($("#name").val() == "운영자"){
		          alert("이 이름은 사용할 수 없습니다.");
		          $("#name").focus();
		          return false;
		        }
		      
		      if($("#name").val() == "관리자"){
		          alert("이 이름은 사용할 수 없습니다.");
		          $("#name").focus();
		          return false;
		        }
		      
		      if($("#name").val() == "ADMIN"){
		          alert("이 이름은 사용할 수 없습니다.");
		          $("#name").focus();
		          return false;
		        }
		      
		      if($("#name").val() == "책임자"){
		          alert("이 이름은 사용할 수 없습니다.");
		          $("#name").focus();
		          return false;
		        }
		      
		      if($("#name").val() == "모플렉스"){
		          alert("이 이름은 사용할 수 없습니다.");
		          $("#name").focus();
		          return false;
		        }
		      
		      if($("#name").val() == "섹스"){
		          alert("성적인 단어는 사용할 수 없습니다.");
		          $("#name").focus();
		          return false;
		        }
		      
		      if($("#name").val() == "SEX"){
		          alert("성적인 단어는 사용할 수 없습니다.");
		          $("#name").focus();
		          return false;
		        }
		      
		      if($("#name").val() == "보지"){
		          alert("성적인 단어는 사용할 수 없습니다.");
		          $("#name").focus();
		          return false;
		        }
		      
		      if($("#name").val() == "운영"){
		          alert("이 이름은 사용할 수 없습니다.");
		          $("#name").focus();
		          return false;
		        }
		      
		      if($("#name").val() == "잠지"){
		          alert("성적인 단어는 사용할 수 없습니다.");
		          $("#name").focus();
		          return false;
		        }
		 
		      if($("#name").val() == "자지"){
		          alert("성적인 단어는 사용할 수 없습니다.");
		          $("#name").focus();
		          return false;
		        }
		      
			
			//회원가입 시 메일 보낼 때 얼럿창


	   		
   			Swal.fire({
   				  icon: 'success',
   				  title: '정보수정 완료!',
   				  showConfirmButton: false,
   				  timer: 2000
   				})
			return true;
	}


	function getOutMember(){
	 Swal.fire({
		   title: '정말로 회원 탈퇴하시겠습니까??',
		   text: "삭제하시면 모플렉스의 모든 정보가 사라집니다!",
		   icon: 'warning',
		   showCancelButton: true,
		   confirmButtonColor: '#d33',
		   cancelButtonColor: '#c8c8c8',
		   confirmButtonText: '확인',
		   cancelButtonText: '취소'
		 }).then((result) => {
		   if (result.value) {
			   location.href = 'memberDelete.do';
		   }
		 })
		}

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
				<h3 style="padding-left: 1%;"><spring:message code="my.main" /></h3>
			</div>
		</div>
		<div class="row" style="margin-left: 2%;">
			<ul class="nav nav-pills">
			    <li class="nav-item">
			      <a class="nav-link" href="memberEdit.do?${sessionScope.email}" style="color: #ba90c4;"><spring:message code="my.main" /></a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="paymentPage.do"><spring:message code="my.main2" /></a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="javascript:getOutMember();"><spring:message code="my.main3" /></a>
			    </li>
		    </ul>
		</div>
		<hr style="margin-top: 0">
		
	<form onsubmit="return pwdcheck()" action="memberEditCheck.do" method="post" enctype="multipart/form-data" >
		<div class="row" style="margin-left: 4%; margin-right: 2%; margin-top: 1%">
			<div class="media align-items-center mb-4 filebox">
					<c:choose>
						<c:when test="${img==null}">
							<img id ="profiles" class="mr-3 img-circle" src="<c:url value='/resources/images/avatar/avatar.png' />" width="120" height="120" alt="" name="profile" style="cursor: pointer;" data-placement="bottom">						 
							<input type="file" name="filesrc" id="Photo" accept="image/*" onchange="readURL(this);" >
						</c:when>
						<c:otherwise>
                             <img id ="profiles" class="mr-3 img-circle" src="<c:url value='/user/profile/${img}' />" width="120" height="120" alt="" name="profile" style="cursor: pointer;" data-placement="bottom">
                             <input type="file" name="filesrc" id="Photo" accept="image/*" onchange="readURL(this);" >
                     
						</c:otherwise>
					</c:choose>
                                    <div class="media-body">
                                        <h3 class="mb-0" style="padding-left: 2%;">${member.name}</h3>
                                        <p class="mb-0" style="margin-left: 2%; width: 300px;color:#ba90c4; ">${member.email}</p>
                                    </div>
                                </div>
		</div>
		<div class="row" style="margin-left: 4%; margin-top: 2%">
		<div class="form-group" style="width: 100%">
    		<label for="email"><spring:message code="admin.email" /></label>
    		<input class="form-control myinfo" type="text" id="email" name="email" style="width: 60%" readonly="readonly" value="${member.email}">
    		<br>		
    		<label for="pwd"><spring:message code="my.pwd" /></label>
    		<input class="form-control myinfo" type="password" id="pwd" name="pwd" style="width: 60%" ><br>
    		<label for="pwdchk"><spring:message code="my.pwd2" /></label>
    		<input class="form-control myinfo" type="password" id="pwdchk" name="pwdchk" style="width: 60%" >   	
    		<div id="chkmsg" style="color: green;"><br></div>
    		<br>
    		<label for="name"><spring:message code="admin.name" /></label>
    		<input class="form-control myinfo" type="text" id="name" name="name" style="width: 60%" placeholder="7자까지 입력가능합니다" value="${member.name}">
    		<br>
    		<label for="rank"><spring:message code="admin.rank" /></label>
    		<c:choose>
    		<c:when test="${role=='ROLE_ADMIN'}">
    		<input class="form-control myinfo" type="text" style="width: 60%" value="<spring:message code="admin.rank1" />">
    		</c:when>
    		<c:when test="${role=='ROLE_CHARGE'}">
    		<input class="form-control myinfo" type="text" style="width: 60%" value="<spring:message code="admin.rank2" />">
    		</c:when>
    		<c:otherwise>
    		<input class="form-control myinfo" type="text" style="width: 60%" value="<spring:message code="admin.rank3" />">
    		</c:otherwise>
    		</c:choose>
    		<br>
    		<label for="point"><spring:message code="admin.point" /></label>
    		<input class="form-control myinfo" type="text" name="point" style="width: 60%" value="${member.point} P" disabled="disabled">
    		<br>   
    		<label for="mlike"><spring:message code="all.like" /></label>
    		<input class="form-control myinfo" type="text" name="mlike" style="width: 60%" value="${member.mlike} <spring:message code="you.ea" />" disabled="disabled">
    		<input type="submit" id="address_btn" class="btn" style="background-color: #ba90c4; border-color: #CCCCCC; color: #fff; cursor: pointer;margin-top: 3%;" value="<spring:message code="all.submit3" />">
    		
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
	<script type="text/javascript">
	$(function(){
   		
   		$('#pwd').keypress(function(event) {
	if(event.keyCode==13){
		$('#pwdchk').focus();
	}
});
$('#pwdchk').keypress(function(){
	if(event.keyCode==13){
		$('#pwdBtn').submit();
	}
});
$('#pwd').keyup(function(){
	console.log('pwd');
	let pwd = $('#pwd').val();
	let chk = $('#pwdchk').val();
	
	if(chk != "") {
		if(pwd != chk){
			$('#chkmsg').empty().css("color", "red").text('비밀번호가 일치하지 않습니다.');
		} else{
			$('#chkmsg').empty().css("color", "#069e03").text('비밀번호가 일치합니다.');
		} 
	}
	if(pwd == "" && chk == ""){
		$('#chkmsg').empty().append('<br>');
	}
});

$('#pwdchk').keyup(function(event) {
	console.log('pwdchk');
	let pwd = $('#pwd').val();
	let chk = $('#pwdchk').val();

	if(pwd != chk){
		$('#chkmsg').empty().css("color", "red").text('비밀번호가 일치하지 않습니다');
	} else{
		$('#chkmsg').empty().css("color", "#069e03").text('비밀번호가 일치합니다');
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
		
	</script>
</body>

</html>