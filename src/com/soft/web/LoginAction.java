package com.soft.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.UserDB;

public class LoginAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private String userresult;
	private HttpSession session;
	public String getUserresult() {
		return userresult;
	}
	public void setUserresult(String userresult) {
		this.userresult = userresult;
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	 public String excute(){
			try{
			 String usertell = request.getParameter("usertell");
			 String password = request.getParameter("password");
			 String randomNumber = request.getParameter("randomNumber");
			 UserDB db=new UserDB();
			 session = ServletActionContext.getRequest().getSession();
			 System.out.println("*****************"+usertell+":"+password+randomNumber);
			 //将数据存储在map里，再转换成json类型数据，也可以自己手动构造json类型数据
			 Map<String,Object> map = new HashMap<String,Object>();
			 if(!session.getAttribute("randomNumber").equals(randomNumber)){
				 map.put("random", "验证码错误");
			 }
			 List<String> user=db.login(usertell, password);
			 String role="";
			 if(user!=null){
				 if(user.get(3).equals("教员")){
					 role="teacher";
					 map.put("url","index.jsp");
				 }
				 if(user.get(3).equals("学员")){
					role="student";
					map.put("url", "index.jsp");
				}
				 if(user.get(3).equals("管理员")){
						role="manager";
						map.put("url", "teacher.jsp");
					}
				 //将姓名 id传入session;
				 String name=db.username(user.get(0),role);
				 if(name==null){
					 name="您好";
				 }
				 if(user.get(3).equals("管理员")){
					 ActionContext.getContext().getSession().put("m_name",name);
					 ActionContext.getContext().getSession().put("m_tell",user.get(1));
					 ActionContext.getContext().getSession().put("m_role",user.get(3));
					 ActionContext.getContext().getSession().put("m_u_id",user.get(0));
				 }else{
					 ActionContext.getContext().getSession().put("tell",user.get(1));
					 ActionContext.getContext().getSession().put("name",name);
					 ActionContext.getContext().getSession().put("role",user.get(3));
					 ActionContext.getContext().getSession().put("u_id",user.get(0));
				 }
				 
			 }else{
				 map.put("user", "用户名或密码错误");
			 }
			 
			 JSONObject json = JSONObject.fromObject(map);//将map对象转换成json类型数

			 userresult = json.toString();//给result赋值，传递给页面
			 System.out.println(userresult);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
			 return SUCCESS;
		 }
	
	
}
