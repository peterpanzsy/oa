package cn.wangan.service;

import java.util.List;

import cn.wangan.domain.PageBean;
import cn.wangan.domain.Program;
import cn.wangan.domain.UploadFiles;
/**
 * 和项目有关的Service操作
 * @author z
 *
 */
public interface ProgramService {
	/**
	 * 把项目对象保存到数据库中
	 * @param p
	 */
	void save(Program p);

	List<Program> findAll();

	Program findById(Long id);

	void update(Program pro, String content);

	void delete(Long id);
	/**
	 * 更新项目，暂用于结题
	 * @param program
	 */
	void update(Program program,UploadFiles report);


	PageBean getPageBean(int pageSize, int pageNum);

	Program findByName(String programName);

}
