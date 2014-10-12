package cn.wangan.service;

import cn.wangan.domain.PageBean;
import cn.wangan.domain.Patent;

public interface PatentService {

	PageBean getPageBean(int pageNum);

	void save(Patent patent);

	Patent findById(Long id);

	void update(Patent patent);

	void delete(Long id);
	/**
	 * 查找功能
	 * @param pageNum
	 * @param searchContent
	 * @return
	 */
	PageBean searchContent(int pageNum, String searchContent);

}
