package cn.wangan.service;

import java.util.List;

import cn.wangan.domain.Privilege;

public interface PrivilegeService {

	List<Privilege> findTopPrivilege();

	List<Privilege> getByIds(Long[] privilegeIds);

}
