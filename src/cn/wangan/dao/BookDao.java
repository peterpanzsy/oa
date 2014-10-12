package cn.wangan.dao;


import java.util.List;

import cn.wangan.base.BaseDao;
import cn.wangan.domain.Book;

public interface BookDao extends BaseDao<Book>{
	/**
	 * 返回首页所需要的图书信息 
	 * @return
	 */
	List<Book> findTopbook();
	/**
	 * 得到数据库中书的总记录数
	 * @return
	 */
	Long getTotalCount();
	/**
	 * 得到当前页面所需的book资料
	 * @return
	 */
	List getCurrentPageList(int pageNum,int pageSize);
	/**
	 * 根据查找内容，返回所有的信息条数
	 * @param searchContent 
	 * @return
	 */
	Long getSearchTotalCount(String searchContent);
	/**
	 * 根据查找内容，返回当前页所要展示的Book信息
	 * @param searchContent 
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	List getSearchCurrentPageList(String searchContent, int pageNum, int pageSize);

}
