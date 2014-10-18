package cn.wangan.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.wangan.domain.Information;
import cn.wangan.domain.PageBean;
import cn.wangan.domain.UploadFiles;
import cn.wangan.domain.User;
import cn.wangan.service.InformationService;
import cn.wangan.service.UploadFilesService;
import cn.wangan.utils.Logger2File;

@Controller
@Scope("prototype")
public class InformationAction extends ActionSupport implements
		ModelDriven<Information> {

	private static final long serialVersionUID = 1L;  
	
	@Resource
	private InformationService infoService;
	@Resource
	private UploadFilesService fileService;
	/*与分页有关的数据信息*/
	private int pageNum = 1 ;
	
	//用来接受附件信息
	private File[] attachment; // 实际上传文件
	private String[] attachmentContentType; // 文件的内容类型
	private String[] attachmentFileName; // 上传文件名
	private static Logger logger = Logger.getLogger(InformationAction.class);  
	/**
	 * 展示其中的一条具体的通知
	 * 
	 * @return
	 */
	public String show() {
		try {
			Information detailInfo = infoService.findById(model.getId());
			List<UploadFiles> attachments = fileService.findAttachment(detailInfo.getId());
			if(attachments!=null){
				detailInfo.setAttachments(new HashSet<UploadFiles>(attachments));
			}
			ActionContext.getContext().put("detailInfo", detailInfo);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "showOne";
	}

	/** 列表 */
	public String list() throws Exception {
		try {
			/*List<Information> infoList = infoService.findAll();
			ActionContext.getContext().put("infoList", infoList);*/
			PageBean pageBean = infoService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "list";
	}

	/** 删除 */
	public String delete() throws Exception {
		try {
			infoService.delete(model.getId());
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	/** 添加页面 */
	public String addUI() throws Exception {
		return "addUI";
	}

	/** 添加 */
	public String add() throws Exception {
		try {
			Information info = new Information();
			info.setTitle(model.getTitle());
			info.setContent(model.getContent());
			info.setDate(new Date());
			User user = (User) ActionContext.getContext().getSession().get("user");
			info.setAuthor(user);
			infoService.save(info,attachment,attachmentContentType,attachmentFileName);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	/** 修改页面 */
	public String editUI() throws Exception {
		try {
			Information info = infoService.findById(model.getId());
			ActionContext.getContext().put("info", info);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "editUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		try {
			Information info = infoService.findById(model.getId());
			info.setTitle(model.getTitle());
			info.setContent(model.getContent());
			info.setDate(new Date());
			User user = (User) ActionContext.getContext().getSession().get("user");
			info.setAuthor(user);
			
			infoService.update(info);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	
	/** 首页的查看更多按钮 */
	public String showmore() throws Exception {
		try {
			PageBean pageBean = infoService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "showmore";
	}
	
	private Information model = new Information();

	public Information getModel() {
		return model;
	}
    
	public File[] getAttachment() {
		return attachment;
	}

	public void setAttachment(File[] attachment) {
		this.attachment = attachment;
	}

	public String[] getAttachmentContentType() {
		return attachmentContentType;
	}

	public void setAttachmentContentType(String[] attachmentContentType) {
		this.attachmentContentType = attachmentContentType;
	}

	public String[] getAttachmentFileName() {
		return attachmentFileName;
	}

	public void setAttachmentFileName(String[] attachmentFileName) {
		this.attachmentFileName = attachmentFileName;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
}
