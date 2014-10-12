package cn.wangan.action;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.UploadFiles;
import cn.wangan.service.UploadFilesService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class DownloadAction extends ActionSupport implements
		ModelDriven<UploadFiles> {
	@Resource
	private UploadFilesService fileService;

	private static final long serialVersionUID = 6329383258366253255L;

	private String fileName;

	private String fileRealName;

	private UploadFiles model = new UploadFiles();

	public UploadFiles getModel() {
		return model;
	}

	public void setFileName() {
		UploadFiles file = fileService.findById(model.getId());
		this.fileName = file.getUploadFileName();
		this.fileRealName = file.getUploadRealName();

	} /*
	 * @getFileName 此方法对应的是struts.xml文件中的: <param name ="contentDisposition">
	 * attachment;filename="${fileName}"</param>
	 * 这个属性设置的是下载工具下载文件时显示的文件名、要想正确的显示中文文件名， 我们需要对fileName再次编码
	 * 否则中文名文件将出现乱码、或无法下载情况
	 * 
	 * @return
	 */

	public String getFileName() {
		try {
			fileName = new String(fileName.getBytes(), "ISO-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return fileName;
	}

	/*
	 * @getDownloadFile 此方法对应的是Struts.xml文件中的： <param
	 * name="inputName">downloadFile</param> 返回下载文件的流、可以参看Struts2的源码
	 */
	public InputStream getDownloadFile() {
		System.out.println(model.getId());
		this.setFileName();
		System.out.println(this.fileName);
		System.out.println(this.fileRealName);
		return ServletActionContext.getServletContext().getResourceAsStream(
				"/" + "files/" + fileRealName);
	}

	public String download() throws Exception {
		return "download";
	}
//
//	public String downloadUI() throws Exception {
//		// 准备数据
//		UploadFiles file = fileService.findById(2L);
//		ActionContext.getContext().put("file", file);
//		return "downloadUI";
//	}

}
