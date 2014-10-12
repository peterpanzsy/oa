package cn.wangan.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.PageBean;
import cn.wangan.domain.Paper;
import cn.wangan.domain.Program;
import cn.wangan.domain.UploadFiles;
import cn.wangan.domain.User;
import cn.wangan.service.PaperService;
import cn.wangan.service.ProgramService;
import cn.wangan.service.UploadFilesService;
import cn.wangan.service.UserService;
import cn.wangan.utils.Logger2File;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class PaperAction extends ActionSupport implements ModelDriven<Paper> {
	@Resource
	private PaperService paperService;
	@Resource
	private UserService userService;
	@Resource 
	private ProgramService programService;
	
	private String searchContent;
	private String username;
	private String programName;
	//用来接受页面传来的当前页码数，默认第一页
	private int pageNum = 1 ;
	
	private static Logger logger = Logger.getLogger(PaperAction.class);  

	//与论文有关的东西
	private File upload; // 实际上传文件
	private String uploadContentType; // 文件的内容类型
	private String uploadFileName; // 上传文件名
	
	private Paper model = new Paper();
	
	public Paper getModel() {
		return model;
	}
	
	
	/*查询Paper*/
	public String search(){
		try {
			//查询数据，同时进行分页
			if(searchContent==null || "".equals(searchContent.trim())){
				return "input";
			}
			PageBean pageBean = paperService.searchContent(pageNum,searchContent);
			if(pageBean!=null){
				//说明找到了数据
				ActionContext.getContext().getValueStack().push(pageBean);
				ActionContext.getContext().getValueStack().push(searchContent);
				return "successSearch";
			}else{
				pageBean = new PageBean();
				ActionContext.getContext().getValueStack().push(pageBean);
				//说明没有找到数据，返回一句话，记录不存在
				return "successSearch";
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
			throw new RuntimeException();
		}
	}
	
	/*主页中点击科研成果下的论文成果*/
	public String index(){
		try {
			PageBean pageBean = paperService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "index";
	}
	/*具体内容页面的展示*/
	public String showDetail(){
		try {
			Paper paper = paperService.findById(model.getId());
			ActionContext.getContext().getValueStack().push(paper);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "showDetail";
	}
	/*后台的页面展示*/
	public String list(){
		try {
			PageBean pageBean = paperService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "list";
	}
	/*后台的添加页面*/
	public String addUI(){
		return "addUI";
	}
	/*后台的个人科研管理的添加*/
	public String add(){
		try {
			Paper paper = new Paper();
			//用户处理
			Set<User> users = new HashSet<User>();
			if(username!=null && !("".equals(username.trim()))){
				for(String s:username.split(";")){
					//检验用户是否存在,之前写的有问题，导致现在只能这样，
					User user = userService.getUserByName(s);
					if(user!=null){
						//如果用户存在
						users.add(user);
					}else{
						//用户不存在
						addFieldError("error", "用户名不存在");
						//返回提示页面
						return "input"; 
					}
				}
			}
			paper.setAuthors(users);
			//项目处理
			Program program = new Program();
			program = programService.findByName(programName);
			paper.setProgram(program);
			
			saveModel(paper);
			paperService.save(paper,upload,uploadContentType,uploadFileName);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}
	/*后台删除功能*/
	public String delete(){
		try {
			paperService.delete(model.getId());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}
	/*后台修改功能*/
	public String edit(){
		try {
			Paper paper =paperService.findById(model.getId());
			//用户处理
			Set<User> users = new HashSet<User>();
			if(username!=null && !("".equals(username.trim()))){
				for(String s:username.split(";")){
					//检验用户是否存在,之前写的有问题，导致现在只能这样，
					User user = userService.getUserByName(s);
					if(user!=null){
						//如果用户存在
						users.add(user);
					}else{
						//用户不存在
						addFieldError("error", "用户名不存在");
						//返回提示页面
						return "input"; 
					}
				}
			}
			//users.add(u);
			paper.setAuthors(users);
			//项目处理
			Program program = new Program();
			program = programService.findByName(programName);
			paper.setProgram(program);
			saveModel(paper);
			paperService.update(paper);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}
	/*后台修改需要的东东*/
	@SuppressWarnings("unchecked")
	public String editUI(){
		try {
			Paper paper = paperService.findById(model.getId());
			if(paper.getAuthors()!=null){
				int i = 0;
				StringBuffer sb = new StringBuffer();
				for(User u:paper.getAuthors()){
					if(i<paper.getAuthors().size()-1){
						sb.append(u.getLoginName()).append(";");
					}else{
						sb.append(u.getLoginName());
					}
					i++;
				}
				username = sb.toString();
				ActionContext.getContext().put("username", username);
			}
			ActionContext.getContext().put("paper",paper);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "editUI";
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public void saveModel(Paper paper){
		paper.setDescription(model.getDescription());
		paper.setMagazineName(model.getMagazineName());
		paper.setName(model.getName());
		paper.setPublishTime(model.getPublishTime());
		paper.setSummary(model.getSummary());
		paper.setTheme(model.getTheme());
		paper.setType(model.getType());
		paper.setJuan(model.getJuan());
		paper.setJuan(model.getQi());
		paper.setPagination(model.getPagination());
		paper.setSCIIndex(model.getSCIIndex());
		paper.setEIIndex(model.getEIIndex());
		paper.setHomeImportantArticle(model.getHomeImportantArticle());
		paper.setHomeCoreArtile(model.getHomeCoreArtile());
		paper.setSCIQuote(model.getSCIQuote());
		paper.setEIQuote(model.getEIQuote());
		paper.setState(model.getState());
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}


	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	
}
