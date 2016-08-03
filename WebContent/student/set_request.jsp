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
  <title>学员信息</title>
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
    .student_right{
      float:left;
      width:1002px;
      height: 680px;
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
	<div class="teacher_top">学员用户中心</div>
	<div class="ui teal four item inverted menu">
	  <a class="active item"></a>
	  <a href="student/set_request.jsp" class="item">需求设置</a>
	  <a href="MyRequestAction" class="item">我的需求</a>
	  <a href="StudentAction!StudentInfo?u_id=<%=session.getAttribute("u_id") %>" class="item">我的主页</a>
	</div>
  <div class="left">
    <div id="leftbtn">
      <div id="teacherbtn" class="ui vertical basic buttons">
      <a href="MyRequestAction"><button class="ui button">我的需求</button></a>
        <a href="student/set_request.jsp"><button class="ui button">发布需求</button></a>
        <a href="TOrderAction?tell=<%=session.getAttribute("tell")%>"><button class="ui button">我的订单</button></a>
      </div>
    </div>
    <div class="ui divider"></div>
  </div>

  
  <div class="student_right">
   
  <form  action="RequestAction" name="form1" method="post">
    <table width="500px" style="border:2px solid #8080ff ;border-radius:5px;" class="ui selectable celled table">
      <thead>
        <tr bgcolor="#009ad6" style="border-radius:5px;">
        <td style="text-align:center" colspan=4><font size=5 style="font-family:黑体;">学员发布需求</font></td>
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
      
        <td style="text-align:center" width="90px">手机号:</td>
        <td><div class="ui input">
            <input type="text" id="tell" value="<%=session.getAttribute("tell")%>"/>
          </div></td>
        </tr>
        <tr>
          <td style="text-align:center">年龄:</td>
          <td>
            <div class="ui input">
             <%if(session.getAttribute("age")==null){%>
             <input type="text" id="age" placeholder="请输入年龄"/>
              <% }else{ %>
              <input type="text" id="age" value="<%=session.getAttribute("age")%>"/>
            <%} %>
            </div>
          </td> 
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
                <input type="hidden" id="sex" value="" id="sex"/>
                <div class="default text"><%=session.getAttribute("sex")%></div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                          <div class="item" data-value="男">男</div>
                          <div class="item" data-value="女">女</div>
                        </div>
                <%} %>
            </div>
          </td>
       
         <td style="text-align:center">教师性别要求：</td>
          <td>
            <div class="ui dropdown">
            <%if(session.getAttribute("requestSex")==null){%>
                <input type="hidden" id="requestSex" value=""/>
                
                <div class="default text">教师性别需求</div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                          <div class="item" data-value="男">男</div>
                          <div class="item" data-value="女">女</div>
                        </div>
                        <% }else{ %> 
                <input type="hidden" id="requestSex" value=""/>
                <div class="default text"><%=session.getAttribute("requestSex")%></div>   <!-- 默认显示 -->
                 <i class="dropdown icon"></i>      <!-- 向下的箭头 -->
                    <div class="menu">
                          <div class="item" data-value="男">男</div>
                          <div class="item" data-value="女">女</div>
                        </div>
                <%} %>
            </div>
          </td>
        </tr>
        <tr>
         <td style="text-align:center">辅导地址:</td>
          <td>
            <div class="ui input">
              <%if(session.getAttribute("address")==null){%>
              <input type="text" id="address" placeholder="请输入具体地址"/>
               <% }else{ %>
               <input type="text" id="address" value="<%=session.getAttribute("address")%>" placeholder="请输入具体地址"/>
               <%} %>
            </div>
          </td>
         
            <td style="text-align:center">支付报酬:</td>
          <td>
            <div class="ui input">
            <%if(session.getAttribute("requestMoney")==null){%>
              <input type="text" id="requestMoney" placeholder="请输入价格需求"/>
               <% }else{ %>
              <input type="text" id="requestMoney" value="<%=session.getAttribute("requestMoney")%>"/>
            <%} %>
            </div>
          </td>
        </tr>
        <tr>
       
          
           <td style="text-align:center">需要辅导的科目:</td>
          <td>
            <div class="ui input">
             <%if(session.getAttribute("grade")==null){%>
                <input type="text" id="grade" placeholder="输入格式:年级+科目"/>
              <% }else{ %>
                <input type="text" id="grade" value="<%=session.getAttribute("grade")%>" placeholder="输入格式:年级+科目"/>
               <%} %>
            </div>
          </td>
          <td style="text-align:center">辅导时间安排:</td>
          <td>
            <div class="ui input">
            <%if(session.getAttribute("time")==null){%>
              <input type="text" id="time" placeholder="请输入辅导时间"/>
               <% }else{ %>
              <input type="text" id="time" value="<%=session.getAttribute("time")%>"/>
            <%} %>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center">学生状态:</td>
          <td colspan=3>
            <div class="ui form">
              <div class="field">
                <%if(session.getAttribute("status")==null){%>
                <textarea id="status" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"></textarea>
                 <% }else{ %>
<textarea id="status" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;"><%=session.getAttribute("status")%></textarea>
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
	  var name=$("#name").val();
	  //alert(name);
	  var pid=$("#pid").val();
	  var age=$("#age").val();
	  var sex=$("#sex").val();
	  var time=$("#time").val();
	  var grade=$("#grade").val();
	  var requestSex=$("#requestSex").val();
	  var address=$("#address").val();
	  var status=$("#status").val();
	  var requestMoney=$("#requestMoney").val();
	  var tell=$("#tell").val();
	  //alert(tell);
	  $.ajax({
	    	type:"post",
          	url:"RequestAction",//需要用来处理ajax请求的action,LoginAction为处理的方法名，JsonAction为action名 
          	data:{//设置数据源
         	  name:name,
         	  pid:pid,
	      	  age:age,
	      	  sex:sex,
	      	  time:time,
	      	  grade:grade,
	    	  requestSex:requestSex,
	    	  address:address,
	    	  status:status,
	    	  requestMoney:requestMoney,
	      	  tell:tell
          },
         success:function(){
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