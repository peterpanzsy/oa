package cn.wangan.base;
import java.util.List;
/**
 * 定义基本的crup操作，用于其他接口继承
 * @author wpr
 *
 * @param <T>
 */
public interface BaseDao<T> {
	/**
	 * 保存实体
	 * @param entity
	 */
	void save(T entity);
	/**
	 * 根据id删除对象
	 * @param id
	 */
	void delete(Long id);
	/**
	 * 跟新对象
	 * @param entity
	 */
	void update(T entity);
	/**
	 * 根据id查找对象
	 * @param id
	 * @return
	 */
	T getById(Long id);
	/**
	 * 查找所有对象
	 * @return
	 */
	List<T> findAll();
	/**
	 * 根据Ids查找对象数组(主要用于多对多数据的反馈)
	 * @param ids
	 * @return1
	 */
	List<T> findByIds(Long[] ids);
	
}
