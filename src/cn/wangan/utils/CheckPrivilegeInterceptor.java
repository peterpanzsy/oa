package cn.wangan.utils;


import cn.wangan.domain.Privilege;
import cn.wangan.domain.Role;
import cn.wangan.domain.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CheckPrivilegeInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		User user = (User) ActionContext.getContext().getSession().get("user");
		// b, 当前访问的URL
		String actionName = invocation.getProxy().getActionName();
		if(user.hasPrivilegeByName(actionName)){
			invocation.invoke();
		}else{
			return "error";
		}
		return null;
	}

}
