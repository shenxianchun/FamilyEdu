package com.soft.web.manager;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.StudentDB;
import com.soft.dao.TeacherDB;

public class teachetAuthenticAction extends ActionSupport implements RequestAware{
	private TeacherDB tb=new TeacherDB();
	private StudentDB student=new StudentDB();
	private String u_id;
	private String flag;
	private String pageNow;
	private Map<String, Object> request;
	public String excute(){
		System.out.println(u_id+"认证");
		int page=Integer.parseInt(pageNow);
		int pageCount=tb.getPageCount();
		if(tb.au_teacher(u_id,flag)){
			if(flag.equals("teacher")){
				ArrayList listall=tb.getTeacherPage(page);
				System.out.println(listall);
				request.put("list", listall);
				request.put("pageNow",pageNow);
				request.put("pageCount", pageCount);
				return "teacher";
			}
			if(flag.equals("student")){
				ArrayList listall=student.getTeacherPage(page);
				System.out.println(listall);
				request.put("list", listall);
				request.put("pageNow",pageNow);
				request.put("pageCount", pageCount);
				return "student";
			}
			
		}
		return "teacher";
	}
	public String dell(){
		int page=Integer.parseInt(pageNow);
		int pageCount=tb.getPageCount();
		if(tb.dell_teacher(u_id)){
			if(flag.equals("teacher")){
				ArrayList listall=tb.getTeacherPage(page);
				System.out.println(listall);
				request.put("list", listall);
				request.put("pageNow",pageNow);
				request.put("pageCount", pageCount);
				return "teacher";
			}
			if(flag.equals("student")){
				ArrayList listall=student.getTeacherPage(page);
				System.out.println(listall);
				request.put("list", listall);
				request.put("pageNow",pageNow);
				request.put("pageCount", pageCount);
				return "student";
			}
			
		}
		
		return "teacher";
	}
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getPageNow() {
		return pageNow;
	}
	public void setPageNow(String pageNow) {
		this.pageNow = pageNow;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
