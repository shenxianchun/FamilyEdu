package com.soft.web.teacher;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.TeacherDB;

public class TaddressAction extends ActionSupport implements RequestAware,ServletRequestAware{
	private Map<String, Object> request;
	private HttpServletRequest quest;
	private HttpSession session;
	//查询地址
	public String selectAddress(){
		session = ServletActionContext.getRequest().getSession();
		String tell=(String)session.getAttribute("tell");
		TeacherDB tb=new TeacherDB();
		List<String> user=tb.getAddress(tell);
		ArrayList lesson=tb.getLession(tell);
		if(user!=null){
			if(user.get(0)!=null&&user.get(1)!=null){
				request.put("area", user.get(0));
				request.put("address", user.get(1));
			}
			if(lesson!=null){
				request.put("lesson", lesson);
			}
		}
		return SUCCESS;
	}
	
	
	//更新地址
	public String UpdateAddress(){
		String area=quest.getParameter("area");
		String address=quest.getParameter("address");
		session = ServletActionContext.getRequest().getSession();
		System.out.println("区域："+area+"地址："+address);
		String tell=(String)session.getAttribute("tell");
		if(area!=null&&address!=null){
			TeacherDB tb=new TeacherDB();
			boolean tt=tb.UpdateAddress(area, address, tell);
			ArrayList lesson=tb.getLession(tell);
			if(tt){
				request.put("area",area);
				request.put("address",address);
				if(lesson!=null){
					request.put("lesson", lesson);
				}
			}
		}
		return SUCCESS;
	}
	
	
	//添加授课
	public String Addlesson(){
			String grade=quest.getParameter("grade");
			String subject=quest.getParameter("subject");
			session = ServletActionContext.getRequest().getSession();
			System.out.println("年级："+grade+"科目："+grade);
			String tell=(String)session.getAttribute("tell");
			if(grade!=null && subject!=null){
				TeacherDB tb=new TeacherDB();
				List<String> user=tb.getAddress(tell);
				boolean tt=tb.setLession(tell, grade, subject);
				if(tt){
					ArrayList lesson=tb.getLession(tell);
					if(lesson!=null){
						if(user!=null){
							request.put("area", user.get(0));
							request.put("address", user.get(1));
						}
						request.put("lesson", lesson);
					}
					
				}
			}
			
			return SUCCESS;
		}
		
		//删除授课信息
	public String Dellesson(){
			String id=quest.getParameter("id");
			session = ServletActionContext.getRequest().getSession();
			System.out.println("id："+id);
			String tell=(String)session.getAttribute("tell");
			if(id!=null){
				TeacherDB tb=new TeacherDB();
				List<String> user=tb.getAddress(tell);
				boolean tt=tb.dellLession(id, tell);
				if(tt){
					ArrayList lesson=tb.getLession(tell);
					if(lesson!=null){
						if(user!=null){
							request.put("area", user.get(0));
							request.put("address", user.get(1));
						}
						request.put("lesson", lesson);
					}
					
				}
			}
			
			return SUCCESS;
		}
		
		
		
		
		@Override
		public void setRequest(Map<String, Object> arg0) {
			// TODO Auto-generated method stub
			this.request = arg0;
		}
		@Override
		public void setServletRequest(HttpServletRequest arg0) {
			// TODO Auto-generated method stub
			this.quest=arg0;
		}
}
