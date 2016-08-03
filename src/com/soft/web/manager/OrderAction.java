package com.soft.web.manager;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.OrderDB;

public class OrderAction extends ActionSupport implements RequestAware{
	private OrderDB ob=new OrderDB();
	private String id;
	private String pageNow;
	private String flag;
	private String s_tell;
	private String t_tell;
	private Map<String, Object> request;
	public String execute(){
		int page=Integer.parseInt(pageNow);
		int pageCount=ob.getPageCount();
		ArrayList listall=ob.getOrderPage(page);
		request.put("list", listall);
		request.put("pageNow",pageNow);
		request.put("pageCount", pageCount);
		return SUCCESS;
	}
	public String UpdateOrder(){
		if(ob.UpdateOrder(flag, id, t_tell, s_tell)){
			int page=Integer.parseInt(pageNow);
			int pageCount=ob.getPageCount();
			ArrayList listall=ob.getOrderPage(page);
			request.put("list", listall);
			request.put("pageNow",pageNow);
			request.put("pageCount", pageCount);
		}
		return SUCCESS;
	}
	public String dellOrder(){
		if(ob.dellOrder(id)){
			int page=Integer.parseInt(pageNow);
			int pageCount=ob.getPageCount();
			ArrayList listall=ob.getOrderPage(page);
			request.put("list", listall);
			request.put("pageNow",pageNow);
			request.put("pageCount", pageCount+"");
		}
		return SUCCESS;
	}
	
	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		this.request=arg0;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getS_tell() {
		return s_tell;
	}
	public void setS_tell(String s_tell) {
		this.s_tell = s_tell;
	}
	public String getT_tell() {
		return t_tell;
	}
	public void setT_tell(String t_tell) {
		this.t_tell = t_tell;
	}
	
}
