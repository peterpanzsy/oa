package cn.wangan.domain;

import java.util.Date;

/**
 * 代表普通的文章，作为通知，回复等的基类
 * @author z
 *
 */
public class Article {
	private Long id;
	private String title;
	private String content;
	private Date date;
	private User author;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public User getAuthor() {
		return author;
	}
	public void setAuthor(User author) {
		this.author = author;
	}
	
	
}
