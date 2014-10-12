package cn.wangan.domain;

public class UploadFiles {  
    
	private Long id;
	
	private String uploadContentType;  
      
    private String uploadFileName;  
      
    private String uploadRealName;  
  
    public String getUploadContentType() {  
        return uploadContentType;  
    }  
  
    public void setUploadContentType(String uploadContentType) {  
        this.uploadContentType = uploadContentType;  
    }  
  
    public String getUploadFileName() {  
        return uploadFileName;  
    }  
  
    public void setUploadFileName(String uploadFileName) {  
        this.uploadFileName = uploadFileName;  
    }  
  
    public String getUploadRealName() {  
        return uploadRealName;  
    }  
  
    public void setUploadRealName(String uploadRealName) {  
        this.uploadRealName = uploadRealName;  
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}  
    
}  
