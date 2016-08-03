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
      height: 680px;
      background:#E8F4F5;
      margin-left: 45px;
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
  <form  action="TeacherAction" name="form1" method="post">
    <table width="500px" style="border:2px solid #8080ff ;border-radius:5px;" class="ui selectable celled table">
      <thead>
        <tr bgcolor="#009ad6" style="border-radius:5px;">
        <td style="text-align:center" colspan=4><font size=5 style="font-family:黑体;"><%=session.getAttribute("u_id") %>号教员个人资料维护</font></td>
        </tr>
      </thead>
        <tbody>
        <tr>
        <td style="text-align:center" width="90px">姓名:</td>
        <td>
          <div class="ui input">
          <%if(session.getAttribute("name")==null){%>
        	  <input type="text" id="name" placeholder="请输入姓名"/>
          <% }else{ %>
            <input type="text" id="name" value="<%=session.getAttribute("name")%>"/>
            <%} %>
          </div>
        </td>
        <td width="100px">手机号:</td>
        <td><div class="ui input">
            <input type="text" id="tell" value="<%=session.getAttribute("tell")%>"/>
          </div></td>
        </tr>
        <tr>
          <td style="text-align:center">性别</td>
          <td>
            <div class="ui dropdown">
            <%if(session.getAttribute("sex")==null){%>
                <input type="hidden" id="sex" value="" id="sex"/>
                
                <div class="default text">性别</div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                          <div class="item" data-value="男">男</div>
                          <div class="item" data-value="女">女</div>
                        </div>
                        <% }else{ %> 
                <input type="hidden" id="sex" value="<%=session.getAttribute("sex")%>" id="sex"/>
                <div class="default text"></div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                          <div class="item" data-value="男">男</div>
                          <div class="item" data-value="女">女</div>
                        </div>
                <%} %>
            </div>
          </td>
          <td>年龄:</td>
          <td>
            <div class="ui input">
             <%if(session.getAttribute("age")==null){%>
             <input type="text" id="age" placeholder="请输入年龄"/>
              <% }else{ %>
              <input type="text" id="age" value="<%=session.getAttribute("age")%>"/>
            <%} %>
            </div>
          </td> 
        </tr>
        <tr>
          <td style="text-align:center">身份证号:</td>
          <td>
            <div class="ui input">
             <%if(session.getAttribute("pid")==null){%>
              <input type="text" id="pid" placeholder="请输入身份证号"/>
               <% }else{ %>
              <input type="text" id="pid" value="<%=session.getAttribute("pid")%>"/>
            <%} %>
            </div>
          </td>
          <td>毕业学校:</td>
          <td>
            <div class="ui input">
             <%if(session.getAttribute("graduate_school")==null){%>
              <input type="text" id="graduate" placeholder="请输入学校"/>
                 <% }else{ %>
              <input type="text" id="graduate" value="<%=session.getAttribute("graduate_school")%>"/>
            <%} %>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center">专业</td>
          <td>
            <div class="ui input">
             <%if(session.getAttribute("specialty")==null){%>
            <input type="text" id="specialty" placeholder="请输入专业"/>
             <% }else{ %>
              <input type="text" id="specialty" value="<%=session.getAttribute("specialty")%>"/>
            <%} %>
            </div>
          </td>
          <td>学历:</td>
          <td>
            <div class="ui dropdown">
             <%if(session.getAttribute("education")==null){%>
                <input type="hidden" id="education" value=""/>
                <div class="default text">学历</div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                      <div class="item" data-value="大专">大专</div>
                      <div class="item" data-value="本科">本科</div>
                      <div class="item" data-value="硕士">硕士</div>
                      <div class="item" data-value="博士">博士</div>
                    </div>
                     <% }else{ %>
                     <input type="hidden" id="education" value="<%=session.getAttribute("education")%>"/>
                     <div class="default text"></div>   <!-- 默认显示 -->
                     <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                      <div class="item" data-value="大专">大专</div>
                      <div class="item" data-value="本科">本科</div>
                      <div class="item" data-value="硕士">硕士</div>
                      <div class="item" data-value="博士">博士</div>
                    </div>
                      <%} %>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center">邮箱:</td>
          <td>
            <div class="ui input">
            <%if(session.getAttribute("email")==null){%>
              <input type="text" id="email" placeholder="请输入邮箱"/>
               <% }else{ %>
              <input type="text" id="email" value="<%=session.getAttribute("email")%>"/>
            <%} %>
            </div>
          </td>
          <td>民族</td>
          <td>
            <div class="ui dropdown">
              <%if(session.getAttribute("nation")==null){%>
              <input type="hidden" id="nation"/>
              <div class="default text">民族</div>
              <i class="dropdown icon"></i><!-- 向下的箭头 -->
              <div class="menu">
                <div class="item" data-value="汉族">汉族</div>
                <div class="item" data-value="满族">满族</div>
                <div class="item" data-value="蒙古族">蒙古族</div>
                <div class="item" data-value="回族">回族</div>
                <div class="item" data-value="白族">白族</div>
                <div class="item" data-value="藏族">藏族</div>
              </div>
               <% }else{ %>
               <input type="hidden" value="<%=session.getAttribute("nation")%>" id="nation"/>
              <div class="default text"></div>
              <i class="dropdown icon"></i><!-- 向下的箭头 -->
              <div class="menu">
                <div class="item" data-value="汉族">汉族</div>
                <div class="item" data-value="满族">满族</div>
                <div class="item" data-value="蒙古族">蒙古族</div>
                <div class="item" data-value="回族">回族</div>
                <div class="item" data-value="白族">白族</div>
                <div class="item" data-value="藏族">藏族</div>
              </div>
               <%} %>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center">自我介绍:</td>
          <td colspan=3>
            <div class="ui form">
              <div class="field">
                <%if(session.getAttribute("introduce")==null){%>
                <textarea id="introduce" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"></textarea>
                 <% }else{ %>
 				<textarea id="introduce" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"><%=session.getAttribute("introduce")%></textarea>
                  <%} %>
              </div>
            </div>
          </td>
        </tr>
        <tr colspan=3>
          <td style="text-align:center">座右铭:</td>
          <td>
             <div class="ui form">
              <div class="field">
               <%if(session.getAttribute("motto")==null){%>
                <textarea id="motto" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"></textarea>
                 <% }else{ %>
                 
 <textarea id="motto" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"><%=session.getAttribute("motto")%></textarea>
                  
                  <%} %>
              </div>
            </div>
          </td>
        </tr>
        <tr colspan=3>
          <td style="text-align:center">家教经历</td>
          <td>
             <div class="ui form">
              <div class="field">
               <%if(session.getAttribute("experience")==null){%>
                <textarea id="experience" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"></textarea>
                 <% }else{ %>
<textarea id="experience" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"><%=session.getAttribute("experience")%></textarea>
                  <%} %>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center" colspan=4>
            <input type="button" value="确认更新" class="ui green button" onclick="update()"/>
            <input type="reset" value="取消重置" class="ui red button"/>
          </td>
        </tr>
        <thead>
        <tr bgcolor="#009ad6">
          <td style="text-align:center" colspan=4><font size=2>@版权所有</font></td>
        </tr>
        </thead>
        </tbody>
        
      </table>
      </form>
  </div>



<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/semantic.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $(".ui.dropdown").dropdown();
  });
  function update(){
	  var username=$("#name").val();
	  var pid=$("#pid").val();
	  var age=$("#age").val();
	  var sex=$("#sex").val();
	  var graduate_school=$("#graduate").val();
	  var specialty=$("#specialty").val();
	  var education=$("#education").val();
	  var email=$("#email").val();
	  var nation=$("#nation").val();
	  var experience=$("#experience").val();
	  var motto=$("#motto").val();
	  var introduce=$("#introduce").val();
	  var tell=$("#tell").val();
	  $.ajax({
	    	type:"post",
          	url:"TeacherAction!excute",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
          	data:{//设置数据源
         	  username:username,
         	  pid:pid,
	      	  age:age,
	      	  sex:sex,
	      	  graduate_school:graduate_school,
	      	  specialty:specialty,
	      	  education:education,
	      	  email:email,
	      	  nation:nation,
	      	  experience:experience,
	      	  motto:motto,
	      	  introduce:introduce,
	      	  tell:tell
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