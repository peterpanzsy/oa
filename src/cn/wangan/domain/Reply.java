package cn.wangan.domain;

import java.util.Set;

public class Reply extends Article {
	private Set<Reply> children;
	private Reply parent;

	public Set<Reply> getChildren() {
		return children;
	}
	public void setChildren(Set<Reply> children) {
		this.children = children;
	}
	public Reply getParent() {
		return parent;
	}
	public void setParent(Reply parent) {
		this.parent = parent;
	}

	
}
