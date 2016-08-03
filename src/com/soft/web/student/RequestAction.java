package com.soft.web.student;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.StudentDB;
import com.soft.dao.TeacherDB;

public class RequestAction extends ActionSupport implements ServletRequestAware{
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
		String tel=(String)session.getAttribute("tell");
		System.out.print(tel);
		System.out.print("bbb");
		String name=request.getParameter("name");
		
		System.out.print("bbb");
		String sex=request.getParameter("sex");
		//String name=request.getParameter("name");
		String pid=request.getParameter("pid");
		String age=request.getParameter("age");
		String time=request.getParameter("time");
		String grade=request.getParameter("grade");
		System.out.print("bbb");
		String requestSex=request.getParameter("requestSex");
		String address=request.getParameter("address");
		String requestMoney=request.getParameter("requestMoney");
		String status=request.getParameter("status");
		String tell=request.getParameter("tell");
		//System.out.print("bbb");
		System.out.print(tell);
		//送入数据库  注册成功  跳转到个人信息管理界面
	    boolean tt=db.UpdateStudent(name,pid,age,sex,time,grade,requestSex,address,status,requestMoney,tell);
		if(tel!=null){
				System.out.println(tel);
			 List<String> student=db.Select(tel);
			 System.out.println(student);
			 if(student!=null){
				//将姓名 id传入session;
				 System.out.print(student.get(0));
				 request.setAttribute("student", student);
			 }
			
	 }	
		 return "success";

}
}
