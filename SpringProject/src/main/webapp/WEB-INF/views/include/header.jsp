<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/CommonStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberHeaderStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberStyle.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css">
<link rel="stylesheet" href="resources/css/include.css?after">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">

function showSearch(){
	if(document.getElementById('search').style.display == 'block'){
		document.getElementById('search').style.display = 'none';
		document.getElementById('search-btn').style.display = 'block';
	}else {
		document.getElementById('search').style.display = 'block';
		document.getElementById('search-btn').style.display = 'none';
	}
}

$(document).mouseup(function(e){
	var content = $("#search");
	 
	if(content.has(e.target).length === 0){
		content.hide();
		$("#search-btn").show();
	}
});

$(document).ready(function(){ 
	$("#toggle_btn").mouseover(function(){ 
		if($("#hidden_list").is(":visible")){ 
			$("#hidden_list").slideUp(); 
		}else{ 
			$("#hidden_list").slideDown(); 
		} 
	}); 
});

</script>
<body>

	<div class="layout_container">
		
		<div class="header_desktop header">
			
			<a href="<%=request.getContextPath()%>/main.do" class="site_logo">[LOGO]</a>
			
			<div class="menu_wrap">
				
					<a href="<%=request.getContextPath()%>/about.do">ABOUT</a>
					<a href="<%=request.getContextPath()%>/product_list.do">SHOP</a>
					<a href="<%=request.getContextPath()%>/review_list.do">REVIEW</a>
					<a href="<%=request.getContextPath() %>/admin_list.do">관리자</a>
					
					<a id="search-btn" href="javascript:void(0)" onclick="showSearch();">검색</a>
					<div id="search" style="display: none;">
						<form method="post" action="product_search.do" >			
								<input type="search" name="k" placeholder="${keyword }">
								<input type="submit" value="검색"> 
						</form>
					</div>
					
					<c:set var="dto" value="${session_mem }"/>
					
					<c:if test="${empty dto }">
						<a href="<%=request.getContextPath()%>/login.do">LOGIN</a>
						<a href="<%=request.getContextPath()%>/cart.do">장바구니</a>
					</c:if>
					
					<c:if test="${!empty dto }">
						<input type="hidden" name="id" value="${dto.getMem_id() }">
						<a href="<%=request.getContextPath()%>/logout.do">LOGOUT</a>
						<c:set var="id" value="${session_id }"  />
						<a href="<%=request.getContextPath()%>/member_home.do">MYPAGE</a>
						<a href="<%=request.getContextPath()%>/cart.do">장바구니</a>
						${dto.getMem_name() }님 환영합니다. 
					</c:if>
					
					<div id="drop_menu">
						<span id="toggle_btn">고객센터</span>
						<ul id="hidden_list">
							<li><a href="#">자주하는 질문</a></li>
							<li><a href="#">1:1 문의</a></li>
							<li><a href="#">공지사항</a></li>
						</ul>
					</div>
			</div>
			
		</div>
		
	</div>

</body>
</html>