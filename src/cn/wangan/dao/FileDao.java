package cn.wangan.dao;

import java.util.List;

import cn.wangan.base.BaseDao;
import cn.wangan.domain.UploadFiles;

public interface FileDao extends BaseDao<UploadFiles>{

	List<UploadFiles> findInfoAttachment(Long id);

	List<UploadFiles> findEcoAttachment(Long id);

}
