package cn.wangan.service;

import java.util.List;

import cn.wangan.domain.UploadFiles;

public interface UploadFilesService {

	void save(UploadFiles uf);

	UploadFiles findById(Long id);

	List<UploadFiles> findAttachment(Long id);

	List<UploadFiles> findAttachmentForEco(Long id);
	
}
