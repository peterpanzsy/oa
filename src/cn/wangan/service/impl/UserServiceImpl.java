package cn.wangan.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.FileDao;
import cn.wangan.dao.PrivilegeDao;
import cn.wangan.dao.RoleDao;
import cn.wangan.dao.UserDao;
import cn.wangan.domain.Privilege;
import cn.wangan.domain.Role;
import cn.wangan.domain.UploadFiles;
import cn.wangan.domain.User;
import cn.wangan.service.UserService;
/**
 * Userservice接口的实现类
 * @author wpr
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	@Resource
	private PrivilegeDao privilegeDao;
	@Resource
	private FileDao fileDao;
	@Resource
	private RoleDao roleDao;
	
	public List<User> findAll() {
		return userDao.findAll();
	}

	public void save(User user) {
		
		UploadFiles uf = new UploadFiles();
		uf.setUploadContentType("jpg");
		uf.setUploadFileName("头像");
		uf.setUploadRealName("1.jpg");
		fileDao.save(uf);
		user.setPortrait(uf);
		Role role =null;
		for(Role r:roleDao.findByName("个人信息管理")){
			 role = (Role) r ;
		}
		Set<Role> roleSet = new HashSet<Role>();
		roleSet.add(role);
		user.setRoles(roleSet);
		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		userDao.save(user);
	}

	public void delete(Long id) {
		userDao.delete(id);
	}

	public User findById(Long id) {
		return userDao.getById(id);
	}

	public void update(User user) {
//		user.setPassword(DigestUtils.md5Hex(user.getPassword()));
		userDao.update(user);
	}
	/**
	 * 判断用户名是否有重复
	 * @return如果存在，返回false;如果不存在，返回true
	 */
	public boolean findByName(User user){
		//根据user.name从数据库查找user对象
		List<User> userList = userDao.findByName(user.getLoginName());
		//如果存在，返回false
		if(userList==null||userList.size()==0){
			return false;
		}
		return true;
	}

	public User findByLoginNameAndPassword(String loginName, String password) {
		//将密码进行MD5加密
		password = DigestUtils.md5Hex(password);
		return userDao.findByLoginNameAndPassword(loginName,password);
	}

	public List<Privilege> findUserTopPrivilege(User user) {
		Set<Privilege> topPrivilege = new HashSet<Privilege>();
		//得到User对应的角色列表
		List<Role> roleList = new ArrayList<Role>(user.getRoles());
		for(Role role:roleList){
			//找到每一个role对应的顶级权限，并发到Set集合中
			for(Privilege p:role.getPrivileges()){
				if(p.getParent()==null){
					topPrivilege.add(p);
				}
			}
		}
		return new ArrayList<Privilege>(topPrivilege);
	}

	public User getUserByName(String u) {
		return userDao.getUserByName(u);
	}

	public List<User> findAllByYear(String year) {
		if(year==null ||"".equals(year) ){
			year = "2014";
		}
		return userDao.findByYear(year);
	}
}
