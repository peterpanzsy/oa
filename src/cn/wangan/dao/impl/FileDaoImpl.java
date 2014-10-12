package cn.wangan.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.FileDao;
import cn.wangan.domain.UploadFiles;

@Repository("fileDao")
@SuppressWarnings("unchecked")
public class FileDaoImpl extends BaseDaoImpl<UploadFiles> implements FileDao {

	public List<UploadFiles> findInfoAttachment(Long id) {
		String sql ="select * from file where infoId = ?";
		return getSession().createSQLQuery(sql).addEntity(UploadFiles.class).setParameter(0, id).list();
	}

	public List<UploadFiles> findEcoAttachment(Long id) {
		String sql ="select * from file where ecoId = ?";
		return getSession().createSQLQuery(sql).addEntity(UploadFiles.class).setParameter(0, id).list();
	}


}
