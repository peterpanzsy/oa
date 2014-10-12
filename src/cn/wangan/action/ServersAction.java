package cn.wangan.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.PageBean;
import cn.wangan.domain.Servers;
import cn.wangan.service.ServersService;
import cn.wangan.utils.Logger2File;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class ServersAction extends ActionSupport implements
		ModelDriven<Servers> {
	@Resource
	private ServersService serversService;
	//用来接受页面传来的当前页码数，默认第一页
	private int pageNum = 1 ;
	private String searchContent;
	private Servers model = new Servers();
   
	
	private static Logger logger = Logger.getLogger(ServersAction.class);  
	//用来返回JSON数据格式	
	private  Map map = new HashMap();
	
	public Servers getModel() {
		return model;
	}

	/** 列表 */
	public String list() throws Exception {
		//准备服务器数据
		try {
			PageBean pageBean =serversService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "list";
	}
	/*后台服务器管理*/
	public String manager(){
		try {
			PageBean pageBean =serversService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "manager";
	}
	public String search(){
		try {
			if(searchContent==null||"".equals(searchContent.trim())){
				return "input";
			}
			PageBean pageBean = serversService.searchContent(pageNum,searchContent);
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

	/** 删除 */
	public String delete() throws Exception {
		try {
			serversService.delete(model.getId());
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	/** 添加 */
	public String add() throws Exception {
		serversService.save(model);
		return "toList";
	}

	/** 修改页面 */
	public String editUI() throws Exception {
		try {
			Servers server = serversService.findById(model.getId());
			map.put("server",server);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "editUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		try {
			Servers server = serversService.findById(model.getId());
			if(server!=null){
				server.setAddress(model.getAddress());
				server.setConfigure(model.getConfigure());
				server.setDescription(model.getDescription());
				server.setIp(model.getIp());
				server.setPurpose(model.getPurpose());
				server.setSystem(model.getSystem());
				server.setUsername(model.getUsername());
				serversService.update(server);
			}
		} catch (Exception e) {
			 e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
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

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
}
