package cn.wangan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.RoleDao;
import cn.wangan.domain.Role;
import cn.wangan.service.RoleService;
/**
 * RoleService接口的实现类，
 * 调用Dao层实现与Role对象相关的业务逻辑
 * @author wpr
 */
@Transactional
@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Resource
	private RoleDao roleDao;

	public List<Role> findAll() {
		return roleDao.findAll();
	}

	public List<Role> findByIds(Long[] roleId) {
		return roleDao.findByIds(roleId);
	}

	public void delete(Long id) {
		roleDao.delete(id);
	}
	//注册的时候要保证role名称不相同
	public void save(Role role) {
		roleDao.save(role);
	}

	public Role findById(Long id) {
		return roleDao.getById(id);
	}

	public void update(Role role) {
		roleDao.update(role);
	}
	/**
	 * 判断用户名是否有重复
	 * @return如果存在，返回false;如果不存在，返回true
	 */
	public boolean findByName(Role role){
		//根据role.name从数据库查找role对象
		List<Role> roleList = roleDao.findByName(role.getName());
		//如果存在，返回false
		if(roleList==null||roleList.size()==0){
			return false;
		}
		return true;
	}
}
