package cn.wangan.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.Paper;
import cn.wangan.domain.Patent;
import cn.wangan.domain.Program;
import cn.wangan.domain.Role;
import cn.wangan.domain.UploadFiles;
import cn.wangan.domain.User;
import cn.wangan.service.RoleService;
import cn.wangan.service.UploadFilesService;
import cn.wangan.service.UserService;
import cn.wangan.utils.Logger2File;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * UserActionRoleAction用来充当所有与User直接相关的页面操作的控制器
 * 包括User的crud操作以及维护user和role之间的多对多的关系
 * @author wpr
 *
 */
@Controller
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User> {
	private static final String NULL = null;
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;
	@Resource
	private UploadFilesService fileService;
	/**用于接收传递过来的roleId参数*/
	private Long[] roleId;
	private static Logger logger = Logger.getLogger(UserAction.class);
	private  Map map = new HashMap();
	
	private String newpassword1;
	
	private String newpassword2;
	//模型封装
	private User model = new User();
	public User getModel() {
		return model;
	}
	/** 列表 */
	public String list() throws Exception {
		try {
			List<User> userList = userService.findAll();
			ActionContext.getContext().put("userList", userList);
			
			List<Role> roleList = roleService.findAll();
			ActionContext.getContext().put("roleList", roleList);
		} catch (Exception e) {
			  e.printStackTrace();
			  logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		
		return "list";
	}
	
	@SuppressWarnings("unchecked")
	public String showdetail(){
		try {
			User currentUser = userService.findById(model.getId());
				map.put("name", currentUser.getName());
				map.put("gender", currentUser.getGender());
				map.put("education", currentUser.getEducation());
				map.put("major", currentUser.getMajor());
				map.put("birthday", currentUser.getBirthday());
				map.put("phone", currentUser.getPhone());
				map.put("email", currentUser.getEmail());
				map.put("recruit", currentUser.getRecruitment());
				map.put("resume", currentUser.getResume());
				map.put("contactor", currentUser.getContactor());
				map.put("ephone", currentUser.getEphone());
				
				map.put("portraitName", currentUser.getPortrait().getUploadRealName());
				Set<Program> programs=currentUser.getPrograms();
				String[] program_string=new String[programs.size()];
				int i=0;
				for(Program p:programs){
					program_string[i++]=p.getName();
				}
				map.put("program", program_string);
				
				Set<Paper> papers=currentUser.getPapers();
				Set<Patent> patents=currentUser.getPatents();
				i=0;
				String[] reward_string=new String[papers.size()+patents.size()];
				for(Paper p:papers){
					reward_string[i++]=p.getName();
				}
				for(Patent p:patents){
					reward_string[i++]=p.getName();
				}
				
				map.put("reward", reward_string);
				map.put("graduation", currentUser.getGraduation());
		} catch (Exception e) {
			  e.printStackTrace();
			  logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "showdetail";
	}


	/** 添加页面 */
	public String addUI() throws Exception {
		try {
			//准备回显的数据，所有的角色信息，用于选择
			List<Role> roleList = roleService.findAll();
			ActionContext.getContext().put("roleList", roleList);
		} catch (Exception e) {
			  e.printStackTrace();
			  logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "addUI";
	}

	/** 添加 */
	public String add() throws Exception {
		try {
			//把model封装成为User对象
			//1.得到roles
			/*List<Role> roles = roleService.findByIds(roleId);*/
			
			//2.把model变为javaBean
			User user = new User();
			user.setLoginName(model.getLoginName());
			user.setName(model.getName());
			//考虑到需求（一般是网安自己招新，so直接初始化密码1234）
			//user.setPassword();
			user.setPassword("1234");
			user.setGender(model.getGender());
			/*if(roles!=null&&roles.size()>0){
				user.setRoles(new HashSet<Role>(roles));
			}else{
				user.setRoles(null);
			}*/
			user.setPhone(model.getPhone());
			user.setBirthday(model.getBirthday());
			user.setEducation(model.getEducation());
			user.setEmail(model.getEmail());
			if(!userService.findByName(user)){
				//如果不存在
				userService.save(user);
				return "toList";
			}else{
				//显示错误信息
				ActionContext.getContext().put("error", "登录名 已经存在，请重新填写");
				//准备回显数据
				List<Role> roleList = roleService.findAll();
				ActionContext.getContext().put("roleList", roleList);
				return "toList";
			}
		} catch (Exception e) {
			  e.printStackTrace();
			  logger.error(Logger2File.getTrace(e)); //将异常输出到文件
			  throw new RuntimeException();
		}
	}

	/** 返回要修改的数据内容 */
	@SuppressWarnings("unchecked")
	public String editUI() throws Exception {
		try {
			User currentUser = userService.findById(model.getId());
			if(currentUser==null){
				 return "manager";
			}else{
				map.put("loginName", currentUser.getLoginName());
				map.put("name", currentUser.getName());
				map.put("gender", currentUser.getGender());
				map.put("birthday", currentUser.getBirthday());
				map.put("education", currentUser.getEducation());
				map.put("phone", currentUser.getPhone());
				map.put("email", currentUser.getEmail());
				map.put("id", currentUser.getId());
				return "editUI";
			}
		} catch (Exception e) {
			  e.printStackTrace();
			  logger.error(Logger2File.getTrace(e)); //将异常输出到文件
			  throw new RuntimeException();
		}
	}

	/**个人信息（自己）修改 */
	public String edit()  {
		try {
			//从数据库中读取到原来的User对象
			User user = userService.findById(model.getId());
			if(user==null){
				//如果数据库中没有该对象，直接返回List页面
				return "HomeToList";
			}
			
			
			//修改User对象的属性
			user.setName(model.getName());
			user.setGender(model.getGender());
			user.setPhone(model.getPhone());
			user.setBirthday(model.getBirthday());
			user.setEducation(model.getEducation());
			user.setEmail(model.getEmail());
			user.setRecruitment(model.getRecruitment());
			user.setMajor(model.getMajor());
			user.setEphone(model.getEphone());
			user.setContactor(model.getContactor());
			user.setEmail(model.getEmail());
			user.setGraduation(model.getGraduation());
			user.setResume(model.getResume());
			if(!DigestUtils.md5Hex(model.getPassword()).equals(user.getPassword())){
				addFieldError("error", "原始密码错误，修改失败");
				userService.update(user);
				ActionContext.getContext().getSession().remove("user");
				ActionContext.getContext().getSession().put("user", user);
				return "HomeToList";
			} 
			if(newpassword1 != null && !("".equals(newpassword1))){
				user.setPassword(newpassword1);
				user.setPassword(DigestUtils.md5Hex(user.getPassword()));
			}
			//更新User对象到数据库中
			userService.update(user);
			ActionContext.getContext().getSession().remove("user");
			ActionContext.getContext().getSession().put("user", user);
		} catch (Exception e) {
			  e.printStackTrace();
			  logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "HomeToList";
	}
	
	public String editManager(){
		try {
			User user = userService.findById(model.getId());
			if(user!=null){
				user.setName(model.getName());
				user.setGender(model.getGender());
				user.setPhone(model.getPhone());
				user.setBirthday(model.getBirthday());
				user.setEducation(model.getEducation());
				user.setEmail(model.getEmail());
				//更新User对象到数据库中
				userService.update(user);
			}
		} catch (Exception e) {
			  e.printStackTrace();
			  logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}
	/*后台的个人信息管理*/
	public String person() {
		
		System.out.println("000000000000000");
		try {
			
			User user = (User) ActionContext.getContext().getSession().get("user");
			if(user.getPortrait() == null){
				//TODO 这个地方不太合理，如果那个的头像为空，那么给他设置一个默认的头像
				//但是在其他机器上时会出现bug
				//到时候一定要改
				UploadFiles uf = fileService.findById(66L);
				user.setPortrait(uf);
			}
			ActionContext.getContext().put("u", user);
		} catch (Exception e) {
			  e.printStackTrace();
			  logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "person";
	}
	
	public String manager(){
		try {
			List<User> userList = userService.findAll();
			ActionContext.getContext().put("userList", userList);
			
			//准备回显的数据，所有的角色信息，用于选择
			List<Role> roleList = roleService.findAll();
			ActionContext.getContext().put("roleList", roleList);
		} catch (Exception e) {
			  e.printStackTrace();
			  logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "manager";
	}
	/**
	 * User页面设置权限
	 * @return
	 */
	public String setRole(){
		try {
			User user = userService.findById(model.getId());
			
			List<Role> roleList = new ArrayList<Role>();
			if(roleId!=null && roleId.length>0){
				roleList = roleService.findByIds(roleId);
				user.setRoles(new HashSet<Role>(roleList));
			}
			if(roleList.size()==0){
				user.setRoles(null);
			}
			// 3，更新到数据库
			userService.update(user);
		} catch (Exception e) {
			  e.printStackTrace();
			  logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}
	
	
	
	//小组成员
	public String exhibition(){
		try {
			List<User> memberList = userService.findAll();
			ActionContext.getContext().put("memberList", memberList);
		} catch (Exception e) {
			  e.printStackTrace();
			  logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "exhibition";
	}
	
	public Long[] getRoleId() {
		return roleId;
	}

	public void setRoleId(Long[] roleId) {
		this.roleId = roleId;
	}
	public String getNewpassword1() {
		return newpassword1;
	}
	public void setNewpassword1(String newpassword1) {
		this.newpassword1 = newpassword1;
	}
	public String getNewpassword2() {
		return newpassword2;
	}
	public void setNewpassword2(String newpassword2) {
		this.newpassword2 = newpassword2;
	}
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	
}
