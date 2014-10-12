package cn.wangan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.EconomyDao;
import cn.wangan.domain.Economy;
import cn.wangan.domain.PageBean;
import cn.wangan.service.EconomyService;
@Service("ecoService")
@Transactional
public class EconomyServiceImpl implements EconomyService {
	@Resource
	private EconomyDao ecoDao;

	public List<Economy> findTopInfo() {
		return ecoDao.findTopInfo();
	}

	public Economy findById(Long id) {
		return ecoDao.getById(id);
	}

	public PageBean getPageBean(int pageNum) {
		//每页显示的数据
		int pageSize = 12;
		//查询总记录数
		Long count = ecoDao.getTotalCount();
		//得到当前页面的数据
		List list = ecoDao.getCurrentPageList(pageNum,pageSize);
		
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}

	public void save(Economy eco) {
		ecoDao.save(eco);
	}

	public void update(Economy eco) {
		if(eco!=null){
			ecoDao.update(eco);
		}
	}

	public void delete(Long id) {
		if(id!=null){
			ecoDao.delete(id);
		}
	}
}
