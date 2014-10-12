package cn.wangan.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.ServersDao;
import cn.wangan.domain.Servers;
@Repository("serversDao")
public class ServersDaoImpl extends BaseDaoImpl<Servers> implements ServersDao {

	public Long getTotalCount() {
		return  (Long) getSession().createQuery("SELECT COUNT(*) FROM Servers").uniqueResult();
	}

	public List getCurrentPageList(int pageNum, int pageSize) {
		return getSession().createQuery("FROM Servers s ORDER BY s.id DESC ")
		.setFirstResult((pageNum-1)*pageSize)
		.setMaxResults(pageSize).list();
	}

	public Long getSearchTotalCount(String searchContent) {
		String hql ="SELECT COUNT(*) FROM Servers s where s.address like ? or s.ip like ? or s.username like ?";
		return (Long) getSession().createQuery(hql).setParameter(0,"%"+searchContent+"%").setParameter(1,"%"+searchContent+"%")
				.setParameter(2,"%"+searchContent+"%").uniqueResult();
	}

	public List getSearchCurrentPageList(String searchContent, int pageNum,
			int pageSize) {
		String hql ="FROM Servers s WHERE s.address like ? or s.ip like ? or s.username like ? ORDER BY s.id DESC";
		return getSession().createQuery(hql).setParameter(0, "%"+searchContent+"%").setParameter(1,"%"+searchContent+"%" )
				.setParameter(2,"%"+searchContent+"%")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize).list();
	}

}
