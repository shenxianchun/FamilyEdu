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
   <%List<String> student=(List)request.getAttribute("student"); %>
  <form  action="RequestAction" name="form1" method="post">
    <table width="500px" style="border:2px solid #8080ff ;border-radius:5px;" class="ui selectable celled table">
      <thead>
        <tr bgcolor="#009ad6" style="border-radius:5px;">
        <td style="text-align:center" colspan=4><font size=5 style="font-family:黑体;">我的需求</font></td>
        </tr>
      </thead>
        <tbody>
        <tr>
        <td style="text-align:center" width="90px">姓名:</td>
        <td>
          <div class="ui input">
          <%if(student.get(0)==null){%>
        	  <input type="text" id="s_name" placeholder="还没有录入"/ disabled>
          <% }else{ %>
            <input type="text" id="s_name" value="<%=student.get(0)%>" disabled/>
            <%} %>
          </div>
        </td>
      
        <td style="text-align:center" width="90px">手机号:</td>
        <td><div class="ui input">
            <input type="text" id="tell" value="<%=session.getAttribute("tell")%>" disabled/>
          </div></td>
        </tr>
        <tr>
          <td style="text-align:center">年龄:</td>
          <td>
            <div class="ui input">
             <%if(student.get(2)==null){%>
             <input type="text" id="s_age" placeholder="还没有录入" disabled/>
              <% }else{ %>
              <input type="text" id="s_age" value="<%=student.get(2)%>" disabled/>
            <%} %>
            </div>
          </td> 
           <td style="text-align:center">身份证号:</td>
          <td>
            <div class="ui input">
             <%if(student.get(1)==null){%>
              <input type="text" id="s_pid" placeholder="还没有录入" disabled/>
               <% }else{ %>
              <input type="text" id="s_pid" value="<%=student.get(1)%>" disabled/>
            <%} %>
            </div>
          </td>
        </tr>
        <tr>
         <td style="text-align:center">性别</td>
          <td>
            <div class="ui input">
            <%if(student.get(3)==null){%>
                <input type="text" id="s_sex" placeholder="还没有录入" disabled/>
                        <% }else{ %> 
               <input type="text" id="s_sex" value="<%=student.get(3)%>" disabled/>
                <%} %>
            </div>
          </td>
       
         <td style="text-align:center">教师性别：</td>
          <td>
            <div class="ui input">
            <%if(student.get(6)==null){%>
                 <input type="text" id="s_requestSex" placeholder="还没有录入" disabled/>
                        <% }else{ %> 
                <input type="text" id="s_requestSex" value="<%=student.get(6)%>" disabled/>
                <%} %>
            </div>
          </td>
        </tr>
        <tr>
         <td style="text-align:center">辅导地址</td>
          <td>
            <div class="ui input">
              <%if(student.get(7)==null){%>
              <input type="text" id="s_address" placeholder="还没有录入" disabled/>
               <% }else{ %>
               <span><%=student.get(7)%></span>
               <%} %>
            </div>
          </td>
         
            <td style="text-align:center">支付报酬:</td>
          <td>
            <div class="ui input">
            <%if(student.get(9)==null){%>
               <input type="text" id="s_requestMoney" placeholder="还没有录入" disabled/>
               <% }else{ %>
              <input type="text" id="s_requestMoney" value="<%=student.get(9)%>" disabled/>
            <%} %>
            </div>
          </td>
        </tr>
        <tr>
     
           <td style="text-align:center">需要辅导科目:</td>
          <td>
            <div class="ui input">
             <%if(student.get(5)==null){%>
                <input type="text" id="s_grade" placeholder="还没有录入" disabled/>
                     <% }else{ %>
                <input type="text" id="s_grade" value="<%=student.get(5)%>" disabled/>    
                      <%} %>
            </div>
          </td>
          <td style="text-align:center">辅导时间安排:</td>
          <td>
            <div class="ui input">
            <%if(student.get(4)==null){%>
              <input type="text" id="s_time" placeholder="还没有录入" disabled/>
               <% }else{ %>
              <input type="text" id="s_time" value="<%=student.get(4)%>" disabled/>
            <%} %>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center">学生状态:</td>
          <td colspan=3>
            <div class="ui form">
              <div class="field">
                <%if(student.get(8)==null){%>
                <textarea id="status" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;" disabled></textarea>
                 <% }else{ %>
 <textarea id="status" style="width: 500px; height: 112px; margin-top: 0px; margin-bottom: 0px;" disabled><%=student.get(8)%></textarea>
                  <%} %>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td style="text-align:center" colspan=4>
           <a href="student/set_request.jsp"> <input type="button" value="点我去编辑" class="ui blue button"/></a>
           
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
</script>
</body>
</html>