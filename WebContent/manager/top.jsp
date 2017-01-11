<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="short icon" href="" />
<link rel="stylesheet" href="../css/home.css" />
<link rel="stylesheet" href="../css/semantic.min.css" />
<style type="text/css">
.top_name{
	width:502px;
	height:40px;
	position:absolute;
	right:0px;
}
.top_name li{
	float:left;
	width:86px;
	height:40px;
	line-height:40px;
	color:#fff;
	list-style:none;
}
</style>

</head>
<body>
<%if(session.getAttribute("m_name")!=null){%>
<div id="top">
		<ul class="top_name" >
			<li align="right">管理员：</li>
			<li align="left"><%=session.getAttribute("m_name") %></li>
			<li align="right">账户：</li>
			<li align="left"><%=session.getAttribute("m_tell") %></li>
			<li align="center"><a href="login.html"><button class="ui button">退出</button></a></li>
		</ul>
	</div>
	<div id="menu">
		<div class="uii" id="menu1">
			<a href="TpageAction?pageNow=1"><button class="ui button">教员信息管理</button></a>
			<a href="StudentpageAction?pageNow=1"><button class="ui button">学员需求管理</button></a>
			<a href="OrderAction?pageNow=1"><button class="ui button">订单管理</button></a>
			<a href="FeedbackAction?pageNow=1"><button class="ui button">留言管理</button></a>
		</div>
	</div>
	<%}else{%>
		<script type="text/javascript">
    		alert("登陆已过期,请先登录！");
    		window.open("login.html","_parent");
    	</script>
	<%}%>
</body>
</html>