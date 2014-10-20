package cn.wangan.dao;

import java.util.List;

import cn.wangan.base.BaseDao;
import cn.wangan.domain.Program;
import cn.wangan.domain.UploadFiles;
import cn.wangan.domain.User;

public interface ProgramDao extends BaseDao<Program>{

	Long getTotalCount();

	List getCurrentPageList(int pageNum, int pageSize);
	/**
	 * 根据项目的名称来查找Program
	 * @param programName
	 * @return 
	 */
	Program findByName(String programName);

}
