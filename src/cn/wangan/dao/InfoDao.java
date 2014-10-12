package cn.wangan.dao;

import java.util.List;

import cn.wangan.base.BaseDao;
import cn.wangan.domain.Information;

public interface InfoDao extends BaseDao<Information>{

	List<Information> findTopInfo();

	Long getTotalCount();

	List getCurrentPageList(int pageNum, int pageSize);

}
