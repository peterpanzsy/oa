package cn.wangan.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.Activity;
import cn.wangan.service.ActivityService;
import cn.wangan.utils.Logger2File;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class ActivityAction extends ActionSupport implements
ModelDriven<Activity> {
	private static final long serialVersionUID = 1L;
	private Activity model = new Activity();
	public Activity getModel() {
		return model;
	}
	@Resource
	private ActivityService activityService;
	
	private  Map map = new HashMap();
	
	private static Logger logger = Logger.getLogger(ActivityAction.class);  
	
	//获取所有事件
	public String list() {
		try {
			List<Activity> activitylist=activityService.findAll();
			ActionContext.getContext().put("activitylist", activitylist);
		} catch (Exception e) {
			   e.printStackTrace();
			   logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "list";
	}
	
	//根据id获取活动细节
	@SuppressWarnings("unchecked")
	public String showDetail(){
		try {
			long id=model.getId();
			Activity activity=activityService.findById(id);
			map.put("date",activity.getDate());
			map.put("title",activity.getTitle());
			map.put("place",activity.getPlace());
			map.put("summary", activity.getSummary());
			map.put("number", activity.getNumber());
			map.put("type",activity.getType());
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "showDetail";
		
	}
	
	public String admin(){
		try {
			List<Activity> activitylist=activityService.findAll();
			ActionContext.getContext().put("activitylist", activitylist);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "admin";
	}
	
	public String delete(){
		try {
			activityService.delete(model.getId());
		} catch (Exception e) {
			 e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "tolist";
		
		
	}
	
	//实现添加Activity的操作
	public String add(){
		try {
			Activity activity=new Activity();
			activity.setDate(model.getDate());
			activity.setNumber(model.getNumber());
			activity.setPlace(model.getPlace());
			activity.setSummary(model.getSummary());
			activity.setTitle(model.getTitle());
			activity.setType(model.getType());
			activityService.save(activity);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		
		return "tolist";
	}
	
	public String edit(){
		try {
			Activity activity=activityService.findById(model.getId());
			activity.setDate(model.getDate());
			activity.setNumber(model.getNumber());
			activity.setPlace(model.getPlace());
			activity.setSummary(model.getSummary());
			activity.setTitle(model.getTitle());
			activity.setType(model.getType());
			activityService.update(activity);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "tolist";
	}
	
	public Map getMap() {
		return map;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	
	
}