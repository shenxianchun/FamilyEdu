package com.sxc.web.ValidateAction;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;



import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ImageAction extends ActionSupport {
	private ByteArrayInputStream inputStream;
	
	public String execute() throws Exception{
		VCode vc=new VCode();
		BufferedImage img=vc.getImage();
		
		System.out.println(vc.getCode());//输出验证码
		// 将生成的随机数字字符串写入session
		 ActionContext.getContext().getSession().put("randomNumber",vc.getCode());
		 ByteArrayOutputStream output = new ByteArrayOutputStream();
		 
		 ImageOutputStream Out = ImageIO.createImageOutputStream(output);
		 
		 ImageIO.write(img, "JPEG", Out);
		 Out.close();
		 ByteArrayInputStream input = new ByteArrayInputStream(output.toByteArray());  
		 this.setInputStream(input);
		 //VCode.saveImage(img,response.getOutputStream());
		 return SUCCESS;
	}
	
	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}
	
}
