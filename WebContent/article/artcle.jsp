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
 	<style type="text/css">
 		html,body,div{margin:0 auto;padding:0;}
 		.artclelist .box1{
			padding-top: 25px;
			margin: 25px 4px auto;
			width: 100%;
			border-style: solid;
			border-width: 1px;
			border-color: #D5E6B9;
			padding:0px 0px 0px 0px;
		}
		h1{
			width:60%;
			height:50px;
			/* background:#ECEFEE; */
			text-align:center;
			line-height:50px;
			font-size:24px;
			margin:-35px 0px 0px 17%;
		}
		.article p{
			margin-bottom:1.5em;
			text-indent:2em;
			font-size:15px;
			font-family:"微软雅黑";
			color:#444;
			
		}
		.article{
			width:98%;
		}
		.info{
			margin-left:37%;
			color:#313131;
		}
		.info a{
			text-decoration:none;
		}
		.info a:hover{
			text-decoration:underline;
			color:blue;
		}
		.box1 .sanwen{
			color:#00BEB7;
			margin-left:2%;
			font-size:16px;
		}
		.box1 .sanwen a{
			color:red;
			font-size:16px;
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
    <a href="javascript:;" onclick="dh(this)">平台介绍</a>
    <a href="javascript:;" onclick="dh(this)">美文欣赏</a>
    <a href="javascript:;" onclick="dh(this)">关于我们</a>
    <a href="FeedbackAction?pageNow=1">反馈</a>
</div>
    
    
    
  <div style="border-style:solid;border-width:0px;border-color:#000; width:70%;" class="artclelist">
	<!--分类-->
		<div class="box1">
			<a href="#" style="text-decoration:none;"><span style="display:inline-block;background:#FFE1FF;font-size:15px;vertical-align:middle;">
				<font style="color:#919191;font-weight:bold">点击阅读原文》》》</font>
			</span></a></br></br></br>
			<div class="sanwen">文章来自
				<a href="http://www.sanwen.net/" target="_blank">
				中国散文网
				</a>
			</div>
			<div class="mod article">
			 <h1>我崇拜的人</h1>
			 <div class="info">
			  01-11 作者:
			  <a href="http://u.sanwen.net/595445.html">一缕阳光</a>
			 </div>
			 <div class="">
			  <p>我崇拜的人</p> 
			  <p>云南省昆明市 嵩明县 嵩阳一小 五年级 261班 杨璐榕</p> 
			  <p>指导教师张晓丽</p> 
			  <p>我最崇拜的人是我的老师，她是一个很好的老师。尽管她每天工作多么繁忙，但依然担任我们的班主任，每天坚持来为我们上课，教我们学习语文。</p> 
			  <p>我的老师长得微胖，一双会说话的眼睛总能提醒我们戒骄戒躁，戴着一副粉红色的眼镜，一双能说会道的嘴巴里藏着无穷多的知识与道理，一头逢松的短发让人看起来很精神，总是带着一脸让人沉醉的微笑，全身上下都散发着魅力。虽然老师长得不是特别漂亮，但老师有一种独特的美，她善良、和蔼、敬业……老师在我们班每个人的心中永远是最美丽的。</p> 
			  <p>我的老师，她是多么的关心我们。当我们生病还坚持上学时，老师总会对我们说：“孩子，健康是生命之本，快回家好好休息吧！”当我们获得某种荣誉时，老师会比我们更开心，但她的眼神会提醒我们：“孩子，你们真棒，但不能骄傲哟！”我的老师，她是多么的善解人意，当我们因某种原因做错事，胆怯的站在老师面前时，老师总会亲切的抚摸着我们的头说：“孩子，人都会犯错，老师不怪你，以后不许再犯同样的错误了哦。”<span style="position:relative;left:-100000px;">( 文章阅读网：www.sanwen.net )</span></p> 
			  <p>记得有一次，要举行作文大赛，得知消息后，我便报名参加了。报名后的那天晚上，我就打开电脑查找相关的资料，努力地写好草稿，修改后存入了u盘，交给了语文老师。本以为工作繁忙的老师会直接将我的作文拿去参赛，可令我感动的是，老师居然在百忙之中抽出时间，不但为我查找了不少特别有用的相关资料，还为我修改了许多地方，加了不少优美的词句，是我的作文更加通顺、生动。不久后，我写的作文获奖了，我很开心，老师也很开心，但她那充满笑意的眼睛提醒着我应该更加努力。哦，就是这个眼神，一直激励着我做任何事都更加努力、认真，付出更多的汗水，因而取得成功。这些小小的成功与平日里老师的教诲是分不开的，可以这样说：没有老师的辅助，就没有我们做事的成功。</p> 
			  <p>我的老师，她是多么的敬业。当夜深人静的时候，有一个温暖的灯光闪烁在黑夜里，那是老师，还拖着疲惫的身体为我们仔细地批阅作业，认真的书写教案，从一个又一个的笔记，都能看出老师对我们的爱是多么伟大；老师用宝贵的休息时间为我们制作了许多可爱的奖状，激励我们努力学习；老师还买了许多让人爱不释手的小礼物送给在各方面表现突出的同学，让同学们都觉得学习是件很快乐的事；老师还不辞辛劳地把我们写得好的作文打印制作成书，书里加了美丽的插图，同学们都很爱看，这得花老师的多少心血呐！我的老师为了提高我们的写作水平，她为我们班准备了一个大大的书架，还买了许多书放在书架上供我们阅读；我的老师总会在同学们的作文上写一些评语，一针见血，总能准确无误的指出其作文的优点与不足；我的老师总是微笑着为我们上课，无论她的心情是否愉悦。</p> 
			  <p>我的老师，她把每节课都上得很好，让同学们都能听得津津有味，让同学们都爱上语文课；当我们有不懂的，向老师提出问题时，我的老师总是很有耐心的回答我们，举一些简单又是在的例子来开导我们。</p> 
			  <p>这就是我最崇拜的语文老师，怎么样，她是不是也成为你的偶像了？</p>
			 </div>
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