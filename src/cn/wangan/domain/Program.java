package cn.wangan.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * 与项目有关的javabean
 * @author z
 *
 */
public class Program implements Serializable{
	//唯一标示
	private Long id;
	//项目名称
	private String name;
	//项目简介
	private String description;
	//项目开始时间
	private Date startTime;
	/**项目进度,只有几个选项立项项目      10%
		准备	15%
		开发（or进行）	
			开发前期 	35%
			中期		60%
			后期		80%
		后期测试		90%
		结题			100%
	*/
	private String proceeding;
	//项目是否结束1-结束；0-正在进行时
	private int end;
	//项目结束时间,点击结题时由系统自动生成
	private Date endTime;
	//项目结题报告
	private UploadFiles report;
	//组长，每个项目组只能有以为
	private User leader;
	//组员
	private Set<User> users;
	//*（临时）参与人员姓名
	private String users_names;
	//简单的动态信息
	private Set<Trend> trends;
	//最新的动态
	private Trend currentTrend;
	
	public Trend getCurrentTrend() {
		return currentTrend;
	}
	public void setCurrentTrend(Trend currentTrend) {
		this.currentTrend = currentTrend;
	}
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public String getProceeding() {
		return proceeding;
	}
	public void setProceeding(String proceeding) {
		this.proceeding = proceeding;
	}
	
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public UploadFiles getReport() {
		return report;
	}
	public void setReport(UploadFiles report) {
		this.report = report;
	}
	public User getLeader() {
		return leader;
	}
	public void setLeader(User leader) {
		this.leader = leader;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public Set<Trend> getTrends() {
		return trends;
	}
	public void setTrends(Set<Trend> trends) {
		this.trends = trends;
	}
	public String getUsers_names() {
		return users_names;
	}
	public void setUsers_names(String users_names) {
		this.users_names = users_names;
	}
	
	
	
	
	
	
}
