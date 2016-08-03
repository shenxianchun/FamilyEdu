<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
    <title>教员设置中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/semantic.min.css">
  </head>
  <style type="text/css">
  	*{margin:0px;padding:0px;}
  	body{background-color: #fff;font-family: "微软雅黑";}
  	.teacher_top{
  		width:95%;
  		height:100px;
  		margin:0 auto;
  		text-align: center;
  		line-height: 100px;
  		font-size:34px;
  		color:teal;
  	}
    .left{
      float:left;
      width:190px;
      height:450px;
      margin-left: 100px;
      background:#06B1D8;
    }
    #leftbtn{
      margin-left:20px;
      margin-top:30px;
    }
    #teacherbtn button{
      width:150px;
      height:52px;
    }
    .teacher_right{
      float:left;
      width:1002px;
      height: 680px;
      background:#E8F4F5;
      margin-left: 45px;
    }
    .teacher_right .right_thinks{
     width:900px;
      height:100px;
      line-height: 100px;
      text-align: center;
      font-size: 28px;
    }
    .right_count{
      font-size: 20px;
      padding-left: 36px;
    }
    .right_ul{
      width:700px;
      height:300px;
    }
    .setting-setp li{
      list-style:none;
      width:470px;
      height:130px;
      padding: 30px 100px;
    }
    .setting-setp li i{
      position: absolute;
      width:50px;
      height: 50px;
      background:#00BEB7;
      color:#fff;
      border-radius:50%;
      font-size: 24px;
      text-align: center;
      line-height: 50px;
      margin-left: -70px;
    }
    .setting-setp li .title{
      font-size: 16px;
      margin-bottom:15px;
    }
    .setting-setp li .title span{
      border:1px solid #00BEB7;
      padding:8px 10px;
    }
    .setting-setp li dd{
      float: left;
      margin: 0px 10px;
    }
    .t_line{/*竖线*/
    width:3px;
    height:410px;
    background:#BDBDBC;
    position:absolute;
    left:388px;
    top:377px;
  }
  </style>
  <body>
	<div class="teacher_top">教员用户中心</div>
	
	<div class="ui teal four item inverted menu">
	  <a class="active item"></a>
	  <a href="teacher/set_teachers.jsp" class="item">教员设置</a>
	  <a href="teacher/setmobile.jsp" class="item">账号设置</a>
	  <a href="TeacherAction!TeacherInfo?u_id=<%=session.getAttribute("u_id") %>" class="item">我的主页</a>
	</div>
  	<div class="left">
    <div id="leftbtn">
      <div id="teacherbtn" class="ui vertical basic buttons">
        <a href="teacher/set_teacher.jsp"><button class="ui button">个人中心</button></a>
        <a href="SelectAction!excute"><button class="ui button">个人资料</button></a>
        <a href="AuthenticAction!displayimg"><button class="ui button">验证信息</button></a>
        <a href="TaddressAction!selectAddress"><button class="ui button">授课信息</button></a>
        <a href="teacher/set_timeMoney.jsp"><button class="ui button">时间安排</button></a>
        <a href="TOrderAction?tell=<%=session.getAttribute("tell")%>"><button class="ui button">我的订单</button></a>
        <button class="ui button">我的评价</button>
        <a href="teacher/setmobile.jsp"><button class="ui button">密码修改</button></a>
      </div>
    </div>
    
    
    <div class="ui divider"></div>
  </div>

  
  <div class="teacher_right">
    <div class="right_thinks"><%=session.getAttribute("tell") %>感谢您入驻好好学习家教平台,请完善您的基本资料</div>
    <div class="right_count"><p style="text-indent:2em;">您完善全部资料后我们将在24小时内进行审核，并与您联系，在通过审核之前，家长不能在网站上看到你，所以无法向你约课。</p>
    </div>
    <div class="right_ul">
      <div class="t_line"></div>
      <ul class="setting-setp">
        <li>
          <i>1</i>
          <div class="title"><span>个人资料</span></div>  
          <div class="list">
            <dd>个人信息</dd><dd>自我描述</dd><dd>教学经历</dd>
          </div>
        </li>
        <li>
          <i>2</i>
          <div class="title"><span>授课科目</span></div>
          <div class="list">
            <dd>科目添加</dd><dd>时间安排</dd><dd>地点安排</dd>
          </div>
        </li>
        <li>
          <i>3</i>
          <div class="title"><span>身份认证</span></div>
          <div class="list">
            <dd>头像认证</dd><dd>证件认证</dd><dd>学历认证</dd>
          </div>
        </li>
        <li>
          <i>4</i>
          <div class="title"><span>等待审核</span></div>
          <div class="list">
            <dd>请耐心等待，准备上线。</dd>
          </div>
        </li>
      </ul>
    </div>
  </div>


	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/semantic.min.js"></script>
</body>
</html>
