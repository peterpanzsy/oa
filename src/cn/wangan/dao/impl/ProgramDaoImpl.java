package cn.wangan.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.base.BaseDaoImpl;
import cn.wangan.dao.ProgramDao;
import cn.wangan.domain.Program;
import cn.wangan.domain.User;
@Repository("programDao")
@SuppressWarnings("unchecked")
@Transactional
public class ProgramDaoImpl extends BaseDaoImpl<Program> implements ProgramDao {

	public Long getTotalCount() {
		return  (Long) getSession().createQuery("SELECT COUNT(*) FROM Program").uniqueResult();
	}

	public List getCurrentPageList(int pageNum, int pageSize) {
		return getSession().createQuery("FROM Program p ORDER BY p.id DESC ")
				.setFirstResult((pageNum-1)*pageSize)
				.setMaxResults(pageSize).list();
	}

	public Program findByName(String programName) {
		return (Program) getSession().createQuery("FROM Program p Where p.name = ?").setParameter(0,programName).uniqueResult();
		
	}


}
