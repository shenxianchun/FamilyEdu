package com.soft.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.RgsDB;

import net.sf.json.JSONArray;

public class GradeAction extends ActionSupport{
	private String Graderesult;
	
	public String getGraderesult() {
		return Graderesult;
	}
	public void setGraderesult(String graderesult) {
		Graderesult = graderesult;
	}
	 public String excute(){
			try{
			 RgsDB db=new RgsDB();
			 
			 //将数据存储在map里，再转换成json类型数据，也可以自己手动构造json类型数据
			 ArrayList al=db.getGrade();
			
			 JSONArray json = JSONArray.fromObject(al);//将对象转换成json类型数

			 Graderesult = json.toString();//给result赋值，传递给页面
			 //System.out.println(Graderesult);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
			 return SUCCESS;
		 }
}
