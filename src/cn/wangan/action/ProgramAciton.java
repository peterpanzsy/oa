package cn.wangan.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.dao.ProgramDao;
import cn.wangan.domain.PageBean;
import cn.wangan.domain.Program;
import cn.wangan.domain.Trend;
import cn.wangan.domain.UploadFiles;
import cn.wangan.domain.User;
import cn.wangan.service.ProgramService;
import cn.wangan.service.UploadFilesService;
import cn.wangan.service.UserService;
import cn.wangan.utils.Logger2File;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class ProgramAciton extends ActionSupport implements
		ModelDriven<Program> {
	@Resource
	private ProgramService programService;
	@Resource
	private UserService userService;
	@Resource
	private UploadFilesService fileService;
	@Resource
	private ProgramDao programdao; 
	
	private Program model = new Program();
	
	private  Map map = new HashMap();
	 
	private String content;
	//与结题报告有关的东西
	private File upload; // 实际上传文件
	private String uploadContentType; // 文件的内容类型
	private String uploadFileName; // 上传文件名
	
	
	//上传资料
	private File[] uploadFiles; // 实际上传文件
	private String[] uploadFilesContentType; // 文件的内容类型
	private String[] uploadFilesFileName; // 上传文件名
	private List<UploadFiles> uploads = new ArrayList<UploadFiles>();
	
	private static Logger logger = Logger.getLogger(ProgramAciton.class);  
	
	//用来接受页面传来的当前页码数，默认第一页
	private int pageNum = 1 ;
	
	public Program getModel() {
		return model;
	}
	//得到组员的登录名，用','隔开
	private String usernames;
	/** 列表 */
	public String list() throws Exception {
		
		//每页显示的数据
		int pageSize = 6;
		
		try {
			PageBean pageBean = programService.getPageBean(pageSize,pageNum);
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
			if(model.getId()!=null){
				programService.delete(model.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	/** 添加页面 */
	public String show() throws Exception {
		try {
			//每页显示的数据
			int pageSize = 10;
			
			PageBean pageBean = programService.getPageBean(pageSize,pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
			//准备数据
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "show";
	}

	/** 添加 */
	public String add() throws Exception {
		/*try {
			String[] username = usernames.split(",");
			boolean flag = true;
			for(String u :username){
				User user = new User();
				user.setLoginName(u);
				flag = userService.findByName(user);
				if(!flag){
					break;
				}
			}
			Set<User> users = new HashSet<User>();
			if(flag){
				//如果所有的用户名都存在
				for(String u :username){
					User user = new User();
					user = userService.getUserByName(u);
					users.add(user);
				}
			}else{
				//存在输入的用户名不存在
				addFieldError("userError", "用户名不存在");
				//TODO 暂时先跳转到这个页面，以后这个错误信息要回显
				return "addsuccess";
			}*/
			//封装元素
			Program p = new Program();
			p.setName(model.getName());
			p.setDescription(model.getDescription());
			p.setStartTime(new Date());
			p.setEnd(0);
			User user = (User)ActionContext.getContext().getSession().get("user");
			p.setLeader(user);
			p.setUsers_names(usernames);
			p.setProceeding("立项阶段");
			/*p.setUsers(users);*/
			//封装到数据库
			programService.save(p);
	/*	} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}*/
		return "toList";
	}

	/*结题报告*/
	public String end(){
		try {
			Program program = programService.findById(model.getId());
			if(upload!=null){
				program.setEnd(1);
				program.setEndTime(new Date());
				UploadFiles report = new UploadFiles();
				report.setUploadFileName(uploadFileName);
				report.setUploadContentType(uploadContentType);
				saveFile(report);
				program.setProceeding("整合结题");
				programService.update(program,report);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "end";
	}
	
	
	/*上传项目资料*/
	public String uploadFile(){
		Program program = programService.findById(model.getId());
		String targetDirectory = ServletActionContext.getServletContext().getRealPath("/"+"files/");//获得路径  
		System.out.println(targetDirectory);
		System.out.println("++++"+uploadFiles);
		for(int i = 0 ; i < uploadFiles.length ; i++){  
            String fileName = uploadFilesFileName[i]; //上传的文件名  
            String type = uploadFilesContentType[i]; //文件类型  
            String realName = UUID.randomUUID().toString() +   
                             getExt(fileName); //保存的文件名称、使用UUID+后缀进行保存  
            File target = new File(targetDirectory,realName);  
            try {  
                FileUtils.copyFile(uploadFiles[i],target);//上传至服务器的目录  
            } catch (IOException e) {  
           	 throw new RuntimeException();
            }   
            //把路径()写入数据库 
            UploadFiles uf = new UploadFiles(); //创建文件  
            uf.setUploadContentType(type);  
            uf.setUploadFileName(fileName);  
            uf.setUploadRealName(realName); 
            fileService.save(uf);
            uploads.add(uf);
        }  
		program.setUploads(new HashSet<UploadFiles>(uploads));
		System.out.println(program.getUploads());
		programdao.update(program);
		uploads.clear();
		return "toList";
	}
	
	/** 修改 */
	public String edit() throws Exception {
		
		try {
			Program pro = programService.findById(model.getId());
			if(pro!=null){
				pro.setProceeding(model.getProceeding());
				programService.update(pro,content);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}
	/*显示具体的信息*/
	@SuppressWarnings("unchecked")
	public String showDetail(){
		try {
			Long id = model.getId();
			Program program = programService.findById(id);
			
			if(program==null){
				System.out.println("这里有问题");
			}
			map.put("name",program.getName());
			map.put("leader",program.getLeader().getName());
			StringBuffer username =new StringBuffer();
			/*for(User u:program.getUsers()){
				username.append(u.getName()).append("  ");
			}*/
			
			map.put("username",program.getUsers_names());
			
			map.put("description", program.getDescription());
			
			map.put("currentTrend",program.getCurrentTrend().getContent());
			
			String[] trends = new String[program.getTrends().size()];
			int i = 0;
			for(Trend t:program.getTrends()){
				trends[i++] = t.getContent();
			}
			map.put("trends",trends);
			
			map.put("proceeding",program.getProceeding());
			
			map.put("end",program.getEnd());
			if(program.getEnd()==1){
				map.put("report",program.getReport().getUploadFileName());
				map.put("fileId", program.getReport().getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "showDetail";
	}

	public void saveFile(UploadFiles report) {
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
			addFieldError("error", "文件上传失败，请重试");
		}

		// 把路径()写入数据库
		UploadFiles uf = new UploadFiles(); // 创建文件
		uf.setUploadContentType(type);
		uf.setUploadFileName(fileName);
		uf.setUploadRealName(realName);
		fileService.save(uf);
		report.setUploadRealName(realName);
	}
	
	public static String getExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}
	
	
	
	
	
	
	
	public String getUsernames() {
		return usernames;
	}

	public void setUsernames(String usernames) {
		this.usernames = usernames;
	}

	public Map getMap() {
		return map;
	}

	public void setMap(Map map) {
		this.map = map;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public File[] getUploadFiles() {
		return uploadFiles;
	}

	public void setUploadFiles(File[] uploadFiles) {
		this.uploadFiles = uploadFiles;
	}

	public String[] getUploadFilesContentType() {
		return uploadFilesContentType;
	}

	public void setUploadFilesContentType(String[] uploadFilesContentType) {
		this.uploadFilesContentType = uploadFilesContentType;
	}

	public String[] getUploadFilesFileName() {
		return uploadFilesFileName;
	}

	public void setUploadFilesFileName(String[] uploadFilesFileName) {
		this.uploadFilesFileName = uploadFilesFileName;
	}

	public List<UploadFiles> getUploads() {
		return uploads;
	}

	public void setUploads(List<UploadFiles> uploads) {
		this.uploads = uploads;
	}

	public ProgramDao getProgramdao() {
		return programdao;
	}

	public void setProgramdao(ProgramDao programdao) {
		this.programdao = programdao;
	}
	
	
}
