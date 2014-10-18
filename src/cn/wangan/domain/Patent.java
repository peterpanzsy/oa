package cn.wangan.domain;

import java.util.Set;

public class Patent {
	private Long id;
	//发明人
	private Set<User> inventors;
	//*(临时)用户名称
		private String username;
	
	//专利名称
	private String name;
	//授权公告号 
	private String authorizationNumber;
	//备注
	private String description;
	//类型，按照专利来分四类（发明公布 ，发明授权，使用新型，外观设计）
	private String type;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Set<User> getInventors() {
		return inventors;
	}
	public void setInventors(Set<User> inventors) {
		this.inventors = inventors;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthorizationNumber() {
		return authorizationNumber;
	}
	public void setAuthorizationNumber(String authorizationNumber) {
		this.authorizationNumber = authorizationNumber;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
}
