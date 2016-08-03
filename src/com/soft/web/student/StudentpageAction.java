package com.soft.web.student;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.StudentDB;

public class StudentpageAction extends ActionSupport implements RequestAware{
	private String pageNow;
	private Map<String, Object> request;
	public String excute() {
		StudentDB student=new StudentDB();
		System.out.println("第"+pageNow+"页");
		int page=Integer.parseInt(pageNow);
		int pageCount=student.getPageCount();
		ArrayList listall=student.getTeacherPage(page);
		System.out.println(listall);
		request.put("list", listall);
		request.put("pageNow",pageNow);
		request.put("pageCount", pageCount);
		
		System.out.println(request.get("pageCount"));
		return "success";
	}
	public String getPageNow() {
		return pageNow;
	}
	public void setPageNow(String pageNow) {
		this.pageNow = pageNow;
	}
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}
}
