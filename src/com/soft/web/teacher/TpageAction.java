package com.soft.web.teacher;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.TeacherDB;

public class TpageAction extends ActionSupport implements RequestAware{
	private String pageNow;
	private Map<String, Object> request;
	
	public String excute() {
		TeacherDB teacher=new TeacherDB();
		System.out.println("第"+pageNow+"页");
		int page=Integer.parseInt(pageNow);
		int pageCount=teacher.getPageCount();
		ArrayList listall=teacher.getTeacherPage(page);
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