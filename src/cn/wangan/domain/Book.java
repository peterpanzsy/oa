package cn.wangan.domain;

import java.io.Serializable;

/**
 * Book类
 * @author z
 *
 */
public class Book implements Serializable{
	
	private Long id;//书的唯一编号
	private String name; //书名
	private String publish;	//出版社
	private String bookcase; //书柜
	private String author;	//作者
	private String time;	//出版时间
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPublish() {
		return publish;
	}
	public void setPublish(String publish) {
		this.publish = publish;
	}
	public String getBookcase() {
		return bookcase;
	}
	public void setBookcase(String bookcase) {
		this.bookcase = bookcase;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
