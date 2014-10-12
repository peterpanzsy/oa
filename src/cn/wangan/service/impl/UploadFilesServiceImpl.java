package cn.wangan.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.FileDao;
import cn.wangan.domain.UploadFiles;
import cn.wangan.service.UploadFilesService;
@Service("fileService")
@Transactional
public class UploadFilesServiceImpl implements UploadFilesService {
	@Resource
	private FileDao fileDao;

	public void save(UploadFiles uf) {
		fileDao.save(uf);
	}

	public UploadFiles findById(Long id) {
		return fileDao.getById(id);
	}

	public List<UploadFiles> findAttachment(Long id) {
		if(id!=null){
			return fileDao.findInfoAttachment(id);
		}else{
			return null;
		}
	}

	public List<UploadFiles> findAttachmentForEco(Long id) {
		if(id!=null){
			return fileDao.findEcoAttachment(id);
		}else{
			return null;
		}
	}
}
