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
			<%
			if(request.getAttribute("pageNow")!=null){
				String now=request.getAttribute("pageNow").toString().trim();
			%>
	<div id="right">
		
		<div class="employee_show">
			<table width="900px" style="border:3px solid #CA0EE4" class="ui selectable celled table">
			<thead>
				<tr bgcolor="#009ad6">
					<td width="70px" height="50px">编号</td>
					<td width="90px">姓名</td>
					<td width="70px">电话</td>
					<td width="70px">角色</td>
					<td width="70px">反馈内容</td>
					<td width="70px">反馈时间</td>
					<td width="70px">删除</td>
				</tr>
			</thead>
			<tbody>
				<%
				ArrayList list=(ArrayList)request.getAttribute("list");
				if(list!=null){
				for(int i=0;i<list.size();i++){
					//从al中取出UserBean
					FeedbackBean fb=(FeedbackBean)list.get(i);
				%>
				<!-- fadeInRightBig 、flipInX 、lightSpeedIn  、zoomIn-->
				<tr class="animated zoomIn">
					<td><%=fb.getId() %></td>
					<td><%=fb.getName() %></td>
					<td><%=fb.getTell() %></td>
					<td><%=fb.getRole() %></td>
					<td><%=fb.getContent()%></td>
					<td><%=fb.getCreate_time()%></td>
					<td>
					<a href="FeedbackAction!dell?id=<%=fb.getId() %>&pageNow=<%=now %>" style="color:red;">删除</a>
					</td>
				</tr>
				<%}}%>
				</tbody>
			</table>
		</div>
		 <div class="ui floated pagination menu" id="pages" style="top:530px;">
			<% //从request中得到pageNow
				int pageNow=Integer.valueOf(now);
				if(pageNow!=1){
					out.println("<a href=FeedbackAction?pageNow="+(pageNow-1)+" class='item'>上一页</a>");
				}else{
					out.println("<a href=FeedbackAction?pageNow=1 class='item'>上一页</a>");
				}
				//得到pageCount
				String s_pageCount=request.getAttribute("pageCount").toString().trim();
				int pageCount=Integer.parseInt(s_pageCount);
				for(int i=1;i<=pageCount;i++){
					out.println("<a href=FeedbackAction?pageNow="+i+" class='item'>"+i+"</a>");
				}
				if(pageNow!=pageCount){
					out.println("<a href=FeedbackAction?pageNow="+(pageNow+1)+" class='item'>下一页</a>");
				}else{
					out.println("<a href=FeedbackAction?pageNow="+pageNow+" class='item'>下一页</a>");
				}
			%>
			<a class='item'>共<span id="pageCount"><%=pageCount%></span>页</a>
		</div>
			
	</div>
	<%}%>
</body>
</html>