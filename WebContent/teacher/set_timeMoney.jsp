<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 <base href="<%=basePath%>">
  <meta charset="UTF-8">
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
      height: 600px;
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
      height:30px;
      line-height: 60px;
    }
    .subject .subject_title{
      border-bottom: 1px solid #e6e6e6;
      padding-bottom: 10px;
      font-size: 28px;
    }
    #time{
      width:377px;
    }
    #money{
      width:230px;
      height: 50px;
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
        <div class="title">授课时间安排</div>
        <div>
            <div class="ui input">
              <input type="text" id="teach_time" placeholder="输入可上课的时间，多个时间逗号分开"/>
            </div>
        </div>
        <div class="liveaddress">
          <span>课时费:</span>
          
            <div class="ui input">
              <input type="text" id="money" placeholder="标准符合好好学习平台"/>&nbsp;元/小时
            </div>
            <input type="button" value="确认提交" class="ui green button" style="margin-left:50px" onclick="sub()"/>
        </div>

        <div class="subject">
          <div class="subject_title">好好学习家教平台课时费简介</div>
                <img src="images/finger.png" height="32px" width="32px"/>&nbsp;&nbsp;小学【语文、数学、英语、奥数】
　　          <font style="color:#06B1D8;font-size:20px">每小时30-50元（在校大学生）</font><br/>
                 <img src="images/finger.png" height="32px" width="32px"/>&nbsp;&nbsp;初中【语文、数学、英语、物理、化学、奥数】       
       <font style="color:#06B1D8;font-size:20px">&nbsp;&nbsp;&nbsp;每小时40-60元（在校大学生）</font><br/>
                <img src="images/finger.png" height="32px" width="32px"/>&nbsp;&nbsp; 高中【语文、数学、英语、物理、化学、等各类专业课程】
　　            <font style="color:#06B1D8;font-size:20px">每小时60-100元（在校大学生）</font><br/>
        </div>
     </div>
  </div>



<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/semantic.min.js"></script>

<script type="text/javascript">
  $(document).ready(function(){
    $(".ui.dropdown").dropdown();
  });
  function sub(){
	  var teach_time=$("#teach_time").val();
	  var money=$("#money").val();
	  $.ajax({
	    	type:"post",
          	url:"TimeMoneyAction",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
          	data:{//设置数据源
          		teach_time:teach_time,
         	    money:money
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
</body>
</html>