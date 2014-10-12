package cn.wangan.dao;


import java.util.List;

import cn.wangan.base.BaseDao;
import cn.wangan.domain.Activity;

public interface ActivityDao extends BaseDao<Activity>{
	List<Activity> findActivity();

}
