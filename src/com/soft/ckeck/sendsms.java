package com.soft.ckeck;

import java.io.IOException;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

import org.dom4j.Document;   
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;   


public class sendsms {
	
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	
	public void sendTell(String tell,int mobile_code) {
		
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url);
			
		//client.getParams().setContentCharset("GBK");		
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");
		
		System.out.println("手机短信验证码是："+mobile_code);//手机验证码内容
		
	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");

		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "cf_DLmzxx"),//注册平台账号http://sms.ihuyi.com/recharge.html
			    new NameValuePair("password", "323556"), //网站原密码是：323556sxc 密码可以使用明文密码或使用32位MD5加密
			    // new NameValuePair("password", StringUtil.MD5Encode("323556sxc")),//密码MD5加密方式发送
			    new NameValuePair("mobile", tell),//需要验证的手机号
			    new NameValuePair("content", content),//向验证手机发送的内容
		};
		
		method.setRequestBody(data);
		
		
		try {
			client.executeMethod(method);	
			
			String SubmitResult =method.getResponseBodyAsString();
					
			System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();


			String code = root.elementText("code");//返回值为2时，表示提交成功
			String msg = root.elementText("msg");//提交结果描述code是2时msg为提交成功，是0是为提交失败
			String smsid = root.elementText("smsid");//
			
			
			System.out.println(code);
			System.out.println(msg);//
			System.out.println(smsid);
						
			 if("2".equals(code)){
				System.out.println("短信提交成功");
			}
			
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
	}
	public static void main(String[] args) {
		sendsms s=new sendsms();
		s.sendTell("18842647134", 123456);
	}
	
}