package com.soft.web.teacher;
//认证
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.soft.dao.TeacherDB;
public class AuthenticAction extends ActionSupport implements ServletRequestAware{
	private HttpServletRequest quest;
	private HttpSession session=ServletActionContext.getRequest().getSession();
	private TeacherDB tb=new TeacherDB();
	public String displayimg(){
		String tell=(String)session.getAttribute("tell");
		if(tell!=null){
			List<String> list=tb.selectImg(tell);
			if(list!=null){
				ActionContext.getContext().getSession().put("path",list);
			}
		}
		return "success";
	}
	
	
	private File headimg;
	private String headimgFileName;
	
	public File getHeadimg() {
		return headimg;
	}

	public void setHeadimg(File headimg) {
		this.headimg = headimg;
	}

	public String getHeadimgFileName() {
		return headimgFileName;
	}

	public void setHeadimgFileName(String headimgFileName) {
		this.headimgFileName = headimgFileName;
	}
	
	
//头像上传验证
public String head() throws IOException{
	//String path="d:/images";
	if(headimg!=null){
		String tell=(String)session.getAttribute("tell");
		if(tell!=null){
			List<String> list=tb.selectImg(tell);
			if(list!=null){
				ActionContext.getContext().getSession().put("path",list);
			}
		String path=ServletActionContext.getServletContext().getRealPath("/image");
		
		System.out.println("头像上传成功"+path);
		
		if(headimgFileName.substring(headimgFileName.length()-3, headimgFileName.length()).equals("jpg")){
			headimgFileName=tell+"h.jpg";//改名
		}
		if(headimgFileName.substring(headimgFileName.length()-3, headimgFileName.length()).equals("png")){
			headimgFileName=tell+"h.png";//改名
		}
		File destFile=new File(path, headimgFileName);
		FileUtils.copyFile(headimg, destFile);
		
		String insertpath="http://www.yjfamily.xyz/FamilyEdu/image/"+headimgFileName;
		list.set(0, insertpath);
		boolean tt=tb.Updateimg(insertpath, tell);
		if(tt){
			ActionContext.getContext().getSession().put("path",list);
		}
		return "success";
		}
	}
	return "error";
}
	
	private File pidimg;
	private String pidimgFileName;

	public File getPidimg() {
		return pidimg;
	}

	public void setPidimg(File pidimg) {
		this.pidimg = pidimg;
	}

	public String getPidimgFileName() {
		return pidimgFileName;
	}

	public void setPidimgFileName(String pidimgFileName) {
		this.pidimgFileName = pidimgFileName;
	}
	
	public String pid() throws IOException{
		
		if(pidimg!=null){
			String tell=(String)session.getAttribute("tell");
			if(tell!=null){
				List<String> list=tb.selectImg(tell);
				if(list!=null){
					ActionContext.getContext().getSession().put("path",list);
				}
			String path=ServletActionContext.getServletContext().getRealPath("/imageP");
			System.out.println("身份验证上传成功"+path);
			
			if(pidimgFileName.substring(pidimgFileName.length()-3, pidimgFileName.length()).equals("jpg")){
				pidimgFileName=tell+"p.jpg";//改名
			}
			if(pidimgFileName.substring(pidimgFileName.length()-3, pidimgFileName.length()).equals("png")){
				pidimgFileName=tell+"p.png";//改名
			}
			File destFile=new File(path, pidimgFileName);
			FileUtils.copyFile(pidimg, destFile);
			
			String insertpath="http://www.yjfamily.xyz/FamilyEdu/imageP/"+pidimgFileName;
			list.set(1, insertpath);
			boolean tt=tb.UpdatePidimg(insertpath, tell);
			if(tt){
				ActionContext.getContext().getSession().put("path",list);
			}
			return "success";
		}
		}
		return "error";
	}
	
	private File eduimg;
	private String eduimgFileName;

	public File getEduimg() {
		return eduimg;
	}

	public void setEduimg(File eduimg) {
		this.eduimg = eduimg;
	}

	public String getEduimgFileName() {
		return eduimgFileName;
	}

	public void setEduimgFileName(String eduimgFileName) {
		this.eduimgFileName = eduimgFileName;
	}
	public String education() throws IOException{
		//String path="d:/images";
		if(eduimg!=null){
			String tell=(String)session.getAttribute("tell");
			if(tell!=null){
				List<String> list=tb.selectImg(tell);
				if(list!=null){
					ActionContext.getContext().getSession().put("path",list);
				}
			String path=ServletActionContext.getServletContext().getRealPath("/imageE");
			System.out.println("学历上传成功"+path);
			if(eduimgFileName.substring(eduimgFileName.length()-3, eduimgFileName.length()).equals("jpg")){
				eduimgFileName=tell+"e.jpg";//改名
			}
			if(eduimgFileName.substring(eduimgFileName.length()-3, eduimgFileName.length()).equals("png")){
				eduimgFileName=tell+"e.png";//改名
			}
			
			File destFile=new File(path, eduimgFileName);
			FileUtils.copyFile(eduimg, destFile);
			String insertpath="http://www.yjfamily.xyz/FamilyEdu/imageE/"+eduimgFileName;
			list.set(2, insertpath);
			boolean tt=tb.UpdatEdueimg(insertpath, tell);
			if(tt){
				ActionContext.getContext().getSession().put("path",list);
			}
			return "success";
		}
	}
		return "error";
}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.quest=arg0;
	}
	
}
