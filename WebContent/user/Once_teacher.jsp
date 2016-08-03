<%@ page language="java" import="java.util.*,com.soft.Bean.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>教员个人主页</title>
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
    <a href="index.jsp" onclick="dh(this)">网站首页</a>
    <a href="StudentpageAction?pageNow=1">家教信息库</a>
    <a href="TpageAction?pageNow=1">教员简历</a>
    <a href="javascript:;" onclick="dh(this)">平台介绍</a>
    <a href="javascript:;" onclick="dh(this)">在线学习</a>
    <a href="javascript:;" onclick="dh(this)">学习资源</a>
    <a href="FeedbackAction?pageNow=1">反馈</a>
</div>
	     <%
	       TeacherBean tb=(TeacherBean)request.getAttribute("listinfo");
			if(tb!=null){
		%>
	   <div class="main">
	    <div class="mid">
	       <div class="mid1"><img src="<%=tb.getImages() %>" width="250px"/></div>
	       <div class="mid2">
	          <div class="info"><label><%=tb.getT_name() %></label><span>&nbsp;&nbsp;&nbsp;<%=tb.getSex() %></span><span><img src="images/local.png"/><%=tb.getGraduate_school() %></span> <span><%=tb.getSpecialty() %></span>
	          <div id="btn" style="margin-top:-70px;margin-left:400px">
	          <a id="toTeacher" onclick="return order()" href="student/order.jsp?img=<%=tb.getImages() %>&name=<%=tb.getT_name() %>
									&money=<%=tb.getMoney() %>&subject=<%=tb.getSubject() %>
									&duce=<%=tb.getIntroduce() %>&ttell=<%=tb.getTell()%>">预约老师</a>
	          </div>
	          </div>
	          <div class="data">
	              <div><h4>编号：</h4><h4><%=tb.getU_id() %></h4></div>
	              <div><h4>民族：</h4><h4><%=tb.getNationality() %></h4></div>
	              <div><h4>学历：</h4><h4><%=tb.getEducation() %></h4></div>
	              <div><h4>年龄：</h4><h4><%=tb.getAge() %></h4></div>
	              <div class="rig"><h4>认证时间</h4><h4><%=tb.getCreate_time() %></h4></div>
	          </div>
	       </div>
	       <div class="mid3">
	          <img src="images/renzheng.png"/>
	       </div>
	    </div>
	       <!-- 评价 -->
	       <div class="foott">
	          <div class="left">
	              <div class="nav">
	                 <a class="nav-item active" href="#teacher-info" id="teacher-info1">基本资料</a>
	                 <a class="nav-item" href="#teacher-past" id="teacher-past1">过往经历</a>
	                 <a class="nav-item" href="#teacher-success" id="teacher-success1">自我介绍</a>
	                 <a class="nav-item" href="#teacher-list" id="teacher-list1">座右铭</a>
	              </div>
	              <div name="teacher-info" id="teacher-info">
	                  <ul class="info1">
		                  <li>所在区域：<%=tb.getArea()%></li>
		                   <li>现居住地：<%=tb.getAddress() %></li>
		                  <li>可授课时间：<%=tb.getTeach_time() %></li>
		                  <li>授课科目：<font style="font-size:13px"><%=tb.getSubject() %></font></li>
		                  <li>薪水要求：￥<%=tb.getMoney() %></li>
	                  </ul>
	              </div>
	              <div name="teacher-past" id="teacher-past">
				     <ul>经历：<br/>
	                 <%=tb.getExperience() %>
	                 </ul>
	              </div>
	              <div name="teacher-success" id="teacher-success">
	              <ul>自我介绍 :<br/><%=tb.getIntroduce() %></ul>
	              </div>
	              <div name="teacher-list1" id="teacher-list">
	                <ul>座右铭:<br/><%=tb.getMotto() %></ul>
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
    <div class="bottom" id="bottomt">
    	<ul class="bottom-left">
    		<li>
    			<ul>
    				<li class="titles">好好学习网</li>
    				<li><a href="#"></a></li>
    				<li><a href="#"></a></li>
    				<li><a href="#"></a></li>
    			</ul>
    		</li>
    		<li>
    			<ul>
    				<li class="titles">帮助中心</li>
    				<li><a href="#">意见反馈</a></li>
    				<li><a href="#"></a></li>
    				<li><a href="#"></a></li>
    			</ul>
    		</li>
    		<li>
    			<ul>
    				<li class="titles">平台特色</li>
    				<li><a href="#"></a></li>
    				<li><a href="#"></a></li>
    				<li><a href="#"></a></li>
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
    	<p>Copyright ©2014-2016 好好学习网版权所有 - 闽ICP备14021129号-1 闽公网安备35020002830833号</p>
    </div><!-- 底部结束 -->
  
  
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/semantic.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function order(){
		if(<%=session.getAttribute("role").equals("教员")%>){
			alert("您的身份是教员,不可预约");
			return false;
		}else{
			return true;
		}
	}
	
	</script>
</body>
</html>