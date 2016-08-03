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
      height: 400px;
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
    .sty{
      width:300px;
      height:40px;
    }
    span{
      
      font-size: 16px;
      margin-top: -18px;
      text-align: right;
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
       <form>
        <div class="title">密码修改</div>
        <div>
       
            <div class="ui input" style="margin-top:20px">
           
              <span>&nbsp;旧 密 码：</span><input type="password" class="sty" placeholder="请输入旧密码"/>
            </div>
        </div>
        <div>
            <div class="ui input">
              <span>&nbsp;新 密 码：</span><input type="password" class="sty" id="pw1" placeholder="请输入新密码"/>
            </div>
        </div>
        <div>
          <div class="ui input">
              <span>确认密码：</span><input type="password" class="sty" id="pw2" placeholder="确认密码"/>
          </div>
        </div>
       <input type="button" value="确认修改" class="ui green button" style="margin-left:100px" onclick="update()"/>
       <input type="reset" value="取消重置" class="ui red button"/>
       </form>
     </div>
  </div>



<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/semantic.min.js"></script>

<script type="text/javascript">
  $(document).ready(function(){
    $(".ui.dropdown").dropdown();
  });
  function update(){
	  var p1=$("#pw1").val();
	  var p2=$("#pw2").val();
	 
	  //alert(tell);
	  if(p1==p2){
	  $.ajax({
	    	type:"post",
          	url:"PasswordAction",
          	data:{//设置数据源
         	 password:p1
          },
         success:function(){
         	alert("修改成功");
        }, 
         error:function(){ 
            alert("修改失败！");
          }//这里不要加"," 
	     });
	  }
	  else alert("两次密码输入不一致请重新输入！")
}

</script>
</body>
</html>