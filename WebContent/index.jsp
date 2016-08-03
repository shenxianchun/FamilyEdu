<%@ page language="java" import="java.util.*,com.soft.Bean.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>好好学习首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/demo.css"/>
	<link rel="stylesheet" href="css/slideshows.css" />
	
	<script src="js/jquery.js"></script>
	<script src="js/jquery.cycle.all.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="js/sxc.js"></script>
	<script type="text/javascript" src="js/wode.js"></script>
	<script>
		$(function() {
		// Slideshow 2
		    $('#slideshow_2').cycle({
		        fx: 'fade',		
				speed:  900, 
				timeout: 5000, 
				pager: '.ss2_wrapper .slideshow_paging', 
		        prev: '.ss2_wrapper .slideshow_prev',
		        next: '.ss2_wrapper .slideshow_next',
				before: function(currSlideElement, nextSlideElement) {
					var data = $('.data', $(nextSlideElement)).html();
					$('.ss2_wrapper .slideshow_box').stop(true, true).animate({ bottom:'-110px'}, 400, function(){
						$('.ss2_wrapper .slideshow_box .data').html(data);
					});
					$('.ss2_wrapper .slideshow_box').delay(100).animate({ bottom:'0'}, 400);
				}
		    });
		
			$('.ss2_wrapper').mouseenter(function(){
				$('#slideshow_2').cycle('pause');
				$('.ss2_wrapper .slideshow_prev').stop(true, true).animate({ left:'20px'}, 200);
				$('.ss2_wrapper .slideshow_next').stop(true, true).animate({ right:'20px'}, 200);
		    }).mouseleave(function(){
				$('#slideshow_2').cycle('resume');
				$('.ss2_wrapper .slideshow_prev').stop(true, true).animate({ left:'-40px'}, 200);
				$('.ss2_wrapper .slideshow_next').stop(true, true).animate({ right:'-40px'}, 200);
		    });
			
		// ---------------------------------------------------
			
			$('a[href="#"]').click(function(event){ 
				event.preventDefault(); // for this demo disable all links that point to "#"
			});
			
		});
</script>
	<link type="text/css" rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" type="text/css" href="css/semantic.min.css">
	<link rel="stylesheet" type="text/css" href="css/styleindex.css">
	
	

  </head>
  <%if(request.getAttribute("list")!=null){ %>
  <body onscroll="return window_onscroll()">
  <%}else{ %>
   <body onscroll="return window_onscroll()" onload="javascript:location.href='IndexAction'">
  <%} %>
    <div id="gg">
        <a href="http://wpa.qq.com/msgrd?v=3&uin=1452825523&site=qq&menu=yes" target="_blank"><img src="images/gg.png" width="85px" width="154px"></a>
        <a href=""><p onclick="closes()">关闭×</p></a>
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
    <a href="StudentpageAction?pageNow=1">学员需求</a>
    <a href="TpageAction?pageNow=1">找教员</a>
    <a href="javascript:;" onclick="dh(this)">平台介绍</a>
    <a href="javascript:;" onclick="dh(this)">美文欣赏</a>
    <a href="javascript:;" onclick="dh(this)">关于我们</a>
    <a href="javascript:;" onclick="dh(this)">反馈</a>
</div>
    <div class="cen" >
       <div class="d_center1">
            <div class="ss2_wrapper">
		
			<a href="#" class="slideshow_prev"><span>Previous</span></a>
			<a href="#" class="slideshow_next"><span>Next</span></a>
				
			<div class="slideshow_paging"></div>
			
			<div class="slideshow_box">

				<div class="data"></div>
			</div>
			
			<div id="slideshow_2" class="slideshow">
				
				<div class="slideshow_item">
					<div class="image"><a href="#"><img src="photos/2.jpg" alt="photo 2" width="1170" height="310" /></a></div>
					<div class="data">
						<h4><a href="#">幸福</a></h4>
						<p>指一个人的需求得到满足而产生长久的喜悦，并希望一直保持现状的心理情绪</p>

					</div>
				</div>
								
				<div class="slideshow_item">
					<div class="image"><a href="#"><img src="photos/3.jpg" alt="photo 3" width="1170" height="310" /></a></div>
					<div class="data">
						<h4><a href="#">遇见你</a></h4>
						<p>如果我生命中只有一个花期，我不敢渴望永远和你在一起。</p>
					</div>

				</div>
				
				<div class="slideshow_item">
					<div class="image"><a href="#"><img src="photos/1.jpg" alt="photo 1" width="1170" height="310" /></a></div>
					<div class="data">
						<h4><a href="#">REIDA</a></h4>
						<p>时间联系生活</p>
					</div>
				</div>

				
				<div class="slideshow_item">
					<div class="image"><a href="#"><img src="photos/4.jpg" alt="photo 4" width="1170" height="310" /></a></div>
					<div class="data">
						<h4><a href="#">古风</a></h4>
						<p>高端中式</p>
					</div>
				</div>
				
			</div>

		</div><!-- .ss2_wrapper -->
        </div>
        <div class="d_left">
             <ul class="left_list">
                <li onmouseover="teache(this)" id="xxjj"><div style="height:50px;line-height:50px;"><div style="width:24%;height:50px;float:left;"><img src="images/school.ico" style="width:20px;height:20px;margin-top:15px"/></div><div style="text-align:left">小学家教  小考</div></div><div height=50% style=" font-size: 15px;color:#BEBEBE">语文 英语 奥数</div></li>
                <li onmouseover="teache(this)" id="czjj"><div style="height:50px;line-height:50px;"><div style="width:24%;height:50px;float:left;"><img src="images/school.ico" style="width:20px;height:20px;margin-top:15px"/></div><div style="text-align:left">初中家教  中考</div></div><div height=50% style=" font-size: 15px;color:#BEBEBE">数学 语文 英语</div></li>
                <li onmouseover="teache(this)" id="gzjj"><div style="height:50px;line-height:50px;"><div style="width:24%;height:50px;float:left;"><img src="images/school.ico" style="width:20px;height:20px;margin-top:15px"/></div><div style="text-align:left">高中家教  高考</div></div><div height=50% style=" font-size: 15px;color:#BEBEBE">物理 化学 生物</div></li>
            </ul>
        </div>
        <div class="left_right" >
         <ul id="lrc">
              <li class="xiaoxue">
                 <div style="background:#fff;opacity:0.80;width:400px;height:440px;">
                    <div class="x_style">
                    <font color="#0FABF5">一年级&nbsp;&nbsp;&nbsp;</font>
                    | <a href="SearchTeacherAction?grade=一年级&subject=数学">数学</a> 
                    | <a href="SearchTeacherAction?grade=一年级&subject=语文">语文</a>
                    | <a href="SearchTeacherAction?grade=一年级&subject=英语">英语 </a>
                    | <a href="SearchTeacherAction?grade=一年级&subject=奥数 ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=一年级&subject=陪读 ">陪读</a>
                    |
                    </div>
                     <div class="x_style">
                    <font color="#0FABF5">二年级&nbsp;&nbsp;&nbsp;</font>
                    | <a href="SearchTeacherAction?grade=二年级&subject=数学  ">数学 </a>
                    | <a href="SearchTeacherAction?grade=二年级&subject=语文">语文</a>
                    | <a href="SearchTeacherAction?grade=二年级&subject=英语">英语 </a>
                    | <a href="SearchTeacherAction?grade=二年级&subject=奥数 ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=二年级&subject=陪读 ">陪读</a>
                    |
                    </div>
                     <div class="x_style">
                    <font color="#0FABF5">三年级&nbsp;&nbsp;&nbsp;</font>
                   	| <a href="SearchTeacherAction?grade=三年级&subject=数学  ">数学 </a>
                    | <a href="SearchTeacherAction?grade=三年级&subject=语文">语文</a>
                    | <a href="SearchTeacherAction?grade=三年级&subject=英语">英语 </a>
                    | <a href="SearchTeacherAction?grade=三年级&subject=奥数 ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=三年级&subject=陪读 ">陪读</a>
                    |
                    </div>
                     <div class="x_style">
                     <font color="#0FABF5">四年级&nbsp;&nbsp;&nbsp;</font>
                    | <a href="SearchTeacherAction?grade=四年级&subject=数学  ">数学 </a>
                    | <a href="SearchTeacherAction?grade=四年级&subject=语文">语文</a>
                    | <a href="SearchTeacherAction?grade=四年级&subject=英语">英语 </a>
                    | <a href="SearchTeacherAction?grade=四年级&subject=奥数 ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=四年级&subject=陪读 ">陪读</a>
                    |
                    </div>
                     <div class="x_style">
                    <font color="#0FABF5">五年级&nbsp;&nbsp;&nbsp;</font>
                    | <a href="SearchTeacherAction?grade=五年级&subject=数学  ">数学 </a>
                    | <a href="SearchTeacherAction?grade=五年级&subject=语文">语文</a>
                    | <a href="SearchTeacherAction?grade=五年级&subject=英语">英语 </a>
                    | <a href="SearchTeacherAction?grade=五年级&subject=奥数 ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=五年级&subject=陪读 ">陪读</a>
                    |
                    </div>
                     <div class="x_style">
                     <font color="#0FABF5">六年级&nbsp;&nbsp;&nbsp;</font>
                    | <a href="SearchTeacherAction?grade=六年级&subject=数学  ">数学 </a>
                    | <a href="SearchTeacherAction?grade=六年级&subject=语文">语文</a>
                    | <a href="SearchTeacherAction?grade=六年级&subject=英语">英语 </a>
                    | <a href="SearchTeacherAction?grade=六年级&subject=奥数 ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=六年级&subject=陪读 ">陪读</a>
                    |
                    </div>
                 </div>
              </li>
              <li class="zhongxue">
                 <div style="background:#fff;;opacity:0.80;width:400px;height:440px;">
                  <div class="c_style">
                    <font color="#0FABF5">初 一&nbsp;&nbsp;&nbsp;</font>
                    | <a href="SearchTeacherAction?grade=初一&subject=数学  ">数学 </a>
                    | <a href="SearchTeacherAction?grade=初一&subject=语文  ">语文</a>
                    | <a href="SearchTeacherAction?grade=初一&subject=英语  ">英语 </a>
                    | <a href="SearchTeacherAction?grade=初一&subject=生物 ">生物 </a>
                    | <a href="SearchTeacherAction?grade=初一&subject=化学  ">化学 </a>
                    | <a href="SearchTeacherAction?grade=初一&subject=物理  ">物理 </a>
                    |<a href="SearchTeacherAction?grade=初一&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=初一&subject=地理  ">地理 </a>
                    |
                    </div>
                     <div class="c_style" style="line-height:30px;">
                    | <a href="SearchTeacherAction?grade=初一&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=初一&subject=历史  ">历史 </a>
                    | <a href="SearchTeacherAction?grade=初一&subject=作文  ">作文 </a>
                    | <a href="SearchTeacherAction?grade=初一&subject=奥数  ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=初一&subject=陪读  ">陪读 </a>
                    |
                    </div>
                     <div class="c_style">
                    <font color="#0FABF5">初 二&nbsp;&nbsp;&nbsp;</font>
                    | <a href="SearchTeacherAction?grade=初 二&subject=数学  ">数学 </a>
                    | <a href="SearchTeacherAction?grade=初 二&subject=语文  ">语文</a>
                    | <a href="SearchTeacherAction?grade=初 二&subject=英语  ">英语 </a>
                    | <a href="SearchTeacherAction?grade=初 二&subject=生物 ">生物 </a>
                    | <a href="SearchTeacherAction?grade=初 二&subject=化学  ">化学 </a>
                    | <a href="SearchTeacherAction?grade=初 二&subject=物理  ">物理 </a>
                    |<a href="SearchTeacherAction?grade=初 二&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=初 二&subject=地理  ">地理 </a>
                    |
                    </div>
                     <div class="c_style" style="line-height:30px;">
                    | <a href="SearchTeacherAction?grade=初二&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=初二&subject=历史  ">历史 </a>
                    | <a href="SearchTeacherAction?grade=初二&subject=作文  ">作文 </a>
                    | <a href="SearchTeacherAction?grade=初二&subject=奥数  ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=初二&subject=陪读  ">陪读 </a>
                    |
                    </div>
                     <div class="c_style">
                     <font color="#0FABF5">初 三&nbsp;&nbsp;&nbsp;</font>
                    | <a href="SearchTeacherAction?grade=初三&subject=数学  ">数学 </a>
                    | <a href="SearchTeacherAction?grade=初三&subject=语文  ">语文</a>
                    | <a href="SearchTeacherAction?grade=初三&subject=英语  ">英语 </a>
                    | <a href="SearchTeacherAction?grade=初三&subject=生物 ">生物 </a>
                    | <a href="SearchTeacherAction?grade=初三&subject=化学  ">化学 </a>
                    | <a href="SearchTeacherAction?grade=初三&subject=物理  ">物理 </a>
                    |<a href="SearchTeacherAction?grade=初三&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=初三&subject=地理  ">地理 </a>
                    |
                    </div>
                     <div class="c_style" style="line-height:30px;">
                    | <a href="SearchTeacherAction?grade=初三&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=初三&subject=历史  ">历史 </a>
                    | <a href="SearchTeacherAction?grade=初三&subject=作文  ">作文 </a>
                    | <a href="SearchTeacherAction?grade=初三&subject=奥数  ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=初三&subject=陪读  ">陪读 </a>
                    |
                    </div>
                 </div>
              </li>
              <li class="gaozhong">
                <div style="background:#fff;opacity:0.80;width:400px;height:440px;">
                 <div class="c_style">
                    <font color="#0FABF5">高一&nbsp;&nbsp;&nbsp;</font>
                    | <a href="SearchTeacherAction?grade=高一&subject=数学  ">数学 </a>
                    | <a href="SearchTeacherAction?grade=高一&subject=语文  ">语文</a>
                    | <a href="SearchTeacherAction?grade=高一&subject=英语  ">英语 </a>
                    | <a href="SearchTeacherAction?grade=高一&subject=生物 ">生物 </a>
                    | <a href="SearchTeacherAction?grade=高一&subject=化学  ">化学 </a>
                    | <a href="SearchTeacherAction?grade=高一&subject=物理  ">物理 </a>
                    |<a href="SearchTeacherAction?grade=高一&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=高一&subject=地理  ">地理 </a>
                    |
                    </div>
                     <div class="c_style" style="line-height:30px;">
                    | <a href="SearchTeacherAction?grade=高一&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=高一&subject=历史  ">历史 </a>
                    | <a href="SearchTeacherAction?grade=高一&subject=作文  ">作文 </a>
                    | <a href="SearchTeacherAction?grade=高一&subject=奥数  ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=高一&subject=陪读  ">陪读 </a>
                    |
                    </div>
                     <div class="c_style">
                    <font color="#0FABF5">高 二&nbsp;&nbsp;&nbsp;</font>
                    | <a href="SearchTeacherAction?grade=高二&subject=数学  ">数学 </a>
                    | <a href="SearchTeacherAction?grade=高二&subject=语文  ">语文</a>
                    | <a href="SearchTeacherAction?grade=高二&subject=英语  ">英语 </a>
                    | <a href="SearchTeacherAction?grade=高二&subject=生物 ">生物 </a>
                    | <a href="SearchTeacherAction?grade=高二&subject=化学  ">化学 </a>
                    | <a href="SearchTeacherAction?grade=高二&subject=物理  ">物理 </a>
                    |<a href="SearchTeacherAction?grade=高二&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=高二&subject=地理  ">地理 </a>
                    |
                    </div>
                     <div class="c_style" style="line-height:30px;">
                    | <a href="SearchTeacherAction?grade=高二&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=高二&subject=历史  ">历史 </a>
                    | <a href="SearchTeacherAction?grade=高二&subject=作文  ">作文 </a>
                    | <a href="SearchTeacherAction?grade=高二&subject=奥数  ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=高二&subject=陪读  ">陪读 </a>
                    |
                    </div>
                     <div class="c_style">
                     <font color="#0FABF5">高 三&nbsp;&nbsp;&nbsp;</font>
                    | <a href="SearchTeacherAction?grade=高三&subject=数学  ">数学 </a>
                    | <a href="SearchTeacherAction?grade=高三&subject=语文  ">语文</a>
                    | <a href="SearchTeacherAction?grade=高三&subject=英语  ">英语 </a>
                    | <a href="SearchTeacherAction?grade=高三&subject=生物 ">生物 </a>
                    | <a href="SearchTeacherAction?grade=高三&subject=化学  ">化学 </a>
                    | <a href="SearchTeacherAction?grade=高三&subject=物理  ">物理 </a>
                    |<a href="SearchTeacherAction?grade=高三&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=高三&subject=地理  ">地理 </a>
                    |
                    </div>
                     <div class="c_style" style="line-height:30px;">
                    | <a href="SearchTeacherAction?grade=高三&subject=政治  ">政治 </a>
                    | <a href="SearchTeacherAction?grade=高三&subject=历史  ">历史 </a>
                    | <a href="SearchTeacherAction?grade=高三&subject=作文  ">作文 </a>
                    | <a href="SearchTeacherAction?grade=高三&subject=奥数  ">奥数 </a>
                    | <a href="SearchTeacherAction?grade=高三&subject=陪读  ">陪读 </a>
                    |
                    </div>
                </div>
              </li>
                   
                </ul>  
                </div>
                
                
                
        <!-------------中间right-DIV start-------------------->
        <div class="d_right">
       
        <div class="r_top">
        <div style="width:100%;text-align:center;font-size:20px;"><font color=green>最新认证家教</font></div>
        
        </div>
        <% 
		//要显示的信息从request中取得
		ArrayList list=(ArrayList)request.getAttribute("list");
		%>
		<%if(list!=null){ %>
        <div class="r_middle">
          <%
			for(int i=0;i<list.size();i++){
			//从al中取出UserBean
			TeacherBean tb=(TeacherBean)list.get(i);
			if(!tb.getAuthentication().equals("0")){
		%>
          <div class='user_teacher'>
              <div class='teacher_tou'>
                  <img alt='头像' src='<%=tb.getImages() %>' class='touxiang'>
              </div>
              <div  class='infor'>
              <font style="color:green;font-size:20px"><%=tb.getT_name() %></font><br>
              <font style="font-size:16px">  大学生家教</font><br>
              <font style="font-size:16px;color:grey">个人简介：</font>
             <%if(tb.getIntroduce().length()>=14){ %>
              	<%=tb.getIntroduce().substring(0, 14) %>
              <% }else{%>
              	<%=tb.getIntroduce()%>
              <%} %>
              ...<br>
              <font style="font-size:16px;color:grey"> 课时费：</font><%=tb.getMoney() %>元<br>
                 <div class="lianxi"><a href="TeacherAction!TeacherInfo?u_id=<%=tb.getU_id() %>" style="text-decoration:none;">查看TA</a></div>
              </div>
          </div>
          <%}}} %>
        </div>
        
        <div class="r_bottom"><a href="TpageAction?pageNow=1">查看更多认证家教</a></div>
        
        </div>
        
       
        
        
 <!---------------平台流程start---------------------->
	<div class="platform">
            <h3>平台流程</h3>
           <!--  <p class="line"></p> -->
            <ul class="icon">
            	<li class="one"></li>
            	<li class="two"></li>
            	<li class="three"></li>
            	<li class="four"></li>
            </ul>
            <ul class="process">
            	<li>
            		<p>1、搜索老师</p>
            		<p>通过网页或客户端登入平台查找所需老师，查看详细资料，选择心仪老师。</p>
            	</li>
            	<li>
            		<p>2、双方沟通</p>
            		<p>在老师主页与老师在线进行沟通交流，达成共识即可进行约课。</p>
            	</li>
            	<li>
            		<p>3、下单约课</p>
            		<p>双方沟通完成后，填写约课订单并完成支付，课酬将由平台担保。</p>
            	</li>
            	<li>
            		<p>4、约定上课</p>
            		<p>在约定时间和地点，老师对学生进行授课 ，授课完成后，双方相互评价</p>
            	</li>
            </ul>
        	
        </div>
  
       <!---------------平台流程over---------------------->
		
		 <!-- 四大保障开始 -->
        <div class="security">
            <h3>四大保障</h3>
        	<ul class="icon-security">
        		<li class="one"></li>
        		<li class="two"></li>
        		<li class="three"></li>
        		<li class="four"></li>
        	</ul>
        	<ul class="world">
        		<li>
        			<p>真实</p>
        			<p>8重教师认证，防范虚假包装，</br>帮助家长找到好老师</p>
        		</li>
        		<li>
        			<p>安全</p>
        			<p>平台托管学费，上课后家长确认</br>付款，保证资金安全。</p>
        		</li>
        		<li>
        			<p>保密</p>
        			<p>采用阿里云平台，全球领先的云</br>平台保障老师与家长的隐私。</p>
        		</li>
        		<li>
					<p>专业</p>
        			<p>国内优秀移动互联技术团队精心</br>打造，快速响应平台更新。</p>
				</li>
        	</ul>
        </div><!-- 四大保障结束 -->
		
		
       

    
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
  
	<script type="text/javascript" src="js/semantic.min.js"></script>
</body>
</html>
