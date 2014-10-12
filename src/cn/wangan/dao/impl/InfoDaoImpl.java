package cn.wangan.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.InfoDao;
import cn.wangan.domain.Information;
@Repository("infoDao")
@SuppressWarnings("unchecked")
public class InfoDaoImpl extends BaseDaoImpl<Information> implements InfoDao {

	public List<Information> findTopInfo() {
		return  getSession().createQuery("from Information info order by info.date desc").setFirstResult(0).setMaxResults(10).list();
	}

	public Long getTotalCount() {
		return (Long) getSession().createQuery("SELECT COUNT(*) FROM Information").uniqueResult();
	}

	public List getCurrentPageList(int pageNum, int pageSize) {
		return getSession().createQuery("FROM Information info ORDER BY info.id DESC ")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize).list();
	}


}
