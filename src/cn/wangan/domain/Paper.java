package cn.wangan.domain;

import java.util.Set;

public class Paper {
	private Long id;
	
	//论文名称
	private String name;
	//主题（关键字）
	private String theme;
	//摘要
	private String summary;
	//论文类型 国内期刊\国外期刊
	private String type;
	//论文状态,2种状态 审核中，已发表
	private String state;
	
	/*与出版社有关的信息*/
	//出版物名称
	private String magazineName;
	//出版时间(只记录年份就可以了)
	private String publishTime;
//	//期刊的ISSN(XXXX-XXXX)
//	private String ISSN;
	//备注
	private String description;
	//期
	private int qi;
	//卷
	private int juan;
	//页码
	private  String pagination;
	//SCI索引号
	private String SCIIndex;
	//EI索引号
	private String EIIndex;
	//是否国内重要期刊0-不是；1-是
	private int homeImportantArticle;
	//是否国内核心期刊0-不是；1-是
	private int homeCoreArtile;
	//SCI引用次数
	private int SCIQuote;
	//EI引用次数
	private int EIQuote;
	
	//作者
	private Set<User> authors;
	//所属项目
	private Program program;
	//论文内容
	private UploadFiles file;
	
	//*(临时)用户名称
	private String username;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getMagazineName() {
		return magazineName;
	}
	public void setMagazineName(String magazineName) {
		this.magazineName = magazineName;
	}
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}

	public Set<User> getAuthors() {
		return authors;
	}
	public void setAuthors(Set<User> authors) {
		this.authors = authors;
	}
	public Program getProgram() {
		return program;
	}
	public void setProgram(Program program) {
		this.program = program;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public UploadFiles getFile() {
		return file;
	}
	public void setFile(UploadFiles file) {
		this.file = file;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getQi() {
		return qi;
	}
	public void setQi(int qi) {
		this.qi = qi;
	}
	public int getJuan() {
		return juan;
	}
	public void setJuan(int juan) {
		this.juan = juan;
	}
	public String getPagination() {
		return pagination;
	}
	public void setPagination(String pagination) {
		this.pagination = pagination;
	}
	public String getSCIIndex() {
		return SCIIndex;
	}
	public void setSCIIndex(String sCIIndex) {
		SCIIndex = sCIIndex;
	}
	public String getEIIndex() {
		return EIIndex;
	}
	public void setEIIndex(String eIIndex) {
		EIIndex = eIIndex;
	}
	public int getHomeImportantArticle() {
		return homeImportantArticle;
	}
	public void setHomeImportantArticle(int homeImportantArticle) {
		this.homeImportantArticle = homeImportantArticle;
	}
	public int getHomeCoreArtile() {
		return homeCoreArtile;
	}
	public void setHomeCoreArtile(int homeCoreArtile) {
		this.homeCoreArtile = homeCoreArtile;
	}
	public int getSCIQuote() {
		return SCIQuote;
	}
	public void setSCIQuote(int sCIQuote) {
		SCIQuote = sCIQuote;
	}
	public int getEIQuote() {
		return EIQuote;
	}
	public void setEIQuote(int eIQuote) {
		EIQuote = eIQuote;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}
