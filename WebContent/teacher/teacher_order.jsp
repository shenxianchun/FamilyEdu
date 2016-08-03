<%@ page language="java" import="java.util.*,com.soft.Bean.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 <base href="<%=basePath%>">
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <link rel="stylesheet" type="text/css" href="css/semantic.min.css">
  <title>教员信息</title>
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
      height: 1000px;
      background:#E8F4F5;
      margin-left: 45px;
    }
    .address{
      width:896px;
      height:66px;
      margin-left: 46px;
      line-height: 76px;
    }
    .title{
      border-bottom: 1px solid #e6e6e6;
      padding-bottom: 10px;
      font-size: 28px;
    }
    .liveaddress{
      border-top: 1px solid #e6e6e6;
      font-size: 18px;
    }
    #ress{
      margin-left: 10px;
    }
    .subject{
      border-top: 1px solid #e6e6e6;
      width:896px;
      height:66px;
      line-height: 76px;
    }
    .subject .subject_title{
      border-bottom: 1px solid #e6e6e6;
      padding-bottom: 10px;
      font-size: 28px;
    }
    
  </style>
</head>
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
     <div class="address">
        <div class="title">订单信息</div>
        <div class="subject">
             <table style="border:2px solid #CA0EE4;width:900px;margin-top:20px;" class="ui selectable celled table">
             	<tr align="center"  bgcolor="#009ad6">
                    <td width="150px">编号</td><td width="200px">学员姓名</td><td width="250px">电话</td><td width="200px">科目</td><td width="200px">预约时间</td><td width="200px">预约地址</td><td width="200px">预约方式</td><td width="200px">预约价格</td><td width="150px">备注</td>
                  </tr>
                  <% 
                 String []color={"silver","pink","#CCE2FF"};
               if(request.getAttribute("order")!=null){
                ArrayList order=(ArrayList)request.getAttribute("order");
                
         			for(int i=0;i<order.size();i++){
         			//从al中取出UserBean
         			OrderBean ob=(OrderBean)order.get(i);
                 %>
                  <tr>
                  	<td><%=ob.getId() %></td>
                  	<td><%=ob.getS_name() %></td>
                  	<td><a href="http://wpa.qq.com/msgrd?v=3&uin=1452825523&site=qq&menu=yes" target="_blank">联系管理员</a></td>
                  	<td><%=ob.getSubject() %></td>
                  	<td><%=ob.getRtime() %></td>
                  	<td><%=ob.getAddress() %></td>
                  	<td><%=ob.getMethod() %></td>
                  	<td><%=ob.getMoney() %></td>
                  	<td><%=ob.getRemark() %></td>
                  </tr>
                  <%} }%> 
             </table>
        </div>
     </div>
  </div>

<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/semantic.min.js"></script>
</body>
</html>