package cn.wangan.service;

import java.util.List;

import cn.wangan.domain.Book;
import cn.wangan.domain.PageBean;

public interface BookService {

	List<Book> findAll();

	List<Book> findTopbook();

	void save(Book book);

	void delete(Long id);
	/**
	 * 查询分页的数据
	 * @param pageNum
	 * @return
	 */
	PageBean getPageBean(int pageNum);

	Book findById(Long id);

	void update(Book book);
	/**
	 * 根据输入的内容来查找图书信息
	 * @param pageNum 页码
	 * @param searchContent 查询的内容
	 * @return PageBean 每页显示10条
	 */
	PageBean searchContent(int pageNum, String searchContent);

}
