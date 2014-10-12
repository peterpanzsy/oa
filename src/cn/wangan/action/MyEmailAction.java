package cn.wangan.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.MyEmail;
import cn.wangan.domain.UploadFiles;
import cn.wangan.domain.User;
import cn.wangan.service.MyEmailService;
import cn.wangan.service.UploadFilesService;
import cn.wangan.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class MyEmailAction extends ActionSupport  {
	@Resource
	private MyEmailService myEmailService;
	@Resource
	private UploadFilesService fileService;
	@Resource
	private UserService userService;
	
	private MyEmail model = new MyEmail();
	//得到内容
	private String content;
	//得到主题
	private String subject;
	//得到toAddress
	private String toAddress;
	private static final long serialVersionUID = 1L;
	
	private File[] upload; // 实际上传文件
	private String[] uploadContentType; // 文件的内容类型
	private String[] uploadFileName; // 上传文件名
	private List<UploadFiles> uploadFiles = new ArrayList<UploadFiles>();

	private static Logger logger = Logger.getLogger(MyEmailAction.class);  

	public String send() throws UnsupportedEncodingException {
		//设置内容格式
		User user =(User)ActionContext.getContext().getSession().get("user");
		content = content +"\r\n 该邮件来自"+user.getName()+"\r\n  该用户的邮箱地址是:"+user.getEmail();
		
		model.setContent(content);
		model.setSubject(subject);
		model.setToAddress(toAddress);
		
		if(upload!=null){
			saveFile();
		}
		Map<String, String> error = myEmailService.send(model,uploadFileName);
		if (error.isEmpty()) {
			// 如果error为空，表示发送成功
			return SUCCESS;
		} else {
			// 如果error不为空，表示发送失败，返回错误信息
			addFieldError("error", error.get("errormsg"));
			return "index";
		}

	}

	// 把附件添加到指定的文件夹中
	public void saveFile() {
		String targetDirectory = ServletActionContext.getServletContext()
				.getRealPath("/" + "files/");// 获得路径
		StringBuffer filename = new StringBuffer();
		if(upload!=null){
			for (int i = 0; i < upload.length; i++) {
				String fileName = uploadFileName[i]; // 上传的文件名
				String type = uploadContentType[i]; // 文件类型
				String realName = UUID.randomUUID().toString() + getExt(fileName); // 保存的文件名称、使用UUID+后缀进行保存
				File target = new File(targetDirectory, realName);
				try {
					FileUtils.copyFile(upload[i], target);// 上传至服务器的目录
				} catch (IOException e) {
					addFieldError("error", "文件上传失败，请重试");
				}
				if(i != (upload.length-1)){
					filename.append(targetDirectory+"\\"+realName+",");
				}else{
					filename.append(targetDirectory+"\\"+realName);
				}
				
	           //把路径()写入数据库 
	           UploadFiles uf = new UploadFiles(); //创建文件  
	           uf.setUploadContentType(type);  
	           uf.setUploadFileName(fileName);  
	           uf.setUploadRealName(realName); 
	           fileService.save(uf);
	           uploadFiles.add(uf);  //添加到需要下载文件的List集合中  
			}
		}
		model.setFilename(filename.toString());
	}

	public String index() {
		//准备所有的信息
		List<User> userList = userService.findAll();
		ActionContext.getContext().put("userList",userList);
		return "index";
	}

	public File[] getUpload() {
		return upload;
	}

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public String[] getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String[] getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<UploadFiles> getUploadFiles() {
		return uploadFiles;
	}

	public void setUploadFiles(List<UploadFiles> uploadFiles) {
		this.uploadFiles = uploadFiles;
	}

	public static String getExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getToAddress() {
		return toAddress;
	}

	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}

}
