package cn.wangan.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class NotFoundAction extends ActionSupport{
	  private static final long serialVersionUID = 6218614965524501080L;  
	   
	  public String execute() throws Exception {  
	        return SUCCESS;  
	    }  
}
