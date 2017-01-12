package com.article.web;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class ArticleFamily {
	private static Map<String,String> urls=new HashMap<String,String>();
//	private static Map<String,List<ArticleBean>> urllist=new HashMap<String,List<ArticleBean>>();
	private static ArticleFamily al=new ArticleFamily();
	static{
		urls.put("suibi", "http://www.sanwen.net/suibi/");//随笔
		urls.put("shige", "http://www.sanwen.net/shige/");//诗歌
		urls.put("zawen", "http://www.sanwen.net/zawen/");//杂文
		urls.put("novel", "http://www.sanwen.net/novel/");//小小说
//		urls.put("rizhi", "http://www.sanwen.net/rizhi/");//日记
		urls.put("sanwen", "http://www.sanwen.net/sanwen/");//散文
	}
	
	//得到文章类型以及类型包含的10篇文章及其的相关标题
	public Map<String,Map<String,String>> ArticleType() throws Exception {
		//以下得到文章列表链接
		Map<String,Map<String,String>> maparticle=new HashMap<String,Map<String,String>>();
		Set<String> set = urls.keySet();
		Iterator<String> it = set.iterator();
		while (it.hasNext()) {
			String Typekey = it.next();
			String Typevalue = urls.get(Typekey);
			//System.out.println(key+"="+value);
			Map<String, String> list=al.getContentList(Typevalue);
			maparticle.put(Typekey, list);
		}
		return maparticle;
	}
	
	
	//测试
	public static void main(String[] args) throws Exception {
		Map<String,Map<String,String>> m=al.ArticleType();
		System.out.println(m.toString());
	}
	
	//得到文章相关内容
	public ArticleBean getContent(String url){//得到文章相关内容
		ArticleBean bean=new ArticleBean();
		//String url="http://www.sanwen.net/subject/3851037/";
		Document document;
		try {
			document = Jsoup.connect(url).get();
			//System.out.println(document.html());
			Elements divs = document.select("div.article");
			String content=divs.outerHtml();
			bean.setArticleUrl(url);
			bean.setContent(content);
		}
		catch (IOException e) {
			System.out.println("文章内容网络异常！！！-----------------------");
			e.printStackTrace();
			bean.setFlag("flag");
			return bean;
			// TODO Auto-generated catch block
		}
		return bean;
	}
	
	
	//得到10篇文章的url
	public Map<String,String> getContentList(String prose_url){//得到10篇文章的list
		Map<String,String> articleMap=new HashMap<String,String>();
		Document document;
		try {
			document = Jsoup.parse(new URL(prose_url),3000);
			Elements categorylist=document.getElementsByTag("ul");
			//System.out.println(categorylist.html());
			Elements links=categorylist.select("a[href]");
			System.out.println("Linksize="+links.size());//输出链接的数量
			int i=0;
			for (Element slink : links) {
				//System.out.println(slink.attr("abs:href")+slink.text());
				articleMap.put(slink.attr("abs:href"), slink.text());
				//String url1=slink.attr("abs:href");
				//System.out.println(url1);
				//ArticleBean bean=getContent(url1);
				//list.add(bean);
				i++;
				if(i>=10){
					break;
				}
	        }
		}
		catch (MalformedURLException e) {
			articleMap.put("flag", "0");
			System.out.println("链接路径出错");
			// TODO Auto-generated catch block
			e.printStackTrace();
			return articleMap;
		}
		catch (IOException e) {
			articleMap.put("flag", "0");
			System.out.println("list文章列表链接超时");
			// TODO Auto-generated catch block
			e.printStackTrace();
			return articleMap;
		}
		return articleMap;
	}
}
