package cn.wangan.utils;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.domain.Privilege;
import cn.wangan.domain.User;

/**
 * 完成初始化privileg的功能
 * 1.设置超级管理员
 * 2.初始化所有权限，一旦完成将不可变更
 * @author wpr
 *
 */
@Component("installer")
@Scope("prototype")
public class Installer {
	@Resource
	private SessionFactory sessionFactory;
	@Transactional
	public void install() {
		Session session = sessionFactory.getCurrentSession();

		// =======================================================================
		// 1，超级管理员
		User user = new User();
		user.setLoginName("admin");
		user.setName("超级管理员");
		user.setPassword(DigestUtils.md5Hex("admin")); // 密码要使用MD5摘要
		session.save(user); // 保存

		// =======================================================================
		// 2，权限数据
		Privilege  menu1, menu2,menu3,menu4, menu5,menu6,menu7,menu8,menu9, menu10;
		
		//============
		menu1 = new Privilege("个人科研管理", "/..", null);
		menu2 = new Privilege("项目管理", "program_show", null);
		
		session.save(menu1);
		session.save(menu2);
		
		session.save(new Privilege("个人信息", "..", menu1));
		session.save(new Privilege("岗位修改", "/..", menu1));

		session.save(new Privilege("项目列表", "/..", menu2));
		session.save(new Privilege("项目删除", "/..", menu2));
		session.save(new Privilege("项目添加", "/..", menu2));
		session.save(new Privilege("项目修改", "/..", menu2));
		
		//===================
		menu3 = new Privilege("岗位管理", "/role_list", null);
		menu4 = new Privilege("用户管理", "/user_list", null);

		session.save(menu3);
		session.save(menu4);

		session.save(new Privilege("岗位列表", "/role_list", menu3));
		session.save(new Privilege("岗位删除", "/role_delete", menu3));
		session.save(new Privilege("岗位添加", "/role_add", menu3));
		session.save(new Privilege("岗位修改", "/role_edit", menu3));

		session.save(new Privilege("用户列表", "/user_list", menu4));
		session.save(new Privilege("用户删除", "/user_delete", menu4));
		session.save(new Privilege("用户添加", "/user_add", menu4));
		session.save(new Privilege("用户修改", "/user_edit", menu4));
		
	
		
		//======================		
		menu5 = new Privilege("财务管理", "economy_list", null);
		menu6 = new Privilege("活动管理", "activity_admin", null);
		
		session.save(menu6);
		session.save(menu5);
		
		session.save(new Privilege("财务列表", "/..", menu5));
		session.save(new Privilege("财务删除", "/..", menu5));
		session.save(new Privilege("财务添加", "/..", menu5));
		session.save(new Privilege("财务修改", "/..", menu5));

		session.save(new Privilege("活动列表", "/..", menu6));
		session.save(new Privilege("活动删除", "/..", menu6));
		session.save(new Privilege("活动添加", "/..", menu6));
		session.save(new Privilege("活动修改", "/..", menu6));
		
		//===========
		menu7 = new Privilege("服务器管理", "servers_list", null);
//			
		session.save(menu7);
//		
//		session.save(new Privilege("活动列表", "/..", menu7));
//		session.save(new Privilege("活动删除", "/..", menu7));
//		session.save(new Privilege("活动添加", "/..", menu7));
//		session.save(new Privilege("活动修改", "/..", menu7));
//		
		//===========
		menu8 = new Privilege("图书管理", "book_list", null);
			
		session.save(menu8);
		
		session.save(new Privilege("图书列表", "/book_list", menu8));
		session.save(new Privilege("图书删除", "/book_delete", menu8));
		session.save(new Privilege("图书添加", "/book_add", menu8));
		session.save(new Privilege("图书修改", "/book_edit", menu8));
		//----------------------------------------
		menu9 = new Privilege("论文管理", "book_list", null);
		menu10 = new Privilege("专利管理", "book_list", null);
		session.save(menu9);
		session.save(menu10);
	}
}