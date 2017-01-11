<%@ page language="java" import="java.util.*,com.soft.Bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">
    <title>全部家教</title>
    <link rel="short icon" href="images/logo.png" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/animate.css">
	<link type="text/css" rel="stylesheet" href="css/semantic.min.css">
	<link rel="stylesheet" type="text/css" href="css/styleindex.css">
	<link type="text/css" rel="stylesheet" href="user/normal.css">
	<link type="text/css" rel="stylesheet" href="user/teach.css">
  </head>
  <body onscroll="return window_onscroll()">
    <div id="gg">
        <a href="http://wpa.qq.com/msgrd?v=3&uin=1452825523&site=qq&menu=yes" target="_blank"><img src="images/gg.png" width="85px" width="154px"></a>
        <a href="javascript:void(0)"><p onclick="closes()">关闭×</p></a>
    </div>
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
    <a href="javascript:;" onclick="dh(this)">平台介绍</a>
    <a href="javascript:;" onclick="dh(this)">美文欣赏</a>
    <a href="javascript:;" onclick="dh(this)">关于我们</a>
    <a href="FeedbackAction?pageNow=1">反馈</a>
</div>
	<div class="search" style="width:87%;height:60px;margin:-13px auto 13px auto;">
    	<table class="ui table" style="background:rgb(237, 239, 255);">
				<tr align="center">
					<td width="100px">教员编号:</td>
					<td width="100px">
						<div class="ui input">
						  <input type="text" placeholder="请输入编号" id="uid" style="width:140px;">
						</div>
					</td>
					<td width="140px">
						<div class="ui dropdown">
							<input type="hidden" id="grade" />
							<div class="default text">选择年级</div>
							<i class="dropdown icon"></i><!-- 向下的箭头 -->
							<div class="menu"  id="grade_list">
								
							</div>
						</div>
					</td>
					<td width="140px">
						<div class="ui dropdown">
							<input type="hidden" id="subject" value=""/>
							<div class="default text">选择科目</div>
							<i class="dropdown icon"></i><!-- 向下的箭头 -->
							<div class="menu" id="subject_list">
								
							</div>
						</div>
					</td>
					<td width="140px">
						<div class="ui dropdown">
							<input type="hidden" id="area" value=""/>
							<div class="default text">选择地区</div>
							<i class="dropdown icon"></i><!-- 向下的箭头 -->
							<div class="menu" id="area_list">
								
							</div>
						</div>
					</td>
					<td width="140px">
						<div class="ui dropdown">
							<input type="hidden" id="school" value=""/>
							<div class="default text">选择高校</div>
							<i class="dropdown icon"></i><!-- 向下的箭头 -->
							<div class="menu" id="school_list">
								
							</div>
						</div>
					</td>
					<td width="140px">
						<div class="ui dropdown">
							<input type="hidden" id="sex" value=""/>
							<div class="default text">选择性别</div>
							<i class="dropdown icon"></i><!-- 向下的箭头 -->
							<div class="menu" id="area_list">
								<div class="item" data-value="男">男</div>
								<div class="item" data-value="女">女</div>
							</div>
						</div>
					</td>
					
					<td align="left">
						<button class="ui primary button" id="save">精确搜索</button>
					</td>
				</tr>
			</table>
    </div>
    <div class="cen" >
    	
        <div class="left_b">
				<ul>
				<%
				ArrayList list=(ArrayList)session.getAttribute("list");
				if(!list.isEmpty()){
				for(int i=0;i<list.size();i++){
					//从al中取出UserBean
					TeacherBean tb=(TeacherBean)list.get(i);
					
				%>
					<li class="clearfix">
						<dl>
							<dt>
								<div>
									<img class="img" src="<%=tb.getImages() %>" alt="">
								</div>
								<div id="btn">
									<a id="toTeacher" href="student/order.jsp?img=<%=tb.getImages() %>&name=<%=tb.getT_name() %>
									&money=<%=tb.getMoney() %>&subject=<%=tb.getSubject() %>
									&duce=<%=tb.getIntroduce() %>&ttell=<%=tb.getTell()%>">预约老师</a>
								</div>
							</dt>
							<dd>
								<a id="name" href="TeacherAction!TeacherInfo?u_id=<%=tb.getU_id() %>"><%=tb.getT_name() %></a>
								<img src="user/img/good.png" alt="">
								<div>
									<span class="str1">性别：</span>
									<span class="str2"><%=tb.getSex() %></span>
									<span class="str1">课时费：</span>
									<span class="str2">¥<%=tb.getMoney() %></span><br>
									<span class="str1">教授科目：</span>
									<span class="str2"><%=tb.getSubject() %></span>	<br>
									<span class="str1">辅导区域：</span>
									<span class="str2"><%=tb.getArea() %></span><br>
									<span class="str1">个人简介：</span>
									<span class="str2">
									<%if(tb.getIntroduce().length()>=50){ %>
										<%=tb.getIntroduce().substring(0, 49) %>
									<%}else{ %>
									<%=tb.getIntroduce()%>
									<%} %>
									<a href="TeacherAction!TeacherInfo?u_id=<%=tb.getU_id() %>">[更多]</a></span>
								</div>
							</dd>
						</dl>
					</li>
					<%}
					}else{
					%>
					<li class="clearfix" style="margin:0 auto;text-align:center;color:red;font-size:24px;">抱歉！！！没有您要的结果,请尝试重新选择检索条件</li>
					<%} %>
				</ul>			
			</div>
 	</div>
 	
  <!-- 回到顶部 -->
  <div id="gotop" style="width: 60px; height: 51px;"></div>
 
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/semantic.min.js"></script>
	<script type="text/javascript" src="js/SearchTeacher.js"></script>
</body>
</html>
