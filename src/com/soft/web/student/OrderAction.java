package com.soft.web.student;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.StudentDB;

public class OrderAction extends ActionSupport implements ServletRequestAware{

	private HttpServletRequest request;
	private HttpSession session;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	 public String excute(){
		
			StudentDB db=new StudentDB();
			System.out.print("bbb");
			session = ServletActionContext.getRequest().getSession();
			String s_name=request.getParameter("s_name");
			String s_tell=request.getParameter("s_tell");
			String t_name=request.getParameter("t_name");
			String subject=request.getParameter("subject");
			String Rtime=request.getParameter("Rtime");
			String address=request.getParameter("address");
			String method=request.getParameter("method");
		    String remark=request.getParameter("remark");
		    String ttell=(String)session.getAttribute("ttell");
		    String money=(String)session.getAttribute("money");
		    db.addOrder(s_name, t_name, s_tell, subject, Rtime, address, method, remark,ttell,money);
			 return "success";
	}

}
