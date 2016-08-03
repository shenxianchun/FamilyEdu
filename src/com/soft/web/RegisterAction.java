package com.soft.web;

import javax.servlet.http.HttpSession;


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.UserDB;

public class RegisterAction extends ActionSupport{

	 private HttpSession session;
	 public String excute(){
			session = ServletActionContext.getRequest().getSession();
			UserDB db=new UserDB();
			String role= (String) session.getAttribute("role");
			String usertell = (String) session.getAttribute("tell");
			String password = (String) session.getAttribute("password");
			 //送入数据库  注册成功  跳转到个人信息管理界面
			 boolean tt=db.InsertUser(usertell, password, role);
			 
			 if(tt){
				 String uid=db.Uid(usertell);
				 session.setAttribute("u_id", uid);
				 boolean t=db.Insert(uid,usertell, role);
				 if(t){
					 return "success";
				 }else{
					 return "false";
				 }
			 }else{
				 return "false";
			 }
	 }
	 
}
