package privilege;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.wangan.utils.Installer;
import cn.wangan.utils.ResourceInstaller;

public class Installertest {
	@Test
	public void installerTest(){
		System.out.println("正在初始化数据...");

		// 一定要从Spring容器中取出对象
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		System.out.println(ac);
		Installer installer = (Installer) ac.getBean("installer");
		System.out.println(installer);
		// 执行安装
		installer.install();

		System.out.println("初始化数据完毕！");
	}
	@Test
	public void resourceInstaller(){
		System.out.println("正在初始化数据...");

		// 一定要从Spring容器中取出对象
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		ResourceInstaller ri =	(ResourceInstaller) ac.getBean("resourceInstaller");
		ri.install();
		System.out.println("初始化数据完毕！");
	}
	@Test
	public void economyInstaller(){
		System.out.println("正在初始化数据...");

		// 一定要从Spring容器中取出对象
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		ResourceInstaller ri =	(ResourceInstaller) ac.getBean("resourceInstaller");
		ri.economy_install();
		System.out.println("初始化数据完毕！");
	}
	@Test
	public void awardInstaller(){
		System.out.println("正在初始化数据...");

		// 一定要从Spring容器中取出对象
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		ResourceInstaller ri =	(ResourceInstaller) ac.getBean("resourceInstaller");
		ri.economy_install();
		System.out.println("初始化数据完毕！");
	}
}
