package cn.wangan.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.ActivityDao;
import cn.wangan.domain.Activity;

@Repository("activityDao")
@SuppressWarnings("unchecked")
public class ActivityDaoImpl extends BaseDaoImpl<Activity> implements ActivityDao{

	
	public List<Activity> findActivity() {
		return getSession().createQuery("from Activity activity order by activity.date desc").list();
	}
}
