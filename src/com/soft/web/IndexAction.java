package com.soft.web;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.FilterDispatcher;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.TeacherDB;


public class IndexAction extends ActionSupport implements RequestAware{
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}
	public String excute() {
		TeacherDB teacher=new TeacherDB();
		ArrayList list=teacher.getTeacherPage(1);
		request.put("list", list);
		return SUCCESS;
	}
	
}
