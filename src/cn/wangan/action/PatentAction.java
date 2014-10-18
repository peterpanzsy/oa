package cn.wangan.action;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.PageBean;
import cn.wangan.domain.Patent;
import cn.wangan.domain.User;
import cn.wangan.service.PatentService;
import cn.wangan.service.UserService;
import cn.wangan.utils.Logger2File;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class PatentAction  extends ActionSupport implements ModelDriven<Patent> {

	@Resource
	private PatentService patentService;
	@Resource
	private UserService userService;
	
	private Patent model = new Patent();
	private String searchContent;
	
	private static Logger logger = Logger.getLogger(PatentAction.class);  
	//用来返回JSON数据格式	
	private  Map map = new HashMap();
	//处理发明人的字段
	private String username;
	//用来接受页面传来的当前页码数，默认第一页
	private int pageNum = 1 ;
	
	public Patent getModel() {
		return model;
	}
	public String index(){
		try {
			PageBean pageBean = patentService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "index";
	}
	/*后台数据展示*/
	public String list(){
		try {
			PageBean pageBean = patentService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "list";
	}
	/*后台数据修改回显*/
	@SuppressWarnings("unchecked")
	public String editUI(){
		try {
			Patent patent = patentService.findById(model.getId());
			/*if(patent.getInventors()!=null){
				StringBuffer sb = new StringBuffer();
				int i = 0;
				for(User u:patent.getInventors()){
					if(i!=(patent.getInventors().size()-1)){
						sb.append(u.getLoginName()+";");
						}else{
							sb.append(u.getLoginName());
						}
					i++;
				}
				map.put("username",sb.toString());
			}*/
			map.put("username",patent.getUsername());
			map.put("name",patent.getName());
			map.put("authorizationNumber",patent.getAuthorizationNumber());
			map.put("description",patent.getDescription());
			map.put("type",patent.getType());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "editUI";
	}
	/*修改*/
	public String edit(){
		try {
			Patent patent = patentService.findById(model.getId());
			/*Set<User> users = new HashSet<User>();
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
			}*/
			//patent.setInventors(users);
			saveModel(patent);
			patentService.update(patent);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}
	/*添加*/
	public String add(){
		/*try {*/
			Patent patent = new Patent();
			/*Set<User> users = new HashSet<User>();
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
			patent.setInventors(users);*/
			saveModel(patent);
			patentService.save(patent);
		/*} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}*/
		
		return "toList";
	}
	public String delete(){
		try {
			patentService.delete(model.getId());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}
	public String search(){
		try {
			if(searchContent==null || "".equals(searchContent.trim())){
				return "input";
			}
			PageBean pageBean = patentService.searchContent(pageNum,searchContent);
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
	
	private void saveModel(Patent patent) {
		patent.setUsername(model.getUsername());
		patent.setAuthorizationNumber(model.getAuthorizationNumber());
		patent.setDescription(model.getDescription());
		patent.setName(model.getName());
		patent.setType(model.getType());
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	public String getSearchContent() {
		return searchContent;
	}
	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
}
