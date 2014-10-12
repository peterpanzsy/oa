package cn.wangan.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.Activity;
import cn.wangan.domain.Book;
import cn.wangan.domain.Information;
import cn.wangan.domain.Privilege;
import cn.wangan.domain.User;
import cn.wangan.service.ActivityService;
import cn.wangan.service.BookService;
import cn.wangan.service.InformationService;
import cn.wangan.service.PrivilegeService;
import cn.wangan.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class LoginOutAction extends ActionSupport implements ModelDriven<User>{
	
	@Resource
	private UserService userService;
	@Resource
	private PrivilegeService privilegeService;
	@Resource
	private BookService bookService;
	@Resource
	private InformationService infoService;
	@Resource
	private ActivityService activityService;	
	//获得验证码
	private String securityCode;
	
	private static Logger logger = Logger.getLogger(LoginOutAction.class);  
	
	
	private User model = new User();
	
	public User getModel() {
		return model;
	}
	/*跳转到登录页面*/
	public String loginUI(){
		return "loginUI";
	}
	/*登录，并把用户对应的顶级权限放到Session中*/
	public String login(){
		// 验证用户名与密码，如果正确就返回这个用户，否则返回null
		User user = userService.findByLoginNameAndPassword(model.getLoginName(), model.getPassword());
		//得到正确的验证码
		String trueSecurityCode = (String) ActionContext.getContext().getSession().get("securityCode");
		// 如果登录名或密码不正确，就转回到登录页面并提示错误消息
		if (user == null) {
			addFieldError("login", "登录名或密码不正确！");
			return "loginUI";
		}else if(!trueSecurityCode.equals(securityCode)){
			//验证码不匹配
			addFieldError("login", "验证码错误，请重新输入");
			return "loginUI";
		}
		// 如果登录名与密码,验证码都正确，就登录用户
		else {
			ActionContext.getContext().getSession().put("user", user);
			//准备一些与user有关的内容
			//权限
			List<Privilege> topPrivilege = null;
			if("admin".equals(user.getLoginName())){
				//admin特殊处理一下,admin拥有所有的权限
				topPrivilege = privilegeService.findTopPrivilege();
				if(topPrivilege==null){
					System.out.println("这里有问题");
				}
			}else{
				//得到用户的顶级权限;
				topPrivilege = userService.findUserTopPrivilege(user);
			}
			//准备首页数据
			//1.准备权限数据
			ActionContext.getContext().getSession().put("topPrivileg",topPrivilege);
			//2.首页图书信息
			findTopbook();
			//3.准备通知信息
			findTopInfo();
			
			findActivity();
			//logger.debug("这个LoginName"+user.getLoginName()+"登录了");  
			return SUCCESS;
		}
	}
	
	private void findActivity() {
		List<Activity> topActivity=activityService.findActivity();
		ActionContext.getContext().put("topActivity", topActivity);
	}
	
	//准备通知信息
	private void findTopInfo() {
		List<Information> topInfo = infoService.findTopInfo();
		ActionContext.getContext().put("topInfo",topInfo);
	}
	//准备图书信息
	private void findTopbook() {
		List<Book> topBook = bookService.findTopbook();
		ActionContext.getContext().put("topBook", topBook);
	}
	/*登出*/
	public String logout(){
		ActionContext.getContext().getSession().clear();
		return "logout";
	}
	public String getSecurityCode() {
		return securityCode;
	}
	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}
}
