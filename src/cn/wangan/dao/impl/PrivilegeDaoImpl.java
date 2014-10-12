package cn.wangan.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.PrivilegeDao;
import cn.wangan.domain.Privilege;
@Repository("privilegeDao")
public class PrivilegeDaoImpl extends BaseDaoImpl<Privilege> implements PrivilegeDao {

	@SuppressWarnings("unchecked")
	public List<Privilege> findTopPrivilege() {
		return getSession().createQuery("from Privilege p where p.parent = null").list();
	}

}
