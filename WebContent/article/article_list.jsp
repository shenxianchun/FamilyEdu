<%@ page language="java" import="java.util.*,com.article.web.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>美文类型</title>
	<link rel="short icon" href="images/logo.png" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styleindex.css">
	<script language="javascript">
		function change(a,event){
			event.style.backgroundColor="#FFE1FF";
			var q=document.getElementById('suibi');
			var x=document.getElementById('shige');
			var g=document.getElementById('sanwen');
			var z=document.getElementById('zawen');
			var t=document.getElementById('novel');
			if(a=="suibi"){
				q.style.display="block";
				x.style.display="none";
				 g.style.display="none";
				z.style.display="none";
				 t.style.display="none";
			}
			else if(a=="shige"){
				q.style.display="none";
				x.style.display="block";
				 g.style.display="none";
				z.style.display="none";
				 t.style.display="none";
			}
		   else if(a=="sanwen"){
				q.style.display="none";
				x.style.display="none";
				 g.style.display="block";
				z.style.display="none";
				 t.style.display="none";
			}
		   else if(a=="zawen"){
				q.style.display="none";
				x.style.display="none";
				 g.style.display="none";
				z.style.display="block";
				 t.style.display="none";
			}
		else if(a=="novel"){
				q.style.display="none";
				x.style.display="none";
				 g.style.display="none";
				z.style.display="none";
				 t.style.display="block";
			}
		}
		function change1(event){
			event.style.backgroundColor="D5FFFF";
		}
  </script>
 	<style type="text/css">
 		html,body,ul,ol,li,p,h1,h2,h3,h4,h5,h6,img,input,div{margin:0 auto;padding:0;}
 		.artcle a{text-decoration:none;font-size:15px;}
 		.artcle li{list-style-type:none;}
 		.artcle .box1{
			padding-top: 25px;
			margin: 25px 4px auto;
			width: 100%;
			border-style: solid;
			border-width: 1px;
			border-color: #D5E6B9;
		}
		.dec{
		float:left;
		}
		.dec ul li{
			float:left;
			padding:5px;
			margin-top:3px;
			height:116px;
			line-height:45px;
			background:#D5FFFF;
		}
		.fenlei{
		float:left;
		margin-left:60px;
		width:25%;
		border-style: solid;
		   border-width: 0px;
		   border-color: red;
		}
		.fenlei  li{
			width:800px;
			height:60px;
			background:#fbfbfb;
			border-bottom:1px dashed #eeeded;
		  	line-height:60px;
		  }
		  .fenlei  li a{
		  	font-size:22px;
		  	color:#00BEB7;
		  }
		  .fenlei  li a:hover{
		  	text-decoration:underline;
		  	color:#00FFE7;
		  }
		.artcle a.lt:hover{
		   text-decoration:underline;
		   color:red;
		   }
		.box1 .sanwen{
			color:#00BEB7;
			margin-left:40%;
			font-size:24px;
		}
		.box1 .sanwen a{
			color:red;
			font-size:24px;
		}
		.box1 .sanwen a:hover{
		text-decoration:underline;
		color:red;
		}
 	</style>
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


  <div style="border-style:solid;border-width:0px;border-color:#000; width:70%;" class="artcle">
	
	<!--分类-->

	<div class="box1" style="height:800px">
	<div class="sanwen">以下文章均来自<a href="http://www.sanwen.net/" target="_blank">中国散文网
	<!-- <img src="http://i0.sanwen.net/images/xlogo.png" alt="返回中国散文网首页"> -->
		</a>
	</div>
	<span style="display:inline-block;background:#FFE1FF;font-size:15px;vertical-align:middle;">
		<font style="color:#919191;font-weight:bold">文章分类 《《《 </font>
	</span></br></br></br>
	<div style="width:90%;height:430px;" class="dec">
	   <!--分类导航-->
		<div style="width:4%;height:100%;"class="dec">
			<ul>
				<li onMouseOver="change('suibi',this)" onMouseOut="change1(this)" id="xy"><a href="#分类" style="color:#919191">随笔</a></li>
				<li onMouseOver="change('shige',this)" onMouseOut="change1(this)" id="xh"><a href="#分类"style="color:#919191">诗歌</a></li>
				<li onMouseOver="change('sanwen',this)" onMouseOut="change1(this)" id="gt"><a href="##分类"style="color:#919191">散文</a></li>
				<li onMouseOver="change('zawen',this)" onMouseOut="change1(this)" id="zc"><a href="##分类"style="color:#919191">杂文</a></li>
				<li onMouseOver="change('novel',this)" onMouseOut="change1(this)" id="zt"><a href="##分类"style="color:#919191">小小说</a></li>
			</ul>
		</div> <!--分类导航over-->
		<!--Order-->
		<% Map<String,Map<String,String>> Typearticle=(Map<String,Map<String,String>>)request.getAttribute("Typearticle");
		Set<String> set = Typearticle.keySet();
        Iterator<String> it  = set.iterator();
        String type="";
        int i=0,j=0;
        while(it.hasNext()){
        	i++;
        	String a_listkey=it.next();
        	if("suibi".equals(a_listkey)){
        		type="随笔";
        	}else if("shige".equals(a_listkey)){
        		type="诗歌";
        	}else if("sanwen".equals(a_listkey)){
        		type="散文";
        	}else if("zawen".equals(a_listkey)){
        		type="杂文";
        	}else{
        		type="小小说";
        	}
        %>
      <%--  <div style="color:red;font-size:24px;">
       	类型：<%=a_listkey %>
       </div>  --%>
       <%if(i==1){%>
       <div style="width:96%;height:95%;float:left;" id="<%=a_listkey.toString().trim()%>"> 
       <%}else{%>
        <div style="width:96%;height:95%;float:left;display:none;" id="<%=a_listkey.toString().trim()%>">
        <%} %>
        
			<div class="fenlei"><font size=4 style="color:#919191;"></br><%=type%></font></br>
        		<ol>
        	<%
        	Map<String,String> article=Typearticle.get(a_listkey);
        	Set<String> sett = article.keySet();
            Iterator<String> itt  = sett.iterator();
            while(itt.hasNext()){
            	j++;
            	String a_key=itt.next().toString().trim();
            	String a_value=article.get(a_key);
            %>
				  <li><a href="ArticleAction!read?urlkey=<%=a_key %>" target="_blank"><%=j %>.&nbsp;&nbsp;<%=a_value %></a></li>
				  <%} j=0;%>
				</ol>
			</div>
		</div>
		<!--over-->
		<%
        }
		%>
	</div>
	</div>
</div>
  
 
   <!-- 底部开始 -->
    <div class="bottom" style="margin-top:100px;">
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