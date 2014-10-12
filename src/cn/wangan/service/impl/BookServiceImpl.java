package cn.wangan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.ActionContext;

import cn.wangan.dao.BookDao;
import cn.wangan.domain.Book;
import cn.wangan.domain.PageBean;
import cn.wangan.service.BookService;
@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService{
	@Resource
	private BookDao bookDao;

	public List<Book> findAll() {
		return bookDao.findAll();
	}

	public List<Book> findTopbook() {
		 return bookDao.findTopbook();
	}

	public void save(Book book) {
		bookDao.save(book);
	}

	public void delete(Long id) {
		bookDao.delete(id);
	}

	public PageBean getPageBean(int pageNum) {
		//每页显示的数据
		int pageSize = 12;
		//查询总记录数
		Long count = bookDao.getTotalCount();
		//得到当前页面的数据
		List list = bookDao.getCurrentPageList(pageNum,pageSize);
		
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}

	public Book findById(Long id) {
		
		return bookDao.getById(id);
	}

	public void update(Book book) {
		bookDao.update(book);
	}

	public PageBean searchContent(int pageNum, String searchContent) {
		//判断searchContent是否为null
		if(searchContent==null){
			//如果为null,返回null,跳转到提示页面
			return null;
		}else{
			//如果不为null,封装PageBean对象
			//每页显示的数据
			int pageSize = 12;
			//查询总记录数,查找name属性或者作者属性
			Long count = bookDao.getSearchTotalCount(searchContent);
			//得到当前页面的数据
			List list = bookDao.getSearchCurrentPageList(searchContent,pageNum,pageSize);
			if(list!=null&&list.size()>0){
				
				return new PageBean(pageNum,pageSize,count.intValue(),list);
			}else{
				return null;
			}
		}
	}
}
