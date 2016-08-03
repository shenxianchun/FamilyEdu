<%@ page language="java" import="java.util.*,com.soft.Bean.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>学员需求</title>
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
    <a href="index.jsp" onclick="dh(this)">网站首页</a>
    <a href="StudentpageAction?pageNow=1">家教信息库</a>
    <a href="TpageAction?pageNow=1">教员简历</a>
    <a href="javascript:;" onclick="dh(this)">平台介绍</a>
    <a href="javascript:;" onclick="dh(this)">在线学习</a>
    <a href="javascript:;" onclick="dh(this)">学习资源</a>
    <a href="FeedbackAction?pageNow=1">反馈</a>
</div>
    <div class="cen" >
        <div class="left_b">
				<ul>
				<%
				ArrayList list=(ArrayList)request.getAttribute("list");
				for(int i=0;i<list.size();i++){
					//从al中取出UserBean
					StudentBean tb=(StudentBean)list.get(i);
					
				%>
					<li class="clearfix">
						<dl>
							<dt>
								<div>
									<img class="img" src="images/5.jpg" alt="">
								</div>
								<div id="btn">
									<a id="toTeacher" href="StudentAction!StudentInfo?u_id=<%=tb.getU_id() %>">查看学员</a>
								</div>
							</dt>
							<dd>
								<a id="name" href="StudentAction!StudentInfo?u_id=<%=tb.getU_id() %>"><%=tb.getS_name() %></a>
								<img src="user/img/good.png" alt="">
								<div>
									<span class="str1">性别：</span>
									<span class="str2"><%=tb.getSex() %></span>
									<span class="str1">课时费要求：</span>
									<span class="str2">¥<%=tb.getRequestMoney() %></span><br>
									<span class="str1">教员要求：</span>
									<span class="str2"><%=tb.getRequestSex() %></span>	<br>
									<span class="str1">辅导区域：</span>
									<span class="str2"><%=tb.getArea() %></span><br>
									<span class="str1">最近状态：</span>
									<span class="str2"><%=tb.getStatus()%><a href="StudentAction!StudentInfo?tell=<%=tb.getTell() %>">[更多]</a></span>
								</div>
							</dd>
						</dl>
					</li>
					<%} %>
				</ul>
			</div>
			
			
		 <div class="ui floated pagination menu" id="pages">
			<% //从request中得到pageNow
			    String now=request.getAttribute("pageNow").toString().trim();
		
				int pageNow=Integer.valueOf(now);
				if(pageNow!=1){
					out.println("<a href=StudentpageAction?pageNow=="+(pageNow-1)+" class='item'>上一页</a>");
				}else{
					out.println("<a href=StudentpageAction?pageNow==1 class='item'>上一页</a>");
				}
				//得到pageCount
				String s_pageCount=request.getAttribute("pageCount").toString().trim();
				int pageCount=Integer.parseInt(s_pageCount);
				for(int i=1;i<=pageCount;i++){
					out.println("<a href=StudentpageAction?pageNow="+i+" class='item'>"+i+"</a>");
				}
				if(pageNow!=pageCount){
					out.println("<a href=StudentpageAction?pageNow="+(pageNow+1)+" class='item'>下一页</a>");
				}else{
					out.println("<a href=StudentpageAction?pageNow="+pageNow+" class='item'>下一页</a>");
				}
			%>
			<a class='item'>共<span id="pageCount"><%=pageCount%></span>页</a>
			<form action="StudentpageAction" method="get">
			<div class='ui input'>
				  <input type="text" placeholder="请输入页数" style="width:100px;" id="pageNow" name="pageNow">
			</div>
			<input type="button" id="go" value="Go" class="ui green button" style="float:left;margin-top:1px;margin-left:2px;">
			</form>
		</div> 
			
			
 	</div>
  <!-- 回到顶部 -->
  <div id="gotop" style="width: 60px; height: 51px;"></div>
  
   <!-- 底部开始 -->
    <div class="bottom">
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
	<script type="text/javascript">
	 $("#go").click(function(){
			var pageNow=$("#pageNow").val();
			var pageCount=$("#pageCount").text();
			var regNow=new RegExp("^\\d{0,}$|^(\\d{0,}).(\\d{0,})$");
			var rsNow=regNow.test(pageNow);
			if(pageNow==""){
				alert("您还没有输入跳转的页数");
				return;
			}
			if(rsNow==false){
				alert("输入有误");
				$("#pageNow").css("color","red");
				return;
			}else{
				$("#pageNow").css("color","black");
			}
			if(pageNow>pageCount){
				alert("页数过大");
				return;
			}
			if(rsNow){
				window.location="TpageAction?pageNow="+pageNow;//重定向
			}
		});
	</script>
</body>
</html>