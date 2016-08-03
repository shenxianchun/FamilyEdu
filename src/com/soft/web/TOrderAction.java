package com.soft.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.StudentDB;
import com.soft.dao.TeacherDB;

public class TOrderAction extends ActionSupport implements ServletRequestAware{

	private HttpServletRequest request;
	private HttpSession session;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	 public String excute(){
		 session = ServletActionContext.getRequest().getSession();
		 String tell=(String)session.getAttribute("tell");
		 String role= (String) session.getAttribute("role");
		 System.out.println(tell+role+"8888888888888888888888888888");
		 if(tell!=null&&role!=null){
			 TeacherDB tb=new TeacherDB();
			 if(role.equals("学员")){
				 ArrayList order=tb.order(tell, role);
				 if(order!=null){
					 request.setAttribute("order", order);
				 }
				 return "student";
			 }
			 if(role.equals("教员")){
				 ArrayList order=tb.order(tell, role);
				 if(order!=null){
					 request.setAttribute("order", order);
				 }
				 return "success";
			 }
		 }
		 return "success";
		
	}

}
