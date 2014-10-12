package cn.wangan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.ServersDao;
import cn.wangan.domain.PageBean;
import cn.wangan.domain.Servers;
import cn.wangan.service.ServersService;
@Transactional
@Service("serversService")
public class ServersServiceImpl implements ServersService {
	@Resource
	private ServersDao serversDao;

	public List<Servers> findAll() {
		return serversDao.findAll();
	}

	public void delete(Long id) {
		serversDao.delete(id);
	}

	public void save(Servers model) {
		serversDao.save(model);
	}

	public PageBean getPageBean(int pageNum) {
		//每页显示的数据
		int pageSize = 12;
		//查询总记录数
		Long count = serversDao.getTotalCount();
		//得到当前页面的数据
		List list = serversDao.getCurrentPageList(pageNum,pageSize);
		
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}

	public Servers findById(Long id) {
		return serversDao.getById(id);
	}

	public void update(Servers model) {
		serversDao.update(model);
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
					Long count = serversDao.getSearchTotalCount(searchContent);
					//得到当前页面的数据
					List list = serversDao.getSearchCurrentPageList(searchContent,pageNum,pageSize);
					if(list!=null&&list.size()>0){
						return new PageBean(pageNum,pageSize,count.intValue(),list);
					}else{
						return null;
					}
				}
	}
}
