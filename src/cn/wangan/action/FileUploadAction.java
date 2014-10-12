package cn.wangan.action;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;


import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import cn.wangan.domain.UploadFiles;
import cn.wangan.service.UploadFilesService;

import com.opensymphony.xwork2.ActionSupport;
@Controller
@Scope("prototype")
public class FileUploadAction extends ActionSupport implements Serializable{
   @Resource
	private UploadFilesService fileService;
	
	private static final long serialVersionUID = 1L;  
    private File[] upload; //实际上传文件  
    private String[] uploadContentType; //文件的内容类型  
    private String[] uploadFileName; //上传文件名  
    private List<UploadFiles> uploadFiles = new ArrayList<UploadFiles>();  
   
    public String upload() throws Exception {
    	String targetDirectory = ServletActionContext.getServletContext().getRealPath("/"+"files/");//获得路径  
         for(int i = 0 ; i < upload.length ; i++){  
             String fileName = uploadFileName[i]; //上传的文件名  
             String type = uploadContentType[i]; //文件类型  
             String realName = UUID.randomUUID().toString() +   
                              getExt(fileName); //保存的文件名称、使用UUID+后缀进行保存  
             File target = new File(targetDirectory,realName);  
             try {  
                 FileUtils.copyFile(upload[i],target);//上传至服务器的目录  
             } catch (IOException e) {  
            	 addFieldError("error","文件上传失败，请重试");
            	 return "uploadUI";  
             }   

             //把路径()写入数据库 
             UploadFiles uf = new UploadFiles(); //创建文件  
             uf.setUploadContentType(type);  
             uf.setUploadFileName(fileName);  
             uf.setUploadRealName(realName); 
             fileService.save(uf);
             uploadFiles.add(uf);  //添加到需要下载文件的List集合中  
         }  
         ServletActionContext.getRequest().setAttribute("uploadFiles", uploadFiles);  
         return SUCCESS;  
	}
	//跳转到上传文件页面
	public String uploadUI(){
		return "uploadUI";
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
  
    public static long getSerialversionuid() {  
        return serialVersionUID;  
    }  
  
    public static String getExt(String fileName){  
        return fileName.substring(fileName.lastIndexOf("."));  
    }  
}
