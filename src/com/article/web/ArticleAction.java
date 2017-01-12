package com.article.web;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.StudentDB;

public class ArticleAction extends ActionSupport implements RequestAware{
	private Map<String, Object> request;
	private ArticleFamily family=new ArticleFamily();
	private String urlkey;
	public String execute() throws Exception {
		Map<String,Map<String,String>> Typearticle=family.ArticleType();
		request.put("Typearticle", Typearticle);
		System.out.println("到我了");
		return "success";
	}
	public String read() throws Exception {
		//System.out.println(urlkey+"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		ArticleBean article=family.getContent(urlkey);
		request.put("article", article);
		return "read";
	}
	
	
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}

	/**
	 * @return the urlkey
	 */
	public String getUrlkey() {
		return urlkey;
	}

	/**
	 * @param urlkey the urlkey to set
	 */
	public void setUrlkey(String urlkey) {
		this.urlkey = urlkey;
	}
	
}
