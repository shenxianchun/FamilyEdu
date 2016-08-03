package com.soft.web.teacher;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.TeacherDB;


public class SelectAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private HttpSession session;
	private TeacherDB db=new TeacherDB();
	private String tel;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	 public String excute(){
		 	session = ServletActionContext.getRequest().getSession();
			tel=(String)session.getAttribute("tell");
			if(tel!=null){
				System.out.println(tel);
			 List<String> teacher=db.Select(tel);
			 
			 System.out.println(teacher);
			 if(teacher!=null){
				//将姓名 id传入session;
				 request.setAttribute("teacher", teacher);
				 System.out.print(teacher.get(0));
				 ActionContext.getContext().getSession().put("name",teacher.get(0));
				 ActionContext.getContext().getSession().put("pid",teacher.get(1));
				 ActionContext.getContext().getSession().put("age",teacher.get(2));
				 ActionContext.getContext().getSession().put("sex",teacher.get(3));
				 ActionContext.getContext().getSession().put("nation",teacher.get(4));
				 ActionContext.getContext().getSession().put("email",teacher.get(5));
				 ActionContext.getContext().getSession().put("motto",teacher.get(6));
				 ActionContext.getContext().getSession().put("introduce",teacher.get(7));
				 ActionContext.getContext().getSession().put("graduate_school",teacher.get(8));
				 ActionContext.getContext().getSession().put("specialty",teacher.get(9));
				 ActionContext.getContext().getSession().put("education",teacher.get(10));
				 ActionContext.getContext().getSession().put("experience",teacher.get(11));
			 }
			}
		return "success";
	 }
	 
}
