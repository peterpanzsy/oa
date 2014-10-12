package SpringTest;


import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.wangan.domain.User;

public class TestSpring {
	ApplicationContext context = new ClassPathXmlApplicationContext("applicationcontext.xml");
	@Test
	public void createTable(){
		SessionFactory sf = (SessionFactory) context.getBean("sessionFactory");
		System.out.println("ok");
		sf.close();
	}
}
