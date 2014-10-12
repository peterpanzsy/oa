package cn.wangan.interceptors;

import java.util.Map;

import cn.wangan.domain.User;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthorityInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext actionContext = invocation.getInvocationContext();
		Map session = actionContext.getSession();
		User user = (User) session.get("user");
		//验证用户是否登录
		if(user!=null){
			//如果用户已经登录，那么放行
			return invocation.invoke();
		}else{
			return "loginout_loginUI";
		}
	}

}
