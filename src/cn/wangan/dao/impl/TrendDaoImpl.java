package cn.wangan.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.TrendDao;
import cn.wangan.domain.Trend;
@Repository("trendDao")
public class TrendDaoImpl extends BaseDaoImpl<Trend> implements TrendDao {

}
