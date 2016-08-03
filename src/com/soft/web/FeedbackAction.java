package com.soft.web;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.FeedbackDB;
import com.soft.dao.TeacherDB;

public class FeedbackAction extends ActionSupport implements RequestAware{
	private String pageNow;
	private String content;
	private String id;
	private Map<String, Object> request;
	private HttpSession session = ServletActionContext.getRequest().getSession();;
	private FeedbackDB fb=new FeedbackDB();
	
	public String execute(){
		System.out.println("第"+pageNow+"页");
		int page=Integer.parseInt(pageNow);
		int pageCount=fb.getPageCount();
		ArrayList listall=fb.getOrderPage(page);
		System.out.println(listall);
		request.put("list", listall);
		request.put("pageNow",pageNow);
		request.put("pageCount", pageCount);
		System.out.println(request.get("pageCount"));
		return SUCCESS;
	}
	public String addFeedback(){
		String tell=(String)session.getAttribute("tell");
		String name=(String)session.getAttribute("name");
		String role=(String)session.getAttribute("role");
		System.out.println(tell+"号，姓名"+name+"角色："+role);
		if(fb.addfeedback(tell, name, role, content)){
			int page=Integer.parseInt(pageNow);
			int pageCount=fb.getPageCount();
			ArrayList listall=fb.getOrderPage(page);
			System.out.println(listall);
			request.put("list", listall);
			request.put("pageNow",pageNow);
			request.put("pageCount", pageCount);
			return "success";
		}
		return "success";
	}
	public String dell(){
		if(fb.dell(id)){
			int page=Integer.parseInt(pageNow);
			int pageCount=fb.getPageCount();
			ArrayList listall=fb.getOrderPage(page);
			System.out.println(listall);
			request.put("list", listall);
			request.put("pageNow",pageNow);
			request.put("pageCount", pageCount);
		}
		return SUCCESS;
	}
	
	public String getPageNow() {
		return pageNow;
	}
	public void setPageNow(String pageNow) {
		this.pageNow = pageNow;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}
}
