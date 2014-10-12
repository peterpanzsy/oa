package cn.wangan.utils;

import java.util.Date;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.domain.Award;
import cn.wangan.domain.Book;
import cn.wangan.domain.Economy;
import cn.wangan.domain.Servers;

@Component("resourceInstaller")
@Scope("prototype")
public class ResourceInstaller {
	@Resource
	private SessionFactory sessionFactory;
	@Transactional
	public void install() {
		Session session = sessionFactory.getCurrentSession();
		for(int i=0;i<1000;i++){
			Book book = new Book();
			book.setName("java"+i);
			book.setBookcase("1号柜");
			book.setAuthor("aaa"+i);
			book.setPublish("xjtu"+i);
			book.setTime(new Date().toString());
			session.save(book);
		}
		for(int i=0;i<1000;i++){
			Servers s = new Servers();
			s.setAddress("aaa"+i);
			s.setIp(""+i+i+i+":"+i+i+":"+i);
			s.setSystem("win"+i);
			s.setPurpose("bbb"+i);
			s.setDescription("ccc"+i);
			s.setConfigure(""+i+"ddd");
			s.setUsername("eee"+i);
			session.save(s);
		}
		
	}
	@Transactional
	public void economy_install(){
		Session session = sessionFactory.getCurrentSession();
		for(int i=0;i<1000;i++){
			Economy eco = new Economy();
			eco.setTitle("这是一个财务报告"+i);
			eco.setContent("这是一个报告的内容"+i);
			eco.setDate(new Date());
			session.save(eco);
		}
	} 
	@Transactional
	public void award_install(){
		Session session = sessionFactory.getCurrentSession();
		for(int i=0;i<100;i++){
			Award a = new Award();
			a.setDate("2014-01-01");
			a.setGrade("国家级");
			a.setName(""+i+i+i+i+"");
			a.setResearchInterests(""+i+i+i+i+"");
			a.setProgramName(""+i+i+i+i+"");
			session.save(a);
		}
	} 
}
