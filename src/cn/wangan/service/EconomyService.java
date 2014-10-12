package cn.wangan.service;

import java.util.List;

import cn.wangan.domain.Economy;
import cn.wangan.domain.PageBean;

public interface EconomyService {

	List<Economy> findTopInfo();

	Economy findById(Long id);

	PageBean getPageBean(int pageNum);

	void save(Economy eco);

	void update(Economy eco);

	void delete(Long id);

}
