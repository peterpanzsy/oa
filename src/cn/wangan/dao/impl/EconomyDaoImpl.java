package cn.wangan.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.EconomyDao;
import cn.wangan.domain.Economy;
@Repository("ecoDao")
public class EconomyDaoImpl extends BaseDaoImpl<Economy> implements EconomyDao {

	@SuppressWarnings("unchecked")
	public List<Economy> findTopInfo() {
		return  getSession().createQuery("from Economy eco order by eco.date desc").setFirstResult(0).setMaxResults(5).list();
	}

	public Long getTotalCount() {
		return  (Long) getSession().createQuery("SELECT COUNT(*) FROM Economy").uniqueResult();
	}

	public List getCurrentPageList(int pageNum, int pageSize) {
		return getSession().createQuery("FROM Economy eco ORDER BY eco.id DESC ")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize).list();
	}


}
