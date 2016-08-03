package com.soft.web.student;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.StudentDB;

public class MyRequestAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private HttpSession session;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	 public String excute(){
	 session = ServletActionContext.getRequest().getSession();
		StudentDB db=new StudentDB();
		String tell=(String)session.getAttribute("tell");
		System.out.print(tell);
		System.out.print("bbb");
		List<String> student=db.Select(tell);
		request.setAttribute("student", student);
		 return "success";
}
}
