package cn.wangan.dao;

import java.util.List;

import cn.wangan.domain.Privilege;

/**
 * privilege与数据库操作的接口
 * @author wpr
 */
public interface PrivilegeDao {

	List<Privilege> findTopPrivilege();

	List<Privilege> findByIds(Long[] privilegeIds);

}
