package cn.wangan.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.AwardDao;
import cn.wangan.dao.BookDao;
import cn.wangan.domain.Award;
import cn.wangan.domain.Book;

@Repository("awardDao")
@SuppressWarnings("unchecked")
public class AwardDaoImpl extends BaseDaoImpl<Award> implements AwardDao{

	public Long getTotalCount() {
		return  (Long) getSession().createQuery("SELECT COUNT(*) FROM Award").uniqueResult();
	}

	public List getCurrentPageList(int pageNum, int pageSize) {
		
		return getSession().createQuery("FROM Award award ORDER BY award.id DESC ")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize).list();
	}

	public Long getSearchTotalCount(String searchContent) {
		searchContent = searchContent.trim();
		System.out.println(searchContent);
//		String hql ="SELECT COUNT(*) FROM Award a where (a.name like ?) or (a.user.name like ?)";
		String hql ="SELECT COUNT(*) FROM Award a where a.name like ? ";
		return (Long) getSession().createQuery(hql).setParameter(0,"%"+String.valueOf(searchContent)+"%").uniqueResult();
	}

	public List getSearchCurrentPageList(String searchContent, int pageNum,
			int pageSize) {
		searchContent = searchContent.trim();
		System.out.println(searchContent);
//		String hql ="FROM Award a WHERE (a.name like ?) OR (a.user.name like ?) ORDER BY a.id DESC";
		String hql ="FROM Award a WHERE a.name like ? ORDER BY a.id DESC";
		return getSession().createQuery(hql).setParameter(0, "%"+searchContent+"%")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize).list();
	}

}
