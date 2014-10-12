package cn.wangan.domain;

import java.io.Serializable;
import java.util.Date;
/**
 * 显示为项目日志，简短的说明一下最近的工作即可
 * @author wpr
 *
 */
public class Trend implements Serializable{
	private Long id;
	private String content;
	private Date time;
	private Program program;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Program getProgram() {
		return program;
	}
	public void setProgram(Program program) {
		this.program = program;
	}
	
}
