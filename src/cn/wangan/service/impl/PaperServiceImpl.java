package cn.wangan.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.FileDao;
import cn.wangan.dao.PaperDao;
import cn.wangan.domain.PageBean;
import cn.wangan.domain.Paper;
import cn.wangan.domain.UploadFiles;
import cn.wangan.service.PaperService;
@Service("paperService")
@Transactional
public class PaperServiceImpl implements PaperService {
	@Resource
	private PaperDao paperDao;
	@Resource 
	private FileDao fileDao;
	
	//与论文有关的东西
	private File upload; // 实际上传文件
	private String uploadContentType; // 文件的内容类型
	private String uploadFileName; // 上传文件名
	
	public PageBean getPageBean(int pageNum) {
		//每页显示的数据
		int pageSize = 10;
		//查询总记录数
		Long count = paperDao.getTotalCount();
		//得到当前页面的数据
		List list = paperDao.getCurrentPageList(pageNum,pageSize);
		
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}

	
	public void save(Paper paper, File upload, String uploadContentType,
			String uploadFileName) {
		this.upload = upload;
		this.uploadContentType = uploadContentType;
		this.uploadFileName = uploadFileName;
		//上传的文件处理
		if(upload!=null){
			UploadFiles uf = saveFile();
			fileDao.save(uf);
			paper.setFile(uf);
		}
		paperDao.save(paper);
		
	}

	
	public  UploadFiles saveFile() {
		String targetDirectory = ServletActionContext.getServletContext()
				.getRealPath("/" + "files/");// 获得路径
		StringBuffer filename = new StringBuffer();

		String fileName = uploadFileName; // 上传的文件名
		String type = uploadContentType; // 文件类型
		String realName = UUID.randomUUID().toString() + getExt(fileName); // 保存的文件名称、使用UUID+后缀进行保存
		File target = new File(targetDirectory, realName);
		try {
			FileUtils.copyFile(upload, target);// 上传至服务器的目录
		} catch (IOException e) {
			throw new RuntimeException();
		}

		// 把路径()写入数据库
		UploadFiles uf = new UploadFiles(); // 创建文件
		uf.setUploadContentType(type);
		uf.setUploadFileName(fileName);
		uf.setUploadRealName(realName);
		return uf;
		}
	
	
	public static String getExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}


	public void delete(Long id) {
		paperDao.delete(id);
	}


	public PageBean searchContent(int pageNum, String searchContent) {
		//判断searchContent是否为null
		if(searchContent==null){
			//如果为null,返回null,跳转到提示页面
			return null;
		}else{
			//如果不为null,封装PageBean对象
			//每页显示的数据
			int pageSize = 12;
			//查询总记录数,查找name属性或者作者属性
			Long count = paperDao.getSearchTotalCount(searchContent);
			System.out.println(count);
			//得到当前页面的数据
			List list = paperDao.getSearchCurrentPageList(searchContent,pageNum,pageSize);
			System.out.println(list.size());
			if(list!=null&&list.size()>0){
				return new PageBean(pageNum,pageSize,count.intValue(),list);
			}else{
				return null;
			}
		}
	}


	public Paper findById(Long id) {
		return paperDao.getById(id);
	}


	public void update(Paper paper) {
		paperDao.update(paper);
	}
}
