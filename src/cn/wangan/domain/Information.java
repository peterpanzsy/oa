package cn.wangan.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Information extends Article implements Serializable{
	//与所有的附件相关
	private Set<UploadFiles> attachments = new HashSet<UploadFiles>();

	public Set<UploadFiles> getAttachments() {
		return attachments;
	}

	public void setAttachments(Set<UploadFiles> attachments) {
		this.attachments = attachments;
	}
	
	
}
