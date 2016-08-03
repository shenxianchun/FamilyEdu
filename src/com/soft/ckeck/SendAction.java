package com.soft.ckeck;

import java.util.HashMap;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.UserDB;

public class SendAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest request;
	private String RegesterResult;
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	public String getRegesterResult() {
		return RegesterResult;
	}
	public void setRegesterResult(String regesterResult) {
		RegesterResult = regesterResult;
	}
	public String excute(){
		try{
		 String role=request.getParameter("role");//此项获得角色
		 String usertell = request.getParameter("usertell");
		 String password=request.getParameter("password");
		 
		 int mobile_code = (int)((Math.random()*9+1)*100000);//手机验证码内容
		 System.out.println(usertell+"+密码:"+password+"验证码："+mobile_code);
		 UserDB db=new UserDB();
		 sendsms code=new sendsms();
		 Map<String,Object> map = new HashMap<String,Object>();
		 if(db.regester(usertell)){
			 map.put("user", "false");
		 }else{
			 ActionContext.getContext().getSession().put("role",role);
			 ActionContext.getContext().getSession().put("tell",usertell);
			 ActionContext.getContext().getSession().put("password",password);
			 ActionContext.getContext().getSession().put("mobile_code",mobile_code);
			 map.put("mobile_code", mobile_code);
			 code.sendTell(usertell, mobile_code);
		 }
		 
		 JSONObject json = JSONObject.fromObject(map);//将map对象转换成json类型数
		 RegesterResult = json.toString();//给result赋值，传递给页面
		 System.out.println(RegesterResult);
		 
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		return SUCCESS;
	}
	
}
