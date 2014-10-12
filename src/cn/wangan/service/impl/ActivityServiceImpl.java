package cn.wangan.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.ActivityDao;
import cn.wangan.dao.InfoDao;
import cn.wangan.domain.Activity;
import cn.wangan.domain.UploadFiles;
import cn.wangan.service.ActivityService;
import cn.wangan.service.UploadFilesService;

@Service("activityService")
@Transactional
public class ActivityServiceImpl implements ActivityService {
	//private UploadFilesService fileService;
	@Resource
	private ActivityDao activityDao;

	public List<Activity> findActivity() {
		return activityDao.findActivity();
	}

	public Activity findById(long id) {
		return activityDao.getById(id);
	}

	public void save(Activity activity) {
		activityDao.save(activity);
	}

	public void delete(Long id) {
		activityDao.delete(id);
		
	}

	public void update(Activity activity) {
		activityDao.update(activity);
		
	}

	public List<Activity> findAll() {
		return activityDao.findAll();
	}
	
}