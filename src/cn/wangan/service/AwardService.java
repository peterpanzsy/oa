package cn.wangan.service;

import java.util.List;

import cn.wangan.domain.Award;
import cn.wangan.domain.PageBean;

public interface AwardService {

	List<Award> findAll();

	PageBean getPageBean(int pageNum);

	void save(Award award);

	void delete(Long id);

	PageBean searchContent(int pageNum, String searchContent);

	Award findById(Long id);

	void update(Award award);

}
