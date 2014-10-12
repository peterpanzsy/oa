package cn.wangan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.PatentDao;
import cn.wangan.domain.PageBean;
import cn.wangan.domain.Patent;
import cn.wangan.service.PatentService;
@Service("patentService")
@Transactional
public class PatentServiceImpl implements PatentService {
	@Resource
	private PatentDao  patentDao;

	public PageBean getPageBean(int pageNum) {
		//每页显示的数据
		int pageSize = 12;
		//查询总记录数
		Long count = patentDao.getTotalCount();
		//得到当前页面的数据
		List list = patentDao.getCurrentPageList(pageNum,pageSize);
		
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}

	public void save(Patent patent) {
		patentDao.save(patent);
	}

	public Patent findById(Long id) {
		return patentDao.getById(id);
	}

	public void update(Patent patent) {
		patentDao.update(patent);
	}

	public void delete(Long id) {
		patentDao.delete(id);
	}

	public PageBean searchContent(int pageNum, String searchContent) {
		if(searchContent==null){
			//如果为null,返回null,跳转到提示页面
			return null;
		}else{
			//如果不为null,封装PageBean对象
			//每页显示的数据
			int pageSize = 12;
			//查询总记录数,查找name属性或者作者属性
			Long count = patentDao.getSearchTotalCount(searchContent);
			System.out.println(count);
			//得到当前页面的数据
			List list = patentDao.getSearchCurrentPageList(searchContent,pageNum,pageSize);
			System.out.println(list.size());
			if(list!=null&&list.size()>0){
				return new PageBean(pageNum,pageSize,count.intValue(),list);
			}else{
				return null;
			}
		}
	}
}
