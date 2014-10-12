package cn.wangan.dao;

import java.util.List;

import cn.wangan.base.BaseDao;
import cn.wangan.domain.Award;

public interface AwardDao extends BaseDao<Award>{

	Long getTotalCount();

	List getCurrentPageList(int pageNum, int pageSize);

	Long getSearchTotalCount(String searchContent);

	List getSearchCurrentPageList(String searchContent, int pageNum,
			int pageSize);

}
