package cn.wangan.service;

import java.util.List;

import cn.wangan.domain.Privilege;
import cn.wangan.domain.User;
/**
 * UserService接口用于定义所有与UserAction相关的方法
 * @author wpr
 *
 */
public interface UserService {
	/**
	 * 查找到所有的用户
	 * @return
	 */
	List<User> findAll();
	/**
	 * 保存用户信息
	 * @param user
	 */
	void save(User user);
	/**
	 * 根据id值删除用户
	 * @param id
	 */
	void delete(Long id);
	/**
	 * 根据id值查找用户
	 * @param id
	 * @return
	 */
	User findById(Long id);
	/**
	 * 更新user对象
	 * @param user
	 */
	void update(User user);
	/**
	 * 判断用户名是否有重复
	 * @return如果存在，返回false;如果不存在，返回true
	 */
	public boolean findByName(User user);
	/**
	 * 验证用户名与密码，如果正确就返回这个用户，否则返回null
	 * 业务层将明文密码加密
	 * @param loginName
	 * @param password 明文密码
	 * @return
	 */	
	User findByLoginNameAndPassword(String loginName, String password);
	/**
	 * 根据用户得到他对应的顶级权限
	 * @return
	 */
	List<Privilege> findUserTopPrivilege(User user);
	/**
	 * 根据用户名得到用户信息，返回User
	 * @param u
	 * @return
	 */
	User getUserByName(String u);
	/**
	 * 根据用户输入的查询年份来查找相关的人
	 * 如果year为null，那么返回2014年的信息
	 * @param year
	 * @return
	 */
	List<User> findAllByYear(String year);

}
