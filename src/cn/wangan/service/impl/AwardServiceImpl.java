package cn.wangan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.AwardDao;
import cn.wangan.domain.Award;
import cn.wangan.domain.PageBean;
import cn.wangan.service.AwardService;

@Service("awardService")
@Transactional
public class AwardServiceImpl implements AwardService {
	@Resource
	private AwardDao awardDao;

	public List<Award> findAll() {
		return awardDao.findAll();
	}

	public PageBean getPageBean(int pageNum) {
		//每页显示的数据
		int pageSize = 12;
		//查询总记录数
		Long count = awardDao.getTotalCount();
		//得到当前页面的数据
		List list = awardDao.getCurrentPageList(pageNum,pageSize);
		
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}

	public void save(Award award) {
		awardDao.save(award);
	}

	public void delete(Long id) {
		awardDao.delete(id);
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
			System.out.println(searchContent);
			Long count = awardDao.getSearchTotalCount(searchContent);
			System.out.println(count);
			//得到当前页面的数据
			List list = awardDao.getSearchCurrentPageList(searchContent,pageNum,pageSize);
			if(list!=null && list.size()>0){
				System.out.println("-----------------");
				return new PageBean(pageNum,pageSize,count.intValue(),list);
			}else{
				return null;
			}
		}
	}

	public Award findById(Long id) {
		if(id!=null){
			return awardDao.getById(id);
		}else{
			return null;
		}
	}

	public void update(Award award) {
		awardDao.update(award);
	}
}
