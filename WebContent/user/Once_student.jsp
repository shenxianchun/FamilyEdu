<%@ page language="java" import="java.util.*,com.soft.Bean.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>易教学员个人主页</title>
    <link rel="short icon" href="images/logo.png" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styleindex.css">
	<link type="text/css" rel="stylesheet" href="user/teacher1.css">
	<link type="text/css" rel="stylesheet" href="user/normal.css">
	<link type="text/css" rel="stylesheet" href="user/teach.css">
  </head>
  <body onscroll="return window_onscroll()">
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
	      <%
	       StudentBean tb=(StudentBean)request.getAttribute("listinfo");
			if(tb!=null){
		%>
	   <div class="main">
	    <div class="mid">
	       <div class="mid1"><img src="images/5.jpg" width="250px"/></div>
	       <div class="mid2">
	          <div class="info"><label><%=tb.getS_name() %></label><span>&nbsp;&nbsp;&nbsp;<%=tb.getSex() %></span><span><img src="images/local.png"/><%=tb.getArea()%></span> <span>已审核</span>
	          <div id="btn" style="margin-top:-70px;margin-left:400px">
	        	<a id="toTeacher" href="http://wpa.qq.com/msgrd?v=3&uin=1452825523&site=qq&menu=yes" target="_blank">联系管理员</a>
	          </div>
	          </div>
	          <div class="data">
	             <div><h4>编号：</h4><h4><%=tb.getId() %></h4></div>
	             <div><h4>辅导科目：</h4><h4><%=tb.getGrade() %></h4></div>
	             <div><h4>年龄：</h4><h4><%=tb.getAge() %></h4></div>
	             <div><h4>状态：</h4><h4><%=tb.getAuthentication() %></h4></div>
	             <div class="rig"><h4>发布时间:</h4><h4><%=tb.getCreate_time() %></h4></div>
	          </div>
	       </div>
	      
	    </div>
	       <!-- 评价 -->
	       <div class="foott">
	          <div class="left" style="height:418px;">
	              <div class="nav">
	                 <a class="nav-item active" id="teacher-info1">基本资料</a>
	                 <a class="nav-item" id="teacher-past1">状态</a>
	              </div>
	              <div name="teacher-info" id="teacher-info">
	                  <ul class="info1">
		                  <li>时间安排：<%=tb.getTell()%></li>
		                   <li>现居住地：<%=tb.getArea()%><%=tb.getAddress() %></li>
		                  <li>需辅导科目：<font style="font-size:13px"><%=tb.getGrade() %></font></li>
		                  <li>报酬：￥<%=tb.getRequestMoney()%></li>
		                  <li>教员性别要求：<%=tb.getRequestSex()%></li>
	                  </ul>
	              </div>
	              <div name="teacher-past" id="teacher-past">
				     <ul>最近状态：<br/>
	                 <%=tb.getStatus() %>
	                 </ul>
	              </div>
	          </div>
	    </div>
	    <!-- foot -->
	  </div>
        <%
		}	
		%>
        
        
        
        
  <!-- 回到顶部 -->
  <div id="gotop" style="width: 60px; height: 51px;"></div>
  
  <!-- 底部开始 -->
    <div class="bottom" style="margin-top:860px;">
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
  
  
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/semantic.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>