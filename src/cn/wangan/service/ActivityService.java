package cn.wangan.service;

import java.io.File;
import java.util.List;

import cn.wangan.domain.Activity;

public interface ActivityService {
		List<Activity> findActivity();
		
		Activity findById(long id);
		
		List<Activity> findAll();

		
		void save(Activity activity);
		
		void delete(Long id);

		void update(Activity activity);

}
