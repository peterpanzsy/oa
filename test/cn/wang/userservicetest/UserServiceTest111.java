package cn.wang.userservicetest;

import javax.annotation.Resource;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import cn.wangan.dao.UserDao;
import cn.wangan.dao.impl.UserDaoImpl;
import cn.wangan.domain.User;
import cn.wangan.service.UserService;


@Service
public class UserServiceTest111 {
	@Resource
	private UserDao userDao;
	@Test
	public void findUserTopPrivilege(){
		System.out.println(userDao);
		User user = userDao.getById(23L);
		Assert.assertEquals(user, null);
	}
}
