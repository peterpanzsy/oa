package cn.wangan.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.RoleDao;
import cn.wangan.domain.Role;
/**
 * RoleDao的实现类
 * @author wpr
 *
 */
@Repository("roleDao")
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao {

	@SuppressWarnings("unchecked")
	public List<Role> findByName(String name) {
		String hql ="from Role role where role.name = ?";
		List<Role> roleList = getSession().
				createQuery(hql).setString(0,name).
				list();
		return roleList;
	}
}
