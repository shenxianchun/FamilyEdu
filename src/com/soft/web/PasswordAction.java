package com.soft.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.StudentDB;
import com.soft.dao.UserDB;

public class PasswordAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private HttpSession session;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	 public String excute(){
	 session = ServletActionContext.getRequest().getSession();
		UserDB db=new UserDB();
		String tell=(String)session.getAttribute("tell");
		String password=request.getParameter("password");
		//System.out.print(tell);
		//System.out.print("bbb");
		boolean tt=db.UpdatePW(tell,password);
		
		 return "success";

}
}
