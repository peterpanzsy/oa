package cn.wangan.dao;

import java.util.List;

import cn.wangan.base.BaseDao;
import cn.wangan.domain.Patent;

public interface PatentDao extends BaseDao<Patent>{

	Long getTotalCount();

	List getCurrentPageList(int pageNum, int pageSize);

	Long getSearchTotalCount(String searchContent);

	List getSearchCurrentPageList(String searchContent, int pageNum,
			int pageSize);

}
