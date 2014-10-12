package cn.wangan.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.BookDao;
import cn.wangan.domain.Book;

@Repository("bookDao")
@SuppressWarnings("unchecked")
public class BookDaoImpl extends BaseDaoImpl<Book> implements BookDao{

	public List<Book> findTopbook() {
		return getSession().createQuery("from Book book order by book.id").setFirstResult(0).setMaxResults(7).list();
	}

	public Long getTotalCount() {
		return  (Long) getSession().createQuery("SELECT COUNT(*) FROM Book").uniqueResult();
	}

	public List getCurrentPageList(int pageNum, int pageSize) {
		return getSession().createQuery("FROM Book book ORDER BY book.id DESC ")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize).list();
	}

	public Long getSearchTotalCount(String searchContent) {
		searchContent =searchContent.trim();
		String hql ="SELECT COUNT(*) FROM Book book where book.name like ?)";
		String hql2 ="SELECT COUNT(*) FROM Book book where book.author like ?";
		return (Long) getSession().createQuery(hql).setParameter(0,"%"+searchContent+"%").uniqueResult()+
				 (Long) getSession().createQuery(hql2).setParameter(0,"%"+searchContent+"%").uniqueResult();
	}

	public List getSearchCurrentPageList(String searchContent, int pageNum,
			int pageSize) {
		searchContent =searchContent.trim();
		String hql ="FROM Book book WHERE book.name like ?  ORDER BY book.id DESC";
		String hql2 ="FROM Book book WHERE book.author like ? ORDER BY book.id DESC)";
		List list = getSession().createQuery(hql).setParameter(0, "%"+searchContent+"%")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize).list();
		list.addAll( getSession().createQuery(hql2).setParameter(0, "%"+searchContent+"%")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize).list());
		return list;
	}



}
