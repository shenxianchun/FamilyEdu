package com.soft.web.teacher;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.TeacherDB;

public class TimeMoneyAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private HttpSession session;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	 public String excute(){
			session = ServletActionContext.getRequest().getSession();
			TeacherDB db=new TeacherDB();
			String tell=(String)session.getAttribute("tell");
			//System.out.print("aaa");
			String teach_time=request.getParameter("teach_time");
			String money=request.getParameter("money");
			//String tell=request.getParameter("tell");
			//System.out.print(tell);
			
			 //送入数据库  注册成功  跳转到个人信息管理界面
		 boolean tt=db.SetTimeMoney(teach_time,money,tell);
			 if(tt){
			 return "success";
		 }else{
				 return "false";
		 }
			

	 }
}
