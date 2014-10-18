package cn.wangan.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.InfoDao;
import cn.wangan.domain.Information;
import cn.wangan.domain.PageBean;
import cn.wangan.domain.UploadFiles;
import cn.wangan.service.InformationService;
import cn.wangan.service.UploadFilesService;

@Service("infoService")
@Transactional
public class InformationServiceImpl implements InformationService {
	@Resource
	private UploadFilesService fileService;
	
	@Resource
	private InfoDao infoDao;
	
	private File[] attachment; // 实际上传文件
	private String[] attachmentContentType; // 文件的内容类型
	private String[] attachmentFileName; // 上传文件名
	private List<UploadFiles> attachmentFiles = new ArrayList<UploadFiles>();
	
	public List<Information> findTopInfo() {
		return infoDao.findTopInfo();
	}

	public Information findById(Long id) {
			return infoDao.getById(id);
	}

	public void save(Information info) {
		infoDao.save(info);
	}

	public void save(Information info, File[] attachment,
			String[] attachmentContentType, String[] attachmentFileName) {
		this.attachment = attachment;
		this.attachmentContentType =attachmentContentType;
		this.attachmentFileName =attachmentFileName;
		
		if(attachment!=null && attachment.length > 0){
			saveAttachment();
		}
		info.setAttachments(new HashSet<UploadFiles>(attachmentFiles));
		infoDao.save(info);
		attachmentFiles.clear();

	}
	
	/**
	 * 保存文件到指定的文件夹中，同时把文件信息保存到数据库中
	 */
	private void saveAttachment() {
		String targetDirectory = ServletActionContext.getServletContext().getRealPath("/"+"files/");//获得路径  
		  for(int i = 0 ; i < attachment.length ; i++){  
	             String fileName = attachmentFileName[i]; //上传的文件名  
	             String type = attachmentContentType[i]; //文件类型  
	             String realName = UUID.randomUUID().toString() +   
	                              getExt(fileName); //保存的文件名称、使用UUID+后缀进行保存  
	             File target = new File(targetDirectory,realName);  
	             try {  
	                 FileUtils.copyFile(attachment[i],target);//上传至服务器的目录  
	             } catch (IOException e) {  
	            	 throw new RuntimeException();
	             }   
	             //把路径()写入数据库 
	             UploadFiles uf = new UploadFiles(); //创建文件  
	             uf.setUploadContentType(type);  
	             uf.setUploadFileName(fileName);  
	             uf.setUploadRealName(realName); 
	             fileService.save(uf);
	             attachmentFiles.add(uf);
	         }  
	}
	
	public static String getExt(String fileName){  
        return fileName.substring(fileName.lastIndexOf("."));  
    }

	public List<Information> findAll() {
		return infoDao.findAll();
	}

	public void delete(Long id) {
		infoDao.delete(id);
	}

	public void update(Information info) {
		infoDao.update(info);
	}

	public PageBean getPageBean(int pageNum) {
		//每页显示的数据
			int pageSize = 12;
			//查询总记录数
			Long count = infoDao.getTotalCount();
			
			//得到当前页面的数据
			List list = infoDao.getCurrentPageList(pageNum,pageSize);
			return new PageBean(pageNum,pageSize,count.intValue(),list);
			}
}
