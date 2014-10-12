package cn.wangan.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.UserDao;
import cn.wangan.domain.Role;
import cn.wangan.domain.User;
/**
 * User类与数据库操作的实现类（UserDao的实现类）
 * @author wpr
 *
 */
@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {
	@SuppressWarnings("unchecked")
	public List<User> findByName(String loginName) {
		String hql ="from User user where user.loginName = ?";
		List<User> userList = getSession().
				createQuery(hql).setString(0,loginName).
				list();
		return userList;
	}

	public User findByLoginNameAndPassword(String loginName, String password) {
		return (User) getSession().
				createQuery("From User user where user.loginName = ? and user.password = ?").
				setParameter(0, loginName).setParameter(1, password).uniqueResult();
	}

	public User getUserByName(String u) {
		return (User) getSession().
				createQuery("From User user where user.loginName = ? ").
				setParameter(0, u.trim()).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<User> findByYear(String year2) {
		int year =Integer.parseInt(year2);
		String hql ="from User user where user.recruitment = ? ";
		String hql2="from User user where user.recruitment < ? and user.ishere = 'yes'";
		List<User> userList = getSession().
				createQuery(hql).setInteger(0,year).
				list();
		userList.addAll(getSession().createQuery(hql2).setInteger(0, year).list());
		return userList;
	}

}
