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
			var q=document.getElementById('qingchun');
			var x=document.getElementById('xuanhuan');
			var g=document.getElementById('gongting');
			var z=document.getElementById('zhichang');
			var t=document.getElementById('zhentan');
			if(a=="qingchun"){
				q.style.display="block";
				x.style.display="none";
				 g.style.display="none";
				z.style.display="none";
				 t.style.display="none";
			}
			else if(a=="xuanhuan"){
				q.style.display="none";
				x.style.display="block";
				 g.style.display="none";
				z.style.display="none";
				 t.style.display="none";
			}
		   else if(a=="gongting"){
				q.style.display="none";
				x.style.display="none";
				 g.style.display="block";
				z.style.display="none";
				 t.style.display="none";
			}
		   else if(a=="zhichang"){
				q.style.display="none";
				x.style.display="none";
				 g.style.display="none";
				z.style.display="block";
				 t.style.display="none";
			}
		else if(a=="zhentan"){
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
			border-bottom:1px solid #eeeded;
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
    <a href="javascript:;" onclick="dh(this)">平台介绍</a>
    <a href="javascript:;" onclick="dh(this)">美文欣赏</a>
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
				<li onMouseOver="change('qingchun',this)" onMouseOut="change1(this)" id="xy"><a href="#分类" style="color:#919191">散文</a></li>
				<li onMouseOver="change('xuanhuan',this)" onMouseOut="change1(this)" id="xh"><a href="#分类"style="color:#919191">诗歌</a></li>
				<li onMouseOver="change('gongting',this)" onMouseOut="change1(this)" id="gt"><a href="##分类"style="color:#919191">杂文</a></li>
				<li onMouseOver="change('zhichang',this)" onMouseOut="change1(this)" id="zc"><a href="##分类"style="color:#919191">小小说</a></li>
				<li onMouseOver="change('zhentan',this)" onMouseOut="change1(this)" id="zt"><a href="##分类"style="color:#919191">随笔</a></li>
			</ul>
		</div> <!--分类导航over-->
		<!--Order-->
		<div style="width:96%;height:95%;float:left;" id="qingchun">
			<div class="fenlei"><font size=4 style="color:#919191"></br>散文</font></br>
				 <ol>
				  <li><a href="#"><font style="color:red">1.&nbsp;&nbsp;</font>夏至未至</a></li>
				  <li><a href="#"><font style="color:red">2.&nbsp;&nbsp;</font>回不去的青春</a></li>
				  <li><a href="#"><font style="color:red">3.&nbsp;&nbsp;</font>小时代</a></li>
				  <li><a href="#">4.&nbsp;&nbsp;盛夏流年朝朝</a></li>
				  <li><a href="#">5.&nbsp;&nbsp;致我们终将逝去的青春</a></li>
				  <li><a href="#">6.&nbsp;&nbsp;原来</a></li>
				  <li><a href="#">7.&nbsp;&nbsp;天亮说晚安</a></li>
				  <li><a href="#">8.&nbsp;&nbsp;曾有人爱我如生命</a></li>
				  <li><a href="#">7.&nbsp;&nbsp;天亮说晚安</a></li>
				  <li><a href="#">8.&nbsp;&nbsp;曾有人爱我如生命</a></li>
				</ol>
			</div>
			
		</div>
		<!--over-->
		<div style="width:96%;height:95%;float:left;display:none" id="xuanhuan">
			<div class="fenlei"></br><font size=4 style="color:#919191">诗歌</font></br>
				 <ol>
				  <li><a href="#"><font style="color:red">1.&nbsp;&nbsp;</font>幻城</a></li>
				  <li><a href="#"><font style="color:red">2.&nbsp;&nbsp;</font>爵迹</a></li>
				  <li><a href="#"><font style="color:red">3.&nbsp;&nbsp;</font>临界</a></li>
				  <li><a href="#">4.&nbsp;&nbsp;烈火如歌</a></li>
				  <li><a href="#">5.&nbsp;&nbsp;花千骨</a></li>
				  <li><a href="#">6.&nbsp;&nbsp;曾许诺</a></li>
				  <li><a href="#">7.&nbsp;&nbsp;大漠谣</a></li>
				  <li><a href="#">8.&nbsp;&nbsp;长相思</a></li>
				</ol>
			</div>
		</div>
		<!--over-->
		<div style="width:96%;height:95%;float:left;display:none" id="gongting">
			<div class="fenlei"></br><font size=4 style="color:#919191">杂文</font></br>
				 <ol>
				  <li><a href="#"><font style="color:red">1.&nbsp;&nbsp;</font>红颜乱</a></li>
				  <li><a href="#"><font style="color:red">2.&nbsp;&nbsp;</font>步步惊心</a></li>
				  <li><a href="#"><font style="color:red">3.&nbsp;&nbsp;</font>宫</a></li>
				  <li><a href="#">4.&nbsp;&nbsp;甄嬛传</a></li>
				  <li><a href="#">5.&nbsp;&nbsp;绝世舞妃</a></li>
				  <li><a href="#">6.&nbsp;&nbsp;兰陵王</a></li>
				  <li><a href="#">7.&nbsp;&nbsp;凰图腾</a></li>
				  <li><a href="#">8.&nbsp;&nbsp;神话</a></li>
				</ol>
			</div>
		</div>
		<!--over-->
		<div style="width:96%;height:95%;float:left;display:none" id="zhichang">
			<div class="fenlei"></br><font size=4 style="color:#919191">小小说</font></br>
			 <ol>
			  <li><a href="#"><font style="color:red">1.&nbsp;&nbsp;</font>天价隐妻</a></li>
			  <li><a href="#"><font style="color:red">2.&nbsp;&nbsp;</font>护花使者</a></li>
			  <li><a href="#"><font style="color:red">3.&nbsp;&nbsp;</font>姗姗来吃</a></li>
			  <li><a href="#">4.&nbsp;&nbsp;夏有乔木，雅望天堂</a></li>
			  <li><a href="#">5.&nbsp;&nbsp;致我们终将逝去的青春</a></li>
			  <li><a href="#">6.&nbsp;&nbsp;原来</a></li>
			  <li><a href="#">7.&nbsp;&nbsp;天亮说晚安</a></li>
			  <li><a href="#">8.&nbsp;&nbsp;会有天使替我爱你</a></li>
			  
			</ol>
			</div>
		</div>
		<!--over-->
		<div style="width:96%;height:95%;float:left;display:none" id="zhentan">
			<div class="fenlei"></br><font size=4 style="color:#919191">随笔</font></br>
			 <ol>
			  <li><a href="#"><font style="color:red">1.&nbsp;&nbsp;</font>盗墓笔记</a></li>
			  <li><a href="#"><font style="color:red">2.&nbsp;&nbsp;</font>名侦探柯南</a></li>
			  <li><a href="#"><font style="color:red">3.&nbsp;&nbsp;</font>福尔摩斯</a></li>
			  <li><a href="#">4.&nbsp;&nbsp;雪舞倾城</a></li>
			  <li><a href="#">5.&nbsp;&nbsp;致我们终将逝去的青春</a></li>
			  <li><a href="#">6.&nbsp;&nbsp;原来</a></li>
			  <li><a href="#">7.&nbsp;&nbsp;薰衣草</a></li>
			  <li><a href="#">8.&nbsp;&nbsp;曾有人爱我如生命</a></li>
			</ol>
			</div>
		</div>
	<!--over-->
	</div>
	</div>
</div>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
   <!-- 底部开始 -->
    <div class="bottom" style="margin-top:100px;">
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
  	
</body>
</html>