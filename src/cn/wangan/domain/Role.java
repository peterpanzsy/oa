package cn.wangan.domain;

import java.util.Set;


/**
 * 角色类，相当于各个岗位
 * @author wpr
 *
 */
public class Role {
	private Long id; //唯一标示，自动生成
	private String name; //角色（岗位）名称
	private String description; //角色描述
	
	private Set<User> users; //与用户之间的多对多关系
	private Set<Privilege> privileges; //与权限之间的多对多的关系
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
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public Set<Privilege> getPrivileges() {
		return privileges;
	}
	public void setPrivileges(Set<Privilege> privileges) {
		this.privileges = privileges;
	}
	
	
}
