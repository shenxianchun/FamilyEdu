package com.soft.web.teacher;

import java.util.ArrayList;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.TeacherDB;

public class SearchTeacherAction extends ActionSupport{
	private String s_where;
	private String grade;
	private String subject;
	public String execute(){
		if(s_where==null){
			if(grade!=null&&subject!=null){
				s_where=" and subject like'%"+(grade+subject)+"%'";
			}else{
				s_where="";
			}
			
		}
		System.out.println("查询条件是："+s_where);
		TeacherDB teacher=new TeacherDB();
		ArrayList searchlist=teacher.SearchTeacher(s_where);
		System.out.println("结果："+searchlist.toString());
		ActionContext.getContext().getSession().put("list", searchlist);
		return "success";
	}
	
	public String getS_where() {
		return s_where;
	}
	public void setS_where(String s_where) {
		this.s_where = s_where;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

}
