package cn.wangan.domain;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Vector;

import javax.mail.internet.MimeUtility;

public class MyEmail {

	private String mailServerHost; // 发送邮件的服务器
	private String mailServerPort = "25"; // 发送邮件的服务器的端口
	private String fromAddress; // 发送者地址
	private String toAddress; // 接收者地址
	private String username; // 发送者用户名
	private String password; // 发送者密码
	private boolean validate = true; // 是否需要身份验证
	private String subject; // 邮件主题
	private String content; // 邮件内容
	private Map<String, String> mailType; // 邮箱类型
	private String filename ;// 附件文件名
	//private Vector file = new Vector();// 附件文件集合

	/**
	 * 得到邮件会话属性
	 * 
	 */
	public Properties getProperties() {
		Properties p = new Properties();
		p.put("mail.smtp.host", this.mailServerHost);
		p.put("mail.smtp.port", this.mailServerPort);
		p.put("mail.smtp.auth", validate ? "true" : "false");
		return p;
	}

	public String getMailServerHost() {
		return mailServerHost;
	}

	public void setMailServerHost(String mailServerHost) {
		this.mailServerHost = mailServerHost;
	}

	public String getMailServerPort() {
		return mailServerPort;
	}

	public void setMailServerPort(String mailServerPort) {
		this.mailServerPort = mailServerPort;
	}

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public String getToAddress() {
		return toAddress;
	}

	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
//		this.username = username;
//		this.fromAddress = username;
//		if (username != null && username.length() > 0) {
//			String fromEmailExt = username.substring(
//					username.lastIndexOf("@") + 1, username.lastIndexOf("."));
//			this.mailServerHost = getMailType().get(fromEmailExt);
//		}
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isValidate() {
		return validate;
	}

	public void setValidate(boolean validate) {
		this.validate = validate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Map<String, String> getMailType() {
		mailType = new HashMap<String, String>();
		mailType.put("163", "smtp.163.com");
		mailType.put("139", "smtp.139.com");
		mailType.put("126", "smtp.126.com");
		mailType.put("qq", "smtp.qq.com");
		mailType.put("sohu", "smtp.sohu.com");
		mailType.put("live", "smtp.live.cn");
		mailType.put("msn", "smtp.msn.com");
		mailType.put("kum", "mail.kum.net.cn");
		mailType.put("hotmail", "smtp.hotmail.cn");
		return mailType;
	}

	public void setMailType(Map<String, String> mailType) {
		this.mailType = mailType;
	}

//	public void attachfile(String fname) {
//		file.addElement(fname);
//	}
//
//	public Vector getFile() {  
//		return file;  
//    }	
//	public void setFile(Vector file) {  
//	    this.file = file;  
//    }
	/**
	 * 
	 * 方法说明：把主题转换为中文 输入参数：String strText 返回类型：
	 */
	public String transferChinese(String strText) {
		try {
			strText = MimeUtility.encodeText(new String(strText.getBytes(),
					"UTF-8"), "UTF-8", "B");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return strText;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}


}
