package com.soft.web.student;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.Bean.StudentBean;
import com.soft.dao.StudentDB;

public class StudentAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private String u_id;
	public StudentAction(){
		request = ServletActionContext.getRequest();
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
		//2016-7-21添加start
	 public String StudentInfo(){
		 StudentDB student=new StudentDB();
			System.out.println("查看"+u_id+"号学员信息");
			StudentBean listinfo=student.getStudentInfo(u_id);
			request.setAttribute("listinfo", listinfo);
			System.out.println("学员个人信息页面："+listinfo);
			return SUCCESS;
	 }
		//2016-7-21添加end
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	 
	
	 
	 
	 
}
