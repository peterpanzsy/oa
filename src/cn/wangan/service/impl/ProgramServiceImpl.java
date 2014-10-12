package cn.wangan.service.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.wangan.dao.FileDao;
import cn.wangan.dao.ProgramDao;
import cn.wangan.dao.TrendDao;
import cn.wangan.domain.PageBean;
import cn.wangan.domain.Program;
import cn.wangan.domain.Trend;
import cn.wangan.domain.UploadFiles;
import cn.wangan.service.ProgramService;
import cn.wangan.service.UploadFilesService;
@Service("programService")
@Transactional
public class ProgramServiceImpl implements ProgramService {
	@Resource
	private ProgramDao programDao;
	@Resource 
	private TrendDao trendDao;
	@Resource 
	private FileDao fileDao;
	public void save(Program p) {
		Trend t = new Trend();
		t.setProgram(p);
		t.setContent(p.getName()+"建立了");
		t.setTime(new Date());
		p.setCurrentTrend(t);
		Set<Trend> trends = new HashSet<Trend>();
		trendDao.save(t);
		trends.add(t);
		p.setTrends(trends);
		programDao.save(p);
	}

	public List<Program> findAll() {
		return programDao.findAll();
	}

	public Program findById(Long id) {
		return programDao.getById(id);
	}
	/**
	 * 更新数据操作
	 * pro表示要更新的数据对象
	 * content是最近的动态日志内容
	 */
	public void update(Program pro, String content) {
		Trend currentTrend = new Trend();
		currentTrend.setContent(content);
		currentTrend.setTime(new Date());
		pro.getTrends().add(currentTrend);
		pro.setCurrentTrend(currentTrend);
		programDao.update(pro);
	}


	public void delete(Long id) {
		programDao.delete(id);
	}

	public void update(Program program,UploadFiles report) {
		Trend trend = new Trend();
		fileDao.save(report);
		trend.setContent(program.getName()+"结题了");
		trend.setProgram(program);
		trend.setTime(new Date());
		program.setCurrentTrend(trend);
		program.setReport(report);
		programDao.update(program);
	}

	public PageBean getPageBean(int pageSize,int pageNum) {

		//查询总记录数
		Long count = programDao.getTotalCount();
		//得到当前页面的数据
		List list = programDao.getCurrentPageList(pageNum,pageSize);
		
		return new PageBean(pageNum,pageSize,count.intValue(),list);
	}

	public Program findByName(String programName) {
		return programDao.findByName(programName);
	}

}
