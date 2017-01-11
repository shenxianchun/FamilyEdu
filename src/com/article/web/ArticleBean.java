package com.article.web;

public class ArticleBean {
	private String author;
	private String articleUrl;
	private String title;
	private String content;
	private String flag;
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getArticleUrl() {
		return articleUrl;
	}
	public void setArticleUrl(String articleUrl) {
		this.articleUrl = articleUrl;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the flag
	 */
	public String getFlag() {
		return flag;
	}
	/**
	 * @param flag the flag to set
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
}
