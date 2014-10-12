package cn.wangan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.PrivilegeDao;
import cn.wangan.domain.Privilege;
import cn.wangan.service.PrivilegeService;
@Service("privilegeService")
@Transactional
public class PrivilegeServiceImpl implements PrivilegeService{
	@Resource
	private PrivilegeDao privilegeDao;
	
	
	public List<Privilege> findTopPrivilege() {

		return privilegeDao.findTopPrivilege();
	}


	public List<Privilege> getByIds(Long[] privilegeIds) {
		return privilegeDao.findByIds(privilegeIds);
	}

}
