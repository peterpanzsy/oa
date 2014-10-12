package cn.wangan.service;

import java.util.List;

import cn.wangan.domain.PageBean;
import cn.wangan.domain.Servers;

public interface ServersService {

	List<Servers> findAll();

	void delete(Long id);

	void save(Servers model);

	PageBean getPageBean(int pageNum);

	Servers findById(Long id);

	void update(Servers model);

	PageBean searchContent(int pageNum, String searchContent);

}
