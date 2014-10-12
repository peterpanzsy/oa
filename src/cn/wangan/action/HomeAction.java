package cn.wangan.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.Activity;
import cn.wangan.domain.Book;
import cn.wangan.domain.Information;
import cn.wangan.domain.PageBean;
import cn.wangan.domain.Privilege;
import cn.wangan.domain.Servers;
import cn.wangan.domain.User;
import cn.wangan.service.ActivityService;
import cn.wangan.service.BookService;
import cn.wangan.service.InformationService;
import cn.wangan.service.PrivilegeService;
import cn.wangan.service.ServersService;
import cn.wangan.service.UserService;
import cn.wangan.utils.Logger2File;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class HomeAction extends ActionSupport {
	@Resource
	private InformationService infoService;
	@Resource
	private ServersService serversService;
	@Resource
	private UserService userService;
	@Resource
	private BookService bookService;
	@Resource
	private ActivityService activityService;
	//用来接受页面传来的当前页码数，默认第一页
	private int pageNum = 1 ;
	
	private static Logger logger = Logger.getLogger(HomeAction.class);  
	
	public String list(){
		try {
			List<User> userList = userService.findAll();
			ActionContext.getContext().put("userList", userList);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "list";
	}
	
	public String index(){
		try {
			List<Activity> topActivity=activityService.findActivity();
			ActionContext.getContext().put("topActivity", topActivity);
			
			List<Book> topBook = bookService.findTopbook();
			ActionContext.getContext().put("topBook", topBook);
			
			List<Information> topInfo = infoService.findTopInfo();
			ActionContext.getContext().put("topInfo",topInfo);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return SUCCESS;
	}
	public String resource(){
		try {
			//准备分页数据
			PageBean pageBean = bookService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		
		return "resource";
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
}
