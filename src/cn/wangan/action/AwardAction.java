package cn.wangan.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.Award;
import cn.wangan.domain.Book;
import cn.wangan.domain.PageBean;
import cn.wangan.domain.User;
import cn.wangan.service.AwardService;
import cn.wangan.service.BookService;
import cn.wangan.service.UserService;
import cn.wangan.utils.Logger2File;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class AwardAction extends ActionSupport implements ModelDriven<Award> {
	@Resource
	private AwardService awardService;
	@Resource
	private UserService userService;
	//用来返回JSON数据格式	
	private  Map map = new HashMap();
	
	private String searchContent;
	private String username;
	// 用来接受页面传来的当前页码数，默认第一页
	private int pageNum = 1;
	private static Logger logger = Logger.getLogger(AwardAction.class);  
	private Award model = new Award();

	public Award getModel() {
		return model;
	}

	public String index() {
		// 首页展示入口
		// 全部数据
		try {
			PageBean pageBean = awardService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "index";
	}

	/* 后台管理的展示页面 */
	public String list1() {
		// 首页展示入口
		// 全部数据
		try {
			PageBean pageBean = awardService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "list";
	}

	/* 后台管理的添加功能 */
	public String add() {
		try {
			Award award = new Award();
			/*if (username != null) {
				User user = userService.getUserByName(username);
				if (user != null) {
					award.setUser(user);
				} else {
					award.setUser(null);
				}
			}*/
			saveModel(award);
			awardService.save(award);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	/* 后台管理的删除 */
	public String delete() {
		try {
			awardService.delete(model.getId());
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	public void saveModel(Award award) {
		award.setUsername(model.getUsername());
		award.setName(model.getName());
		award.setGrade(model.getGrade());
		award.setDate(model.getDate());
		award.setProgramName(model.getProgramName());
		award.setResearchInterests(model.getResearchInterests());
	}

	/* search功能 */
	public String search() {
		// 查询数据，同时进行分页
		if (searchContent == null || "".equals(searchContent.trim())) {
			return "input";
		}
		PageBean pageBean = awardService.searchContent(pageNum, searchContent);
		if (pageBean != null) {
			// 说明找到了数据
			ActionContext.getContext().getValueStack().push(pageBean);
			ActionContext.getContext().getValueStack().push(searchContent);
			return "successSearch";
		} else {
			// 说明没有找到数据，返回一句话，记录不存在
			pageBean = new PageBean();
			ActionContext.getContext().getValueStack().push(pageBean);
			return "successSearch";
		}
	}
	/**
	 * 返回JSON格式
	 */
	@SuppressWarnings("unchecked")
	public String editUI(){
		try {
			Award award = awardService.findById(model.getId());
			map.put("name", award.getName());
			map.put("date", award.getDate());
			map.put("grade", award.getGrade());
			map.put("programName", award.getProgramName());
			map.put("researchInterests", award.getResearchInterests());
			map.put("username", award.getUsername());
			/*if(award.getUser()!=null){
				map.put("username", award.getUser().getLoginName());
			}*/
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "editUI";
	}
	
	public String edit(){
		try {
			Award award = awardService.findById(model.getId());
			saveModel(award);
			awardService.update(award);
		} catch (Exception e) {
			 e.printStackTrace();
		     logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public Map getMap() {
		return map;
	}

	public void setMap(Map map) {
		this.map = map;
	}

}
