package cn.wangan.service;

import java.io.File;

import cn.wangan.domain.PageBean;
import cn.wangan.domain.Paper;
import cn.wangan.domain.UploadFiles;

public interface PaperService {

	PageBean getPageBean(int pageNum);
	/**
	 * 保存paper
	 * @param paper
	 * @param file
	 */
	void save(Paper paper, File upload, String uploadContentType,
			String uploadFileName);
	
	void delete(Long id);
	
	PageBean searchContent(int pageNum, String searchContent);
	
	Paper findById(Long id);
	
	void update(Paper paper);


}
