package cn.wangan.dao.impl;


import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.PaperDao;
import cn.wangan.domain.Paper;

@Repository("paperDao")
@SuppressWarnings("unchecked")
public class PaperDaoImpl  extends BaseDaoImpl<Paper> implements PaperDao {

	public Long getTotalCount() {
		return  (Long) getSession().createQuery("SELECT COUNT(*) FROM Paper").uniqueResult();
	}

	public List getCurrentPageList(int pageNum, int pageSize) {
		return getSession().createQuery("FROM Paper p ORDER BY p.id DESC ")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize).list();
	}

	public Long getSearchTotalCount(String searchContent) {
		//根据Paper的名称和项目的名称来查询
		String hql ="SELECT COUNT(*) FROM Paper p where p.name like ? or p.program.name like ?";
		Long count = (Long) getSession().createQuery(hql).setParameter(0,"%"+searchContent.trim()+"%").setParameter(1,"%"+searchContent+"%").uniqueResult();

		//根据用户ID，在paper_user表中查询paperId
		String sql2 = "SELECT count(*) " +
				"FROM paper_user pu " +
				"WHERE pu.userId IN " +
					" (SELECT u.id from user u WHERE u.name like ?)";
		count+=Long.parseLong(String.valueOf(getSession().createSQLQuery(sql2).setParameter(0, "%"+searchContent.trim()+"%").uniqueResult()));
		return count;
	}

	public List getSearchCurrentPageList(String searchContent, int pageNum,
			int pageSize) {
		List list =	getSession().createSQLQuery("SELECT * FROM paper p WHERE p.id IN " +
				"(SELECT pu.paperId FROM paper_user pu WHERE pu.userId IN " +
				"(SELECT u.id from user u WHERE u.name like ?))")
				.addEntity(Paper.class)
				.setParameter(0,"%"+searchContent.trim()+"%")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize)
				.list();
		list.addAll(getSession().createQuery("FROM Paper p where p.name like ? ").setParameter(0,"%"+searchContent.trim()+"%").list());
		return list;
	}

	
}
