package com.article.web;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class ArticleFamily {
	private static Map<String,String> urls=new HashMap<String,String>();
	static{
		urls.put("sanwen", "http://www.sanwen.net/sanwen/");//散文
		urls.put("shige", "http://www.sanwen.net/shige/");//诗歌
		urls.put("zawen", "http://www.sanwen.net/zawen/");//杂文
		urls.put("novel", "www.sanwen.net/novel/");//小小说
		//urls.put("rizhi", "www.sanwen.net/rizhi/");//日记
		urls.put("suibi", "www.sanwen.net/suibi/");//随笔
	}
	public static void main(String[] args) throws MalformedURLException, IOException {
		//以下得到文章列表链接
		ArticleFamily al=new ArticleFamily();
		ArrayList list=al.getContentList(urls.get("sanwen"));
		for(int i=0;i<list.size();i++){
			ArticleBean bean=(ArticleBean)list.get(i);
			System.out.println(bean.getTitle()+"------"+bean.getAuthor()+"========="+bean.getContent());
		}
		System.out.println(list.toString());
	}
	public ArticleBean getContent(String url){//得到文章相关内容
		ArticleBean bean=new ArticleBean();
		//String url="http://www.sanwen.net/subject/3851037/";
		Document document;
		try {
			document = Jsoup.connect(url).get();
			Elements divs = document.select("div.article");
			Elements con=document.getElementsByTag("h1");
			Elements author=document.getElementsByClass("info");
			String content=divs.outerHtml();
			String title=con.text();
			String au=author.text();
			bean.setArticleUrl(url);
			bean.setAuthor(au);
			bean.setTitle(title);
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
	
	public ArrayList getContentList(String prose_url){//得到10篇文章的list
		ArrayList list=new ArrayList<>();
		Document document;
		try {
			document = Jsoup.parse(new URL(prose_url),3000);
			Elements categorylist=document.getElementsByTag("ul");
			//System.out.println(categorylist.html());
			Elements links=categorylist.select("a[href]");
			System.out.println("Linksize="+links.size());//输出链接的数量
			int i=0;
			for (Element slink : links) {
				System.out.println(slink.attr("abs:href")+slink.text());
				String url1=slink.attr("abs:href");
				//System.out.println(url1);
				ArticleBean bean=getContent(url1);
				list.add(bean);
				i++;
				if(i>=10){
					break;
				}
	        }
		}
		catch (MalformedURLException e) {
			System.out.println("链接路径出错");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (IOException e) {
			System.out.println("list文章列表链接超时");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
