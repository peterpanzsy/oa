package cn.wangan.service;

import java.util.List;

import cn.wangan.domain.Role;
/**
 * roleService接口用于处理所有与RoleAction相关的方法
 * @author wpr
 */
public interface RoleService {
	/**
	 * 找到所有的Role对象并返回
	 * @return List<Role> 数据库中所有的Role对象
	 */
	List<Role> findAll();
	/**
	 * 根据roleId数组来查找相关的Role对象，主要用于数据回显
	 * @param roleId
	 * @return 如果roleId为null,那么就返回null;
	 * 如果不为null,返回List<Role>,表示User所 充当的Role对象集合
	 */
	List<Role> findByIds(Long[] roleId);
	/**
	 * 根据页面出入的id值，删除数据库中的记录
	 * @param id表示要删除的Role对象的id属性（唯一标示）
	 */
	void delete(Long id);
	/**
	 * 将从页面得到的数据封装为role对象，通过save()方法保存到数据库中
	 * @param role 封装好的javabean
	 */
	void save(Role role);
	/**
	 * 根据Role的主键id来查找role对象
	 * @param id唯一标识
	 * @return 如果存在返回Role;如果不存在，返回null
	 */
	Role findById(Long id);
	/**
	 * 对role进行update操作
	 * @param role
	 */
	void update(Role role);
	/**
	 * 判断用户名是否有重复
	 * @return如果存在，返回false;如果不存在，返回true
	 */
	public boolean findByName(Role role);

}
