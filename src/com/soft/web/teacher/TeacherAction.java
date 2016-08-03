package com.soft.web.teacher;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.soft.Bean.TeacherBean;
import com.soft.dao.TeacherDB;
import com.soft.dao.UserDB;

public class TeacherAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private HttpSession session;
	private String u_id;
	public TeacherAction(){
		request = ServletActionContext.getRequest();
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	
	//2016-7-21添加start教员个人信息
	 public String TeacherInfo(){
			TeacherDB teacher=new TeacherDB();
			System.out.println("查看"+u_id+"号教员信息");
			TeacherBean listinfo=teacher.getTeacherInfo(u_id);
			request.setAttribute("listinfo", listinfo);
			System.out.println("教员个人信息页面："+listinfo);
			return "successinfo";
	 }
	//2016-7-21添加end
	 
	 
	 
	 public String excute(){
		 	session = ServletActionContext.getRequest().getSession();
			TeacherDB db=new TeacherDB();
			String tel=(String)session.getAttribute("tell");
			//System.out.print("aaa");
			String username=request.getParameter("username");
			String sex=request.getParameter("sex");
			String pid=request.getParameter("pid");
			String age=request.getParameter("age");
			String graduate_school=request.getParameter("graduate_school");
			String specialty=request.getParameter("specialty");
			String education=request.getParameter("education");
			String email=request.getParameter("email");
			String nation=request.getParameter("nation");
			String experience=request.getParameter("experience");
			String motto=request.getParameter("motto");
			String introduce=request.getParameter("introduce");
		    String tell=request.getParameter("tell");
			//System.out.print(tell);
			//送入数据库  注册成功  跳转到个人信息管理界面
		    boolean tt=db.UpdateTeacher(pid,username,sex,age,nation,email,motto,introduce,graduate_school,specialty,education,experience,tell);
			if(tt){
				System.out.println("教员信息更新成功");
			}
		    if(tel!=null){
					System.out.println(tel);
				 List<String> teacher=db.Select(tel);
				 System.out.println(teacher);
				 if(teacher!=null){
					//将姓名 id传入session;
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
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	
	
}
