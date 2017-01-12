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
	<title>易教反馈</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/animate.css">
	<link type="text/css" rel="stylesheet" href="css/semantic.min.css">
	<link rel="stylesheet" type="text/css" href="css/styleindex.css">
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
    <div class="cen" >
        <div class="word" id="word">
            <div class="tex">
                <div class="c_area">
                    <textarea class="c_txts" id="txt"/></textarea>
                </div>
                <a href="javascript:;" id="sub">立即提交</a>
            </div>
            <div class="count" id="box">
            </div>
        </div>
        
        <!--时间轴 start-->
        <div class="timeline" id="time">
                <div class="t_all">
                <div class="t_line"></div>
                <%
                ArrayList list=(ArrayList)request.getAttribute("list");
				if(list!=null){
				for(int i=0;i<list.size();i++){
					//从al中取出UserBean
					FeedbackBean fb=(FeedbackBean)list.get(i);
                %>
                    <div class="list animated bounceIn">
                        <div class="icon">
                            <img src="http://www.yjfamily.xyz/FamilyEdu/image/<%=fb.getTell()%>h.jpg"alt="用户头像" width="66px" height="66px"/>
                        </div>
                        <div class="sj"></div>
                        <div class="mes">
                         <div style="color:black;">&nbsp;&nbsp;内容:<%=fb.getContent() %>
                         </div><br/>
                         <div style="margin:0px 0px 0px 10px;color:black;">
                       		<span>用户:</span><span><%=fb.getName() %></span>&nbsp;&nbsp;&nbsp;&nbsp;
                       		<span>角色:</span><span><%=fb.getRole() %></span>&nbsp;&nbsp;&nbsp;&nbsp;
                       		<span>发表时间:</span><span><%=fb.getCreate_time() %></span>
                        </div>
                        </div>
                    </div>
                 <%} }%>
                    
                </div>
        </div>
        <!--时间轴 end------>
        
			
		 <div class="ui floated menu" style="margin:1104px 0px 0px 235px;">
			<% //从request中得到pageNow
			    String now=request.getAttribute("pageNow").toString().trim();
					
				int pageNow=Integer.valueOf(now);
				if(pageNow!=1){
					out.println("<a href=FeedbackAction?pageNow=="+(pageNow-1)+" class='item'>上一页</a>");
				}else{
					out.println("<a href=FeedbackAction?pageNow==1 class='item'>上一页</a>");
				}
				//得到pageCount
				String s_pageCount=request.getAttribute("pageCount").toString().trim();
				int pageCount=Integer.parseInt(s_pageCount);
				for(int i=1;i<=pageCount;i++){
					out.println("<a href=FeedbackAction?pageNow="+i+" class='item'>"+i+"</a>");
				}
				if(pageNow!=pageCount){
					out.println("<a href=FeedbackAction?pageNow="+(pageNow+1)+" class='item'>下一页</a>");
				}else{
					out.println("<a href=FeedbackAction?pageNow="+pageNow+" class='item'>下一页</a>");
				}
			%>
			<a class='item'>共<span id="pageCount"><%=pageCount%></span>页</a>
		</div> 
			
			
 	</div>
  <!-- 回到顶部 -->
  <div id="gotop" style="width: 60px; height: 51px;"></div>
  
   <!-- 底部开始 -->
    <div class="bottom" style="margin-top:400px;">
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
	<script type="text/javascript">
	$(document).ready(function(){
		$("#sub").click(function(){
		    var ct=$("#txt").val();
		    if(<%=session.getAttribute("tell")%>==null){
		    	alert("您尚未登录,请登录后在发表");
		    	return;
		    }
		    if(ct==""){
		        alert("请填写留言内容！");
		        return;
		    }
		    $.ajax({
	            url:"FeedbackAction!addFeedback",
	            data:{//设置数据源 
	            	"content":ct
	            }
	       });
		   alert("发表成功");
   		   window.location="FeedbackAction?pageNow=1";
		});
	});
	</script>
</body>
</html>