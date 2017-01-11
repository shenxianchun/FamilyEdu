package com.article.web;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class ArticleAction extends ActionSupport implements RequestAware{
	private Map<String, Object> request;
	public String execute() throws Exception {
		ArticleFamily articlelist=new ArticleFamily();
		Map<String,Map<String,String>> Typelist=articlelist.ArticleType();
		request.put("list", Typelist);
		return SUCCESS;
	}
	
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}
}
