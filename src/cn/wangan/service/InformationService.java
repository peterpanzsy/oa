package cn.wangan.service;

import java.io.File;
import java.util.List;

import cn.wangan.domain.Information;
import cn.wangan.domain.PageBean;

public interface InformationService {

	List<Information> findTopInfo();

	Information findById(Long id);

	void save(Information info);

	void save(Information info, File[] attachment,
			String[] attachmentContentType, String[] attachmentFileName);

	List<Information> findAll();

	void delete(Long id);

	void update(Information info);

	PageBean getPageBean(int pageNum);

}
