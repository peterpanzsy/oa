package cn.wangan.dao;

import java.util.List;

import cn.wangan.base.BaseDao;
import cn.wangan.domain.Economy;

public interface EconomyDao extends BaseDao<Economy> {

	List<Economy> findTopInfo();

	Long getTotalCount();

	List getCurrentPageList(int pageNum, int pageSize);

}
