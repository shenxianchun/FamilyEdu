<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>教员认证</title>
	<link rel="stylesheet" type="text/css" href="css/semantic.min.css">
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
      height: 1200px;
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
      border-top: 1px solid #e6e6e6;
      border-bottom: 1px solid #e6e6e6;
      padding-bottom: 10px;
      font-size: 28px;
    }
    .head{
      width:800px;
      height:300px;
      padding: 18px;
    }
    .head ul li{
      width:222px;
      height:277px;
      float:left;
      list-style: none;
      border-right: 1px dotted #e6e6e6;
    }
    .head ul{
      margin-left: 100px;
    }
    #sure{
      text-align: center;
      border-right: none;
      
    }
    #sure p{
      margin-top: -15px;
      font-size: 18px;
    }
    #file{
      width:100px;
    }
    #select p{
      margin-top: -58px;
    }
    .education{
      width:896px;
      height:66px;
      margin-top: 320px;
    }
    .education_title{
      border-top: 1px solid #e6e6e6;
      border-bottom: 1px solid #e6e6e6;
      padding-bottom: 10px;
      font-size: 28px;
    }
    .count{
      position: absolute;
      width:349px;
      top:276px;
      right:12px;
      font-size: 18px;
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

  <div class="count">
    1、请提交在有效期内的教师认证照片，需保证头像及文字清晰可见<br/>
    2、证书认证可提升家长(学生)对专业教师身份的信任度<br/>
    3、证书认证后可提高您的信用等级，搜索排名将增加相关权数<br/>
    4、请勿使用Photoshop、美图等软件对图片进行PS<br/>
    5、支持jpg、png格式，单张照片在10k-2M之间<br/>
  </div>
  <div class="teacher_right">
     <div class="address">
     <% List<String> list=(List)session.getAttribute("path"); %>
        <div class="title">头像认证</div>
        <div class="head">
          <ul>
            <li id="select">
            <%if(list.get(0)!=null){%>
               <img src="<%=list.get(0)%>" width="200px" height="230px">
              <%} %>
              <p>
                <form action="AuthenticAction!head" method="post" enctype="multipart/form-data">
                    <input type="file" name="headimg" id="file" value="选择">
                    <input type="submit" value="上传" class="ui green button"/>
                </form>
              </p>
            </li>
            <li id="sure">
              <img src="images/5.jpg" width="200px" height="230px">
              <p>正确示例</p>
            </li>
          </ul>
        </div>
        <div class="subject">
          <div class="subject_title">证件认证</div>
            <div class="head">
            <ul>
              <li id="select">
                 <%if(list.get(1)!=null){%>
               <img src="<%=list.get(1)%>" width="200px" height="230px">
              <%} %>
                <p>
                  <form action="AuthenticAction!pid" method="post" enctype="multipart/form-data">
                      <input type="file" name="pidimg" id="file" value="选择">
                      <input type="submit" value="上传" class="ui green button"/>
                  </form>
                </p>
              </li>
              <li id="sure">
                <img src="images/3.jpg" width="200px" height="230px">
                <p>正确示例</p>
              </li>
            </ul>
          </div>
        </div>

        <div class="education">
          <div class="education_title">学历认证</div>
           <div class="head">
            <ul>
              <li id="select">
                   <%if(list.get(2)!=null){%>
               <img src="<%=list.get(2)%>" width="200px" height="230px">
              <%} %>
                <p>
                  <form action="AuthenticAction!education" method="post" enctype="multipart/form-data">
                      <input type="file" name="eduimg" id="file" value="选择">
                      <input type="submit" value="上传" class="ui green button"/>
                  </form>
                </p>
              </li>
              <li id="sure">
                <img src="images/2.jpg" width="200px" height="230px">
                <p>正确示例</p>
              </li>
            </ul>
          </div>
        </div>
  </div>
  </div>
</body>
</html>