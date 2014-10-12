package cn.wangan.base;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
/**
 * 为其他的Dao实现类提供统一方法，减少重复代码
 * BaseDao的实现类
 * @author wpr
 * @param <T> 泛型用来传递具体的类型
 */
@SuppressWarnings("unchecked")
public class BaseDaoImpl<T> implements BaseDao<T>{
	
	@Resource
	protected SessionFactory sessionFactory;
	/**通过子类传递T，使得这个类实例化子类*/
	protected Class<T> clazz=null;

	public BaseDaoImpl() {
		// 通过反射获取T的真是类型
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		this.clazz = (Class<T>) pt.getActualTypeArguments()[0];
//		System.out.println(sessionFactory);
//		System.out.println("---> clazz = " + clazz);
	}

	/**
	 * 得到Session对象，这样写的话子类也可以调用，
	 * 在完成子类特有的方法时，直接调用即可
	 * @return
	 */
	protected Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void save(T entity) {
		getSession().save(entity);
	}
	/**
	 * 删除相关的数据
	 * 如果id为空，直接返回
	 * 如果不为空，从数据库中删除
	 */
	public void delete(Long id) {
		if(id==null){
			return;
		}else{
			Object obj = getById(id);
			if(obj!=null){
				getSession().delete(obj);
			}
		}
	}
	/**
	 * 更新数据库中的实体对象
	 */
	public void update(T entity) {
		getSession().update(entity);
	}
	
	public T getById(Long id) {
		if(id==null){
			return null;
		}
		return (T) getSession().get(clazz, id);
	}

	public List<T> findAll() {
		return getSession().createQuery("FROM "+clazz.getSimpleName()).list();
	}

	public List<T> findByIds(Long[] ids) {
		if(ids==null||ids.length==0){
			return null;
		}
		return getSession().createQuery(
				"FROM "+clazz.getSimpleName()+" WHERE id in (:ids)")
				.setParameterList("ids", ids)
				.list();
	}


}
