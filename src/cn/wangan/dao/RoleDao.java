package cn.wangan.dao;

import java.util.List;

import cn.wangan.base.BaseDao;
import cn.wangan.domain.Role;
/**
 * Role对象与数据库操作的接口
 * @author wpr
 *
 */
public interface RoleDao extends BaseDao<Role> {
	/**
	 * 根据用户名查找用户
	 * @param name
	 */
	List<Role> findByName(String name);
	
}
