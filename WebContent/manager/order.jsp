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
		int pageNow=Integer.valueOf(now);
		String s_pageCount=request.getAttribute("pageCount").toString().trim();
		int pageCount=Integer.parseInt(s_pageCount);
	%>
	<div id="right">
		<div class="employee_show">
			<table width="900px" style="border:3px solid #CA0EE4" class="ui selectable celled table">
			<thead>
				<tr bgcolor="#009ad6">
					<td width="70px" height="50px">编号</td>
					<td width="90px">教员姓名</td>
					<td width="70px">教员电话</td>
					<td width="70px">学员姓名</td>
					<td width="70px">学员电话</td>
					<td width="100px">辅导科目</td>
					<td width="70px">辅导时间</td>
					<td width="100px">辅导地址</td>
					<td width="100px">上课方式</td>
					<td width="70px">价格</td>
					<td width="70px">创建时间</td>
					<td width="70px">备注</td>
					<td width="70px">状态</td>
					<td width="150px">操作</td>
				</tr>
			</thead>
			<tbody>
				<%
				ArrayList list=(ArrayList)request.getAttribute("list");
				if(list!=null){
				for(int i=0;i<list.size();i++){
					//从al中取出UserBean
					OrderBean ob=(OrderBean)list.get(i);
				%>
				<!-- fadeInRightBig 、flipInX 、lightSpeedIn  、zoomIn-->
				<tr class="animated zoomIn" >
					<td><%=ob.getId() %></td>
					<td><%=ob.getT_name() %></td>
					<td><%=ob.getT_tell() %></td>
					<td><%=ob.getS_name()%></td>
					<td><%=ob.getS_tell() %></td>
					<td><%=ob.getSubject() %></td>
					<td><%=ob.getRtime() %></td>
					<td><%=ob.getAddress() %></td>
					<td><%=ob.getMethod() %></td>
					<td><%=ob.getMoney() %></td>
					<td><%=ob.getCreate_time() %></td>
					<td><%=ob.getRemark() %></td>
					<td>
						<%if(ob.getRstatu().equals("2")){ %>
						预约
						<%} %>
						<%if(ob.getRstatu().equals("3")){ %>
						试讲中
						<%} %>
						<%if(ob.getRstatu().equals("4")){ %>
						成功
						<%} %>
					</td>
					<td>
					<span>
					<a href="OrderAction!UpdateOrder?pageNow=<%=pageNow %>&id=<%=ob.getId()%>&flag=3&s_tell=<%=ob.getS_tell() %>&t_tell=<%=ob.getT_tell() %>">试讲</a>
					</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span>
					<a href="OrderAction!UpdateOrder?pageNow=<%=pageNow %>&id=<%=ob.getId()%>&flag=4&s_tell=<%=ob.getS_tell() %>&t_tell=<%=ob.getT_tell() %>">成功</a>
					</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<span>
					<a href="OrderAction!dellOrder?id=<%=ob.getId()%>&pageNow=<%=pageNow %>">删除</a>
					</span>
					</td>
					
					
				</tr>
				<%}}%>
				</tbody>
			</table>
		</div>
		
		 <div class="ui floated pagination menu" id="pages">
			<% //从request中得到pageNow
			    
				
				if(pageNow!=1){
					out.println("<a href=OrderAction?pageNow="+(pageNow-1)+" class='item'>上一页</a>");
				}else{
					out.println("<a href=OrderAction?pageNow=1 class='item'>上一页</a>");
				}
				//得到pageCount
				
				for(int i=1;i<=pageCount;i++){
					out.println("<a href=OrderAction?pageNow="+i+" class='item'>"+i+"</a>");
				}
				if(pageNow!=pageCount){
					out.println("<a href=OrderAction?pageNow="+(pageNow+1)+" class='item'>下一页</a>");
				}else{
					out.println("<a href=OrderAction?pageNow="+pageNow+" class='item'>下一页</a>");
				}
			%>
			<a class='item'>共<span id="pageCount"><%=pageCount%></span>页</a>
		</div>
	</div>
	<%}%>
</body>
</html>