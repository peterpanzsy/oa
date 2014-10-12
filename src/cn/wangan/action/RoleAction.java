package cn.wangan.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.Privilege;
import cn.wangan.domain.Role;
import cn.wangan.service.PrivilegeService;
import cn.wangan.service.RoleService;
import cn.wangan.utils.Logger2File;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * RoleAction用来充当所有与Role直接相关的页面操作的控制器 包括Role的crud操作，权限分配操作
 * 
 * @author wpr
 * 
 */
@Controller
@Scope("prototype")
public class RoleAction extends ActionSupport implements ModelDriven<Role> {
	@Resource
	private RoleService roleService;
	@Resource
	private PrivilegeService privilegeService;
	
	private static Logger logger = Logger.getLogger(RoleAction.class);  
	
	private Long[] privilegeIds;
	// 模型封装
	private Role model = new Role();

	public Role getModel() {
		return model;
	}

	/** 列表 */
	public String list() throws Exception {
		try {
			List<Role> roleList = roleService.findAll();
			ActionContext.getContext().put("roleList", roleList);
			
			List<Privilege> topPrivilege = privilegeService.findTopPrivilege();
			ActionContext.getContext().put("topPrivilege",topPrivilege);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "list";
	}

	/** 删除 */
	public String delete() throws Exception {
		try {
			roleService.delete(model.getId());
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	/**
	 * 添加页面，不涉及到权限Privilege和User操作 对于与User的对应关系，由User类来实现 而权限的分配（比较复杂）另外放到了一个页面，
	 * 见方法setPrivilege()
	 * */
	public String addUI() throws Exception {
		return "addUI";
	}

	/** 添加 */
	public String add() throws Exception {
		// 得到对象，封装
		try {
			Role role = new Role();
			role.setName(model.getName());
			role.setDescription(model.getDescription());
			// 判断用户名是否重复
			if (!roleService.findByName(role)) {
				// 如果不存在
				roleService.save(role);
				return "toList";
			} else {
				// 显示错误信息
				ActionContext.getContext().put("error", "岗位名称 已经存在");
				return "list";
			}
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
			 throw new RuntimeException();
		}
	}

	/** 修改页面 */
	public String editUI() throws Exception {
		try {
			Role role = roleService.findById(model.getId());
			ActionContext.getContext().getValueStack().push(role);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "editUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		try {
			// 根据id来查找原Role对象，部分属性用于回显
			Role role = roleService.findById(model.getId());
			// 对该对象进行更新操作
			role.setName(model.getName());
			role.setDescription(model.getDescription());
			// 更新数据库
			roleService.update(role);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	/**
	 * 设置Role对应的权限，维护role和Privilege的关系
	 * @return
	 */
	public String setPrivilege() {
		try {
			// 1，从数据库中获取要修改的原始对象
			Role role = roleService.findById(model.getId());
			// 2, 设置要修改的属性
			List<Privilege> privilegeList = privilegeService.getByIds(privilegeIds);

			role.setPrivileges(new HashSet<Privilege>(privilegeList));

			// 3，更新到数据库
			roleService.update(role);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	public Long[] getPrivilegeIds() {
		return privilegeIds;
	}

	public void setPrivilegeIds(Long[] privilegeIds) {
		this.privilegeIds = privilegeIds;
	}
	
}
