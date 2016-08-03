package com.soft.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.RgsDB;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class RegionAction extends ActionSupport{
	private String Regionresult;
	
	public String getRegionresult() {
		return Regionresult;
	}
	public void setRegionresult(String regionresult) {
		Regionresult = regionresult;
	}
	 public String excute(){
			try{
			 RgsDB db=new RgsDB();
			 
			 //将数据存储在map里，再转换成json类型数据，也可以自己手动构造json类型数据
			 ArrayList al=db.getRegion();
			
			 JSONArray json = JSONArray.fromObject(al);//将对象转换成json类型数

			 Regionresult = json.toString();//给result赋值，传递给页面
			 System.out.println(Regionresult);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
			 return SUCCESS;
		 }
}
