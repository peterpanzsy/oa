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
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.wangan.domain.Economy;
import cn.wangan.domain.PageBean;
import cn.wangan.domain.UploadFiles;
import cn.wangan.domain.User;
import cn.wangan.service.EconomyService;
import cn.wangan.service.UploadFilesService;
import cn.wangan.utils.Logger2File;

@Controller
@Scope("prototype")
public class EconomyAction extends ActionSupport implements
		ModelDriven<Economy> {

	private Economy model = new Economy();
	@Resource
	private EconomyService ecoService;
	@Resource
	private UploadFilesService fileService;

	private List<UploadFiles> uploadFiles = new ArrayList<UploadFiles>();

	private String nowcontent;
	/* 与分页有关的数据信息 */
	private int pageNum = 1;

	private static final long serialVersionUID = 1L;
	// 用来接受附件信息
	private File[] attachment; // 实际上传文件
	private String[] attachmentContentType; // 文件的内容类型
	private String[] attachmentFileName; // 上传文件名

	private static Logger logger = Logger.getLogger(BookAction.class);

	public String index() {
		try {
			// List<Economy> ecolist = ecoService.findTopInfo();
			// ActionContext.getContext().put("ecolist",ecolist);
			PageBean pageBean = ecoService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "ecolist";
	}

	public String show() {
		try {
			Economy detaileco = ecoService.findById(model.getId());
			List<UploadFiles> attachments = fileService
					.findAttachmentForEco(detaileco.getId());
			if (attachments != null) {
				detaileco.setAttachments(new HashSet<UploadFiles>(attachments));
			}
			ActionContext.getContext().put("detaileco", detaileco);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "showeco";
	}

	/* 后台的财务展示 */
	public String list() {
		try {
			PageBean pageBean = ecoService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "list";
	}

	/* 后台的财务展示 */
	public String addUI() {
		return "addUI";
	}

	/* 后台的财务展示 */
	public String add() {
		try {
			Economy eco = new Economy();
			eco.setTitle(model.getTitle());
			eco.setContent(nowcontent);
			User user = (User) ActionContext.getContext().getSession().get("user");
			eco.setAuthor(user);
			eco.setDate(new Date());

			if (attachment != null) {
				saveFile();
				eco.setAttachments(new HashSet<UploadFiles>(uploadFiles));
			}
			ecoService.save(eco);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	/* 后台跳转到修改页面展示 */
	public String editUI() {
		try {
			// 准备回显的数据
			Economy eco = ecoService.findById(model.getId());
			ActionContext.getContext().getValueStack().push(eco);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "editUI";
	}

	/* 修改数据 */
	public String edit() {
		try {
			Economy eco = ecoService.findById(model.getId());
			eco.setTitle(model.getTitle());
			eco.setContent(nowcontent);
			eco.setDate(new Date());
			User user = (User) ActionContext.getContext().getSession().get("user");
			eco.setAuthor(user);
			ecoService.update(eco);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	public String delete() {
		ecoService.delete(model.getId());
		return "toList";
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

	public Economy getModel() {
		return model;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public String getNowcontent() {
		return nowcontent;
	}

	public void setNowcontent(String nowcontent) {
		this.nowcontent = nowcontent;
	}

	public static String getExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}

	// 把附件添加到指定的文件夹中
	public void saveFile() {
		String targetDirectory = ServletActionContext.getServletContext()
				.getRealPath("/" + "files/");// 获得路径
		StringBuffer filename = new StringBuffer();
		if (attachment != null) {
			for (int i = 0; i < attachment.length; i++) {
				String fileName = attachmentFileName[i]; // 上传的文件名
				String type = attachmentContentType[i]; // 文件类型
				String realName = UUID.randomUUID().toString()
						+ getExt(fileName); // 保存的文件名称、使用UUID+后缀进行保存
				File target = new File(targetDirectory, realName);
				try {
					FileUtils.copyFile(attachment[i], target);// 上传至服务器的目录
				} catch (IOException e) {
					addFieldError("error", "文件上传失败，请重试");
				}
				if (i != (attachment.length - 1)) {
					filename.append(targetDirectory + "\\" + realName + ",");
				} else {
					filename.append(targetDirectory + "\\" + realName);
				}

				// /*测试一下*/
				// System.out.println(type);
				// System.out.println(fileName);
				// System.out.println(realName);
				// 把路径()写入数据库
				UploadFiles uf = new UploadFiles(); // 创建文件
				uf.setUploadContentType(type);
				uf.setUploadFileName(fileName);
				uf.setUploadRealName(realName);
				fileService.save(uf);
				uploadFiles.add(uf); // 添加到需要下载文件的List集合中
			}
		}
	}
}