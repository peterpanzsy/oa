package cn.wangan.domain;

import java.io.Serializable;
import java.util.Set;

/**
 * 权限管理，暂时没有涉及
 * @author wpr
 *
 */
public class Privilege implements Serializable{
	private Long id;		//权限的唯一标识
	private String name;	//权限的命名
	private String url;  //该权限所对应的连接（核心）
	/**表征与角色（岗位）之间多对多的关系*/
	private Set<Role> roles; 
	/**父节点*/
	private Privilege parent;
	/**孩子节点*/
	private Set<Privilege> children;
	
	
	
	public Privilege() {
		super();
	}
	
	public Privilege(String name, String url, Privilege parent) {
		this.name = name;
		this.url = url;
		this.parent = parent;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Privilege getParent() {
		return parent;
	}
	public void setParent(Privilege parent) {
		this.parent = parent;
	}
	public Set<Privilege> getChildren() {
		return children;
	}
	public void setChildren(Set<Privilege> children) {
		this.children = children;
	}
}
