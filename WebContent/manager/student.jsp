<%@ page language="java" import="java.util.*,com.soft.Bean.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员管理</title>
</head>
<body>
	<div>
		<%@include file="top.jsp" %>
	</div>
	
	<div id="right">
		
		<div class="employee_show">
			<table width="900px" style="border:3px solid #CA0EE4" class="ui selectable celled table">
			<thead>
				<tr bgcolor="#009ad6">
					<td width="70px" height="50px">编号</td>
					<td width="90px">姓名</td>
					<td width="70px">性别</td>
					<td width="70px">年龄</td>
					<td width="70px">身份证</td>
					<td width="70px">电话</td>
					<td width="70px">时间安排</td>
					<td width="100px">辅导科目</td>
					<td width="70px">状态</td>
					<td width="70px">性别要求</td>
					<td width="100px">地址</td>
					<td width="100px">价格</td>
					<td width="70px">核实/注册时间</td>
					<td width="70px">认证</td>
					<td width="70px">删除</td>
				</tr>
			</thead>
			<tbody>
				<%
				ArrayList list=(ArrayList)request.getAttribute("list");
				if(list!=null){
				for(int i=0;i<list.size();i++){
					//从al中取出UserBean
					StudentBean tb=(StudentBean)list.get(i);
				%>
				<!-- fadeInRightBig 、flipInX 、lightSpeedIn  、zoomIn-->
				<tr class="animated zoomIn">
					<td><%=tb.getU_id() %></td>
					<td><%=tb.getS_name() %></td>
					<td><%=tb.getSex() %></td>
					<td><%=tb.getAge() %></td>
					<td><%=tb.getPid()%></td>
					<td><%=tb.getTell()%></td>
					<td><%=tb.getTime()%></td>
					<td><%=tb.getGrade()%></td>
					<td><%=tb.getStatus()%></td>
					<td><%=tb.getRequestSex()%>教员</td>
					<td><%=tb.getAddress()%></td>
					<td>￥<%=tb.getRequestMoney()%></td>
					<td><%=tb.getCreate_time()%></td>
					<%if(!tb.getAuthentication().equals("0")){%>
						<td>已核实</td>
					<%}else{ %>
					<td>
						<a href="teachetAuthenticAction!excute?u_id=<%=tb.getU_id() %>&pageNow=1&flag=student" style="color:red;">待核实</a>
					</td>
					<%} %>
					
					<td>
					<a href="teachetAuthenticAction!dell?u_id=<%=tb.getU_id() %>&pageNow=1&flag=student" style="color:red;">删除</a>
					</td>
				</tr>
				<%}}%>
				</tbody>
			</table>
		</div>
		<%
			if(request.getAttribute("pageNow")!=null){
				String now=request.getAttribute("pageNow").toString().trim();
			%>
		 <div class="ui floated pagination menu" id="pages">
			<% //从request中得到pageNow
			    
				int pageNow=Integer.valueOf(now);
				if(pageNow!=1){
					out.println("<a href=StudentpageAction?pageNow="+(pageNow-1)+" class='item'>上一页</a>");
				}else{
					out.println("<a href=StudentpageAction?pageNow=1 class='item'>上一页</a>");
				}
				//得到pageCount
				String s_pageCount=request.getAttribute("pageCount").toString().trim();
				int pageCount=Integer.parseInt(s_pageCount);
				for(int i=1;i<=pageCount;i++){
					out.println("<a href=StudentpageAction?pageNow="+i+" class='item'>"+i+"</a>");
				}
				if(pageNow!=pageCount){
					out.println("<a href=StudentpageAction?pageNow="+(pageNow+1)+" class='item'>下一页</a>");
				}else{
					out.println("<a href=StudentpageAction?pageNow="+pageNow+" class='item'>下一页</a>");
				}
			%>
			<a class='item'>共<span id="pageCount"><%=pageCount%></span>页</a>
		</div>
			<%}%>
	</div>
	
</body>
</html>