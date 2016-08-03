<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>下订单</title>
 
 <link rel="stylesheet" href="css/orderstyle.css" type="text/css" />
 
<link type="text/css" href="css/order.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/sxc.js"></script>



<script src="js/jquery-2.0.3.min.js" type="text/javascript"></script>	
<script type="text/javascript">
$(document).ready(function(){
	
	$(".side ul li").hover(function(){
		$(this).find(".sidebox").stop().animate({"width":"124px"},200).css({"opacity":"1","filter":"Alpha(opacity=100)","background":"#ae1c1c"})	
	},function(){
		$(this).find(".sidebox").stop().animate({"width":"54px"},200).css({"opacity":"0.8","filter":"Alpha(opacity=80)","background":"#000"})	
	});
});
//回到顶部
function goTop(){
	$('html,body').animate({'scrollTop':0},600);
}
function ch(ob){
	 var x=document.getElementById("li1");
     x.style.backgroundColor="#FFF";
     var y=document.getElementById("li2");
     y.style.backgroundColor="#FFF";
     var z=document.getElementById("li3");
     z.style.backgroundColor="#FFF";
     var a=document.getElementById("ok1");
     var b=document.getElementById("ok2");
     var c=document.getElementById("ok3");
     var t=document.getElementById("Rtime");
	 if(ob.id=="li1"){
		 x.style.borderColor="orange";
		 y.style.borderColor="#c8c8c8";
		 z.style.borderColor="#c8c8c8";
		 a.style.display="block";
		 b.style.display="none";
		 c.style.display="none";
		 t.value="1小时";
		   }
	 if(ob.id=="li2"){
		 y.style.borderColor="orange";
		 x.style.borderColor="#c8c8c8";
		 z.style.borderColor="#c8c8c8";
		 b.style.display="block";
		 a.style.display="none";
		 c.style.display="none";
		 t.value="10小时";
		   }
	 if(ob.id=="li3"){
		 z.style.borderColor="orange";
		 y.style.borderColor="#c8c8c8";
		 x.style.borderColor="#c8c8c8";
		 c.style.display="block";
		 b.style.display="none";
		 a.style.display="none";
		 t.value="20小时";
		   }
	   }
	   
function text(){
	$("input").removeAttr("disabled");
}

function update(){
	 var t_name=$("#t_name").val();
	  var subject=$("#subject").val();
	  var method=$("#method").val();
	  var Rtime=$("#Rtime").val();
	  var s_name=$("#s_name").val();
	  var s_tell=$("#s_tell").val();
	  var address=$("#address").val();
	  var remark=$("#remark").val();
	  $.ajax({
	    	type:"post",
        	url:"OrderAction",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
        	data:{//设置数据源
       	      t_name:t_name,
       	      subject:subject,
	      	  method:method,
	      	  Rtime:Rtime,
	      	  s_name:s_name,
	      	  s_tell:s_tell,
	      	  address:address,
	      	  remark:remark
        },
       success:function(data){
       	alert("成功");
      }, 
       error:function(){ 
          alert("更新失败！");
        }//这里不要加"," 
	     });
	 }


</script>

</head>
<body>
<%
    String tell=(String)session.getAttribute("tell");
    if(tell!=null){
    	String img=(String)request.getParameter("img");
    	String name=(String)request.getParameter("name");
    	String money=(String)request.getParameter("money");
    	String subject=(String)request.getParameter("subject");
    	String duce=(String)request.getParameter("duce");
    	String ttell=(String)request.getParameter("ttell");
    	session.setAttribute("ttell", ttell);
    	session.setAttribute("money", money);
%>


   <% 
    String sname=(String)session.getAttribute("name");
    String role=(String)session.getAttribute("role");
    if(name!=null){
    	%>
    <div id="top" name="top1">
    	<%
    		if(role.equals("教员")){
    	%>
    	<a href="teacher/set_teacher.jsp" id="topd">您好&nbsp;&nbsp;<font style="font-size:18px"><%=sname %></font></a>
    	<a href="login.html" id="topz">│退出</a>
    	<%
    		}else{
    	%>
    	<a href="set_request.jsp" id="topd">您好<%=sname %></a>
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
    <a href="javascript:;" onclick="dh(this)">反馈</a>
</div>

    <div id="order" class="cen">
	 <div class="order_top">
	   选择上课信息</div>
	   <div id="teach">
	   <div class="infor">
	      <div style="float:left;display:inline;width:20%;height:40%;"><img src="<%=img %>" height="100px" width="100px"/></div>
	      <div class="teacher_name">
		  <p class="p_2"><%=name %></p>
		  <p class="p_3" id="money">
		    <span class="span_1"><%=money %></span>&nbsp;元/课时
		  </p>
		</div>
		
		 <div class="infor_b">
		 <span class="span_2">所授课科目:<%=subject %></span>
		 <div class="span_2">选择教学科目及上课方式</div>
		<div id="teacher_style" >
		
		<div class="ui input">
			<input type="text" placeholder="请输入教学科目格式:年级+科目"  class="select_1" id="subject" name="select" style="width:240px;">
		</div>
        
		<select name="select" class="select_1" id="method">
          <option value="老师上门">老师上门</option>
          <option value="学生上门">学生上门</option>
          <option value="协商地点">协商地点</option>
        </select>
		</div>
	  </div>
	   </div>
	<div class="jianjie">教师简介：<br><br>
	    
	<div style="height:200px;width:480px;" id="duce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=duce %></div>
	</div>
	   </div>
	   <div class="order_top">
	 选择上课时常</div>
	    <form  action="" name="form3">
		<table class="ordtable" style="margin-left:100px;margin-top:25px;">
		<tr>
		<td>
	   <input type="radio" value="自定义课时" name="myrad" onclick="text();">&nbsp;<font style="font-size:14px">自定义课时</font><font style="color:red;">*</font>&nbsp;</td>
		<td>
		<input type="text" style="height:20px;width:120px;" id="Rtime" disabled/>
		</td>
		</tr>
		</table>
		</form>
		<div class="time">
		<div class="li" onclick="ch(this);" id="li1">1小时 <span style="background-color:orange;color:white;margin-left:10px">&nbsp;无折扣&nbsp;</span><br>
		      <span style="line-height:50px">试听课程，为学生免费提供</span>
		      <div class="ok" id="ok1">√</div>
		</div>
		<div class="li" onclick="ch(this);" id="li2">10小时 <span style="background-color:orange;color:white;margin-left:10px">&nbsp;无折扣&nbsp;</span><br>
		      <span style="line-height:50px">试听课程，为学生免费提供</span>
		      <div class="ok" id="ok2">√</div>
		</div>
		<div class="li" onclick="ch(this);" id="li3">20小时 <span style="background-color:orange;color:white;margin-left:10px">&nbsp;无折扣&nbsp;</span><br>
		      <span style="line-height:50px">试听课程，为学生免费提供</span>
		      <div class="ok" id="ok3">√</div>
		</div>
		
		</div>
		<div class="order_top">
	  填写信息</div>
	  <form  action="" name="form4">
		<table class="ordtable" style="margin-left:100px;margin-top:25px;">
		<tr>
		<td>
	    <p class="span_2"><font class="font_1">&nbsp;学员姓名</font><font style="color:red;">*</font>&nbsp;</p></td>
		<td>
		<input type="text" style="height:20px;width:200px;margin-top:25px;" id="s_name" value="<%=session.getAttribute("name")%>"/>
		<td>
	    <p class="span_2"><font class="font_1">&nbsp;教员姓名</font><font style="color:red;">*</font>&nbsp;</p></td>
		<td>
		<input type="text" style="height:20px;width:200px;margin-top:25px;" id="t_name" value="<%=name%>"/>
		</td>
	
		</tr>
		<tr>
		<td>
	    <p class="span_2"><font class="font_1">&nbsp;学员电话</font><font style="color:red;">*</font>&nbsp;</p></td>
		<td>
		<input type="text" style="height:20px;width:200px;margin-top:25px;" id="s_tell" value="<%=session.getAttribute("tell")%>"/>
		</td>
		<td>
	    <p class="span_2"><font class="font_1">&nbsp;上课地址</font><font style="color:red;">*</font>&nbsp;</p></td>
		<td>
		<input type="text" style="height:20px;width:200px;margin-top:25px;" id="address"/>
		</td>
		</tr>
		<tr>
		<td>
	    <p class="span_2"><font class="font_1">&nbsp;备注信息 </font>&nbsp;</p></td>
		<td colspan=3>
		<textarea style="height:100px;width:480px;margin-top:25px;" id="remark"/></textarea>
	   </td>
		</tr>
		</table>
	
	   <div class="o_bottom">
	  
	         <input type="button" value="我要下订单"  onclick="update()" class="xia">
	         <input type="reset" value="取消重置" class="reset"/>
	        
	   </div>	</form>
	  
	   </div>
	   
	   
	   
<div class="side">
	<ul>
		<li><a href="#"><div class="sidebox"><img src="images/side_icon01.png">客服中心</div></a></li>
		<li><a href="#"><div class="sidebox"><img src="images/side_icon02.png">客户案例</div></a></li>
		<li><a href="javascript:void(0);" ><div class="sidebox"><img src="images/side_icon04.png">QQ客服</div></a></li>
		<li><a href="javascript:void(0);" ><div class="sidebox"><img src="images/side_icon03.png">新浪微博</div></a></li>
		<li style="border:none;"><a href="javascript:goTop();" class="sidetop"><img src="images/side_icon05.png"></a></li>
	</ul>
</div>

  <% 
    }else{
    	%>
    	<script type="text/javascript">
    		alert("请先登录！");
    		window.open("login.html","_parent");
    	</script>
    <%
    }
    %>
</body>
</html>