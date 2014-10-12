package cn.wangan.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.Book;
import cn.wangan.domain.PageBean;
import cn.wangan.domain.Servers;
import cn.wangan.service.BookService;
import cn.wangan.service.ServersService;
import cn.wangan.utils.Logger2File;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class BookAction extends ActionSupport implements ModelDriven<Book> {
	@Resource
	private BookService bookService;
	private String searchContent;
	
	private static Logger logger = Logger.getLogger(BookAction.class);  
	// 模型封装
	private Book model = new Book();
	
	//用来返回JSON数据格式	
	private  Map map = new HashMap();
	
	//用来接受页面传来的当前页码数，默认第一页
	private int pageNum = 1 ;
	
	public Book getModel() {
		return model;
	}

	/** 列表 */
	public String list() throws Exception {
		//数据准备
		try {
			PageBean pageBean = bookService.getPageBean(pageNum);
			ActionContext.getContext().getValueStack().push(pageBean);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "list";
	}
	/*查询图书*/
	public String search(){
		//查询数据，同时进行分页
		System.out.println(searchContent);
		if(searchContent==null||"".equals(searchContent.trim())){
			return "input";
		}
		PageBean pageBean = bookService.searchContent(pageNum,searchContent);
		if(pageBean!=null){
			//说明找到了数据
			ActionContext.getContext().getValueStack().push(pageBean);
			ActionContext.getContext().getValueStack().push(searchContent);
			return "successSearch";
		}else{
			pageBean = new PageBean();
			ActionContext.getContext().getValueStack().push(pageBean);
			//说明没有找到数据，返回一句话，记录不存在
			return "successSearch";
		}
	}
	
	/** 删除 */
	public String delete() throws Exception {
		try {
			bookService.delete(model.getId());
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	/** 添加 */
	public String add() throws Exception {
		try {
			Book book = setBook(model);
			bookService.save(book);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	/** 修改页面 */
	public String editUI() throws Exception {

		try {
			Book book = bookService.findById(model.getId());
			map.put("book",book);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "editUI";
	}

	/** 修改 */
	public String edit() throws Exception {
		try {
			Book book = bookService.findById(model.getId());
			book.setName(model.getName());
			book.setAuthor(model.getAuthor());
			book.setBookcase(model.getBookcase());
			book.setPublish(model.getPublish());
			book.setTime(model.getTime());
			bookService.update(book);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "toList";
	}

	// Book类封装
	@SuppressWarnings("unused")
	private Book setBook(Book model) {
		try {
			Book book = new Book();
			book.setName(model.getName());
			book.setAuthor(model.getAuthor());
			book.setBookcase(model.getBookcase());
			book.setPublish(model.getPublish());
			book.setTime(model.getTime());
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return model;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public Map getMap() {
		return map;
	}

	public void setMap(Map map) {
		this.map = map;
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}
	
}
