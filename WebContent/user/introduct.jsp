<%@ page language="java" import="java.util.*,com.article.web.ArticleBean" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>美文阅读</title>
	<link rel="short icon" href="images/logo.png" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styleindex.css">
	<link rel="stylesheet" type="text/css" href="css/introduct.css">
 	<link rel="stylesheet" type="text/css" href="css/introduct.css">
 	<script type="text/javascript" src="js/introduct.js"></script>
</head>
<body>
    <% 
    String name=(String)session.getAttribute("name");
    String role=(String)session.getAttribute("role");
    if(name!=null){
    	%>
    <div id="top" name="top1">
    	<%
    		if(role.equals("教员")){
    	%>
    	<a href="teacher/set_teacher.jsp" id="topd">您好&nbsp;&nbsp;<font style="font-size:18px"><%=name %></font></a>
    	<a href="login.html" id="topz">│退出</a>
    	<%
    		}else{
    	%>
    	<a href="student/set_request.jsp" id="topd">您好<%=name %></a>
    	<a href="login.html" id="topz">│退出</a>
       <%} %>
    </div>
    <% 
    }else{
    %>
    <div id="top" name="top1">
       <a href="login.html" id="topd">登录</a>
       <a href="regester.html" id="topz">│注册</a>
    </div>
    <%} %>
<!--nav-->
<div id="nav">
    <a href="index.jsp" onclick="dh(this)">易教首页</a>
    <a href="StudentpageAction?pageNow=1">学员需求</a>
    <a href="TpageAction?pageNow=1">找教员</a>
    <a href="user/introduct.jsp" onclick="dh(this)">平台介绍</a>
    <a href="ArticleAction" onclick="dh(this)">美文欣赏</a>
    <a href="javascript:;" onclick="dh(this)">关于我们</a>
    <a href="FeedbackAction?pageNow=1">反馈</a>
</div>
    
    <div class="feature">
		<h1></h1>
		<div class="content">
			<ul>
				<li class="bb nL">
					<img class="img1" src="user/images/s1.png" alt="" />
					<img class="img2" src="user/images/s2.png" alt="" />
					<span>家长更省 老师更赚</span>
				</li>
				<li class="bb">
					<img class="img1" src="user/images/s3.png" alt="" />
					<img class="img2" src="user/images/s4.png" alt="" />
					<span>双向评价 信用积累</span>
				</li>
				<li class="bb">
					<img class="img1" src="user/images/s5.png" alt="" />
					<img class="img2" src="user/images/s6.png" alt="" />
					<span>手机应用 随时随地</span>
				</li>
				<li class="bb">
					<img class="img1" src="user/images/s7.png" alt="" />
					<img class="img2" src="user/images/s8.png" alt="" />
					<span>附近名师 一搜即得</span>
				</li>
				<li class="nL">
					<img class="img1" src="user/images/s9.png" alt="" />
					<img class="img2" src="user/images/s10.png" alt="" />
					<span>实名认证 师资保证</span>
				</li>
				<li>
					<img class="img1" src="user/images/s11.png" alt="" />
					<img class="img2" src="user/images/s12.png" alt="" />
					<span>学费托管 支付安全</span>
				</li>
				<li>
					<img class="img1" src="user/images/s13.png" alt="" />
					<img class="img2" src="user/images/s14.png" alt="" />
					<span>技术领先 资料保密</span>
				</li>
				<li>
					<img class="img1" src="user/images/s15.png" alt="" />
					<img class="img2" src="user/images/s16.png" alt="" />
					<span>精英团队 专业服务</span>
				</li>
			</ul>
		</div>
	</div>
    <!-- 平台流程开始 -->
	<div class="process">
		<h1 ></h1>
		<div class="content">
		</div>
	</div>
	<!-- 平台流程结束 -->
  <!-- 上课方式开始 -->
	<div class="lesson">
		<h1></h1>
		<div class="Lcontent">
			<ul>
				<li>
					<img class="img2" src="user/images/s20.png" alt="" />
					<span>家长更省 老师更赚</span>
				</li>
				<li>
					<img class="img2" src="user/images/s21.png" alt="" />
					<span>家长更省 老师更赚</span>
				</li>
				<li style="margin-right:0px;">
					<img class="img2" src="user/images/s22.png" alt="" />
					<span>家长更省 老师更赚</span>
				</li>
			</ul>
		</div>
	</div>
	<!-- 上课方式结束 -->
  	<!-- 底部开始 -->
    <div class="bottom" style="margin-top:0px;">
      <ul class="bottom-left">
        <li>
          <ul>
            <li class="titles">关于易教</li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">加入我们</a></li>
            <li><a href="#">友情链接</a></li>
          </ul>
        </li>
        <li>
          <ul>
            <li class="titles">帮助中心</li>
            <li><a href="#">意见反馈</a></li>
            <li><a href="#">投诉中心</a></li>
            <li><a href="#">服务说明</a></li>
          </ul>
        </li>
        <li>
          <ul>
            <li class="titles">平台特色</li>
            <li><a href="#">安全可靠</a></li>
            <li><a href="#">四大保障</a></li>
            <li><a href="#">四大优势</a></li>
          </ul>
        </li>
        <li>
          <ul>
            <li class="titles">关注我们</li>
            <li><a href="#">官方微信</a></li>
            <li><a href="#">新浪微博</a></li>
            <li><a href="#">腾讯微博</a></li>
          </ul>
        </li>
      </ul>
      <ul class="bottom-right">
        <li class="phone"></li>
        <li class="code">4008-310-100</li>
        <li>周一至周日 9:00-23:00</li>
        <li>（仅收市话费）</li>
      </ul>
      <p>Copyright ©2017-2018 民大易教网版权所有 - <a href="http://www.miitbeian.gov.cn/" target="blank_">辽ICP备16019394号</a></p>
    </div><!-- 底部结束 -->
  
  
  	
</body>
</html>