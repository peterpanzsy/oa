package test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.stereotype.Component;

import cn.wangan.dao.PaperDao;
import cn.wangan.domain.Paper;
@Component
public class PaperDaoTest {
	@Resource
	private PaperDao paperDao;
	@Test
	public void test(){
		System.out.println(paperDao);
		List list = paperDao.getSearchCurrentPageList("aaa",1, 10);
		for(Object o:list){
			Paper p = (Paper) o;
			System.out.println(p.getName());
		}
	}
}
