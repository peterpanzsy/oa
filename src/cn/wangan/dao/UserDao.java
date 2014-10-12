package cn.wangan.dao;

import java.util.List;

import cn.wangan.base.BaseDao;
import cn.wangan.domain.User;
/**
 * User对象与数据库操作的接口
 * @author wpr
 *
 */
public interface UserDao extends BaseDao<User>{
	/**
	 * 根据用户名来查找相关的User对象
	 * @param name
	 * @return
	 */
	List<User> findByName(String name);
	/**
	 * 根据用户名和密码来查找是否存在该用户
	 * @param loginName
	 * @param password
	 * @return
	 */
	User findByLoginNameAndPassword(String loginName, String password);
	
	User getUserByName(String u);
	/**
	 * 根据year来查询数据库，返回List
	 * @param year
	 * @return
	 */
	List<User> findByYear(String year);

}
