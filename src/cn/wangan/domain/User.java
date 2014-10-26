package cn.wangan.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;



/**
 * 用户类
 * @author wpr
 *
 */
public class User {


	private Long id;
	private String loginName;//登录名，唯一
	private String name;//真实姓名
	private String password;//密码,MD5加密
	private String gender;//性别 男 or女
	private String phone;//手机号码
	private String birthday; //生日
	private String education; //学历
	private String email;//邮箱
	private int recruitment = 2014;//起始工作日期
	private Set<Paper> papers=new HashSet<Paper>();//论文
	private Set<Patent> patents=new HashSet<Patent>();//专利
	private Set<Program> programs=new HashSet<Program>();//参与过的项目
	private String resume;//各种经历
	private String major;//专业
	private String contactor;//紧急联系人
	private String ephone;//紧急联系电话
	private String graduation;//毕业后去向
	private String ishere;//是否仍在网安
	private Set<Role> roles = new HashSet<Role>();  //表示该用户所在的岗位
	private UploadFiles portrait = null;
	
	//社交账号
	private String QQaccount;
	private String YYaccount;
	private String Skypeaccount;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getRecruitment() {
		return recruitment;
	}

	public void setRecruitment(int recruitment) {
		this.recruitment = recruitment;
	}

	public String getIshere() {
		return ishere;
	}

	public void setIshere(String ishere) {
		this.ishere = ishere;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getContactor() {
		return contactor;
	}

	public void setContactor(String contactor) {
		this.contactor = contactor;
	}

	public String getEphone() {
		return ephone;
	}

	public void setEphone(String ephone) {
		this.ephone = ephone;
	}

	public String getGraduation() {
		return graduation;
	}

	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}

	public Set<Paper> getPapers() {
		return papers;
	}

	public void setPapers(Set<Paper> papers) {
		this.papers = papers;
	}

	public Set<Patent> getPatents() {
		return patents;
	}

	public void setPatents(Set<Patent> patents) {
		this.patents = patents;
	}

	public Set<Program> getPrograms() {
		return programs;
	}

	public void setPrograms(Set<Program> programs) {
		this.programs = programs;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public UploadFiles getPortrait() {
		return portrait;
	}

	public void setPortrait(UploadFiles portrait) {
		this.portrait = portrait;
	}

	public String getQQaccount() {
		return QQaccount;
	}

	public void setQQaccount(String qQaccount) {
		QQaccount = qQaccount;
	}

	public String getYYaccount() {
		return YYaccount;
	}

	public void setYYaccount(String yYaccount) {
		YYaccount = yYaccount;
	}

	public String getSkypeaccount() {
		return Skypeaccount;
	}

	public void setSkypeaccount(String skypeaccount) {
		Skypeaccount = skypeaccount;
	}

	public boolean hasPrivilegeByName(String privURL) {
		if (isAdmin()) {
			return true;
		}
		Collection<String> allPrivilegeUrls = new ArrayList<String>();
		allPrivilegeUrls.add("program_show");
		allPrivilegeUrls.add("role_list");
		allPrivilegeUrls.add("user_manager");
		allPrivilegeUrls.add("activity_admin");
		allPrivilegeUrls.add("economy_list");
		allPrivilegeUrls.add("book_list");
		allPrivilegeUrls.add("info_list");
		allPrivilegeUrls.add("server_manager");
		allPrivilegeUrls.add("paper_list");
		allPrivilegeUrls.add("patent_list");
		allPrivilegeUrls.add("award_list1");
		allPrivilegeUrls.add("user_person");
		if (!allPrivilegeUrls.contains(privURL)) {
			return true;
		}// b, 如果这个URL是需要控制的功能（登录后还得有对应的权限才能使用的），这是应判断权限
		else {
			String tempURL = privURL.split("_")[0];
			System.out.println(tempURL);
			for (Role role : roles) {
				for (Privilege p : role.getPrivileges()) {
					if(!tempURL.equals("user")){
						if (tempURL.equals(p.getUrl().split("_")[0])) {
							return true;
						}
					}else if(privURL.equals("user_person")){
						return true;
					}else if("user_manager".equals(p.getUrl())){
						return true;
					}
				}
			}
			return false;
		}
	}
	public boolean isAdmin() {
		return "admin".equals(loginName);
	}
}
