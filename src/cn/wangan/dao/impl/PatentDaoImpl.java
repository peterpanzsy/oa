package cn.wangan.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.PatentDao;
import cn.wangan.domain.Patent;

@Repository("patentDao")
@SuppressWarnings("unchecked")
public class PatentDaoImpl extends BaseDaoImpl<Patent> implements PatentDao{

	public Long getTotalCount() {
		return  (Long) getSession().createQuery("SELECT COUNT(*) FROM Patent").uniqueResult();
	}

	public List getCurrentPageList(int pageNum, int pageSize) {
		return getSession().createQuery("FROM Patent p ORDER BY p.id DESC ")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize).list();
	}

	public Long getSearchTotalCount(String searchContent) {
		String hql ="SELECT COUNT(*) FROM Patent p where p.name like ? ";
		Long count = (Long) getSession().createQuery(hql).setParameter(0,"%"+searchContent.trim()+"%").uniqueResult();

		//根据用户ID，在patent_user表中查询patentId
		String sql2 = "SELECT count(*) " +
				"FROM patent_user pu " +
				"WHERE pu.userId IN " +
					" (SELECT u.id from user u WHERE u.name like ?)";
		count+=Long.parseLong(String.valueOf(getSession().createSQLQuery(sql2).setParameter(0, "%"+searchContent.trim()+"%").uniqueResult()));
		return count;
	}

	@SuppressWarnings("rawtypes")
	public List getSearchCurrentPageList(String searchContent, int pageNum,
			int pageSize) {
		List list =	getSession().createSQLQuery("SELECT * FROM patent p WHERE p.id IN " +
			"(SELECT pu.patentId FROM patent_user pu WHERE pu.userId IN " +
			"(SELECT u.id from user u WHERE u.name like ?))")
			.addEntity(Patent.class)
			.setParameter(0,"%"+searchContent.trim()+"%")
			.setFirstResult((pageNum-1)*pageSize)
			.setMaxResults(pageSize)
			.list();
		list.addAll(getSession().createQuery("FROM Patent p where p.name like ? ").setParameter(0,"%"+searchContent.trim()+"%").list());
		return list;
	}

}
