package cn.wangan.action;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.wangan.domain.UploadFiles;
import cn.wangan.domain.User;
import cn.wangan.service.UploadFilesService;
import cn.wangan.service.UserService;
import cn.wangan.utils.Logger2File;
import cn.wangan.utils.SecurityImage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 暂时被我改成获取用户图片的Action了，我不太清楚这个类究竟是干什么的
 * 最原始的版本内只有一个execute()方法
 * @author wpr
 *
 */
@Controller
@Scope("prototype")
public class MemberAction extends ActionSupport implements ServletResponseAware{

	@Resource
	private UserService userService;
	@Resource
	private UploadFilesService fileService;
	
	private static Logger logger = Logger.getLogger(MemberAction.class);  
	
	private File fileupload;
	private String attachmentUrl;
	private String fileRealName;
	private HttpServletResponse response;
	private String fileuploadFileName; // 上传来的文件的名字
	private String fileuploadContentType;
	
	// 图片流
	private ByteArrayInputStream imageStream;
	//得到头像的真实文件名
	private String imageUrl;
	//获得查找的年份
	private String year = "2014";
	
	private Map map = new HashMap();
	
	@Override
	public String execute() throws Exception {
		return "list";
	}
	
	
	@SuppressWarnings("unchecked")
	public String uploadFile() throws Exception {
		
		
		String targetDirectory = ServletActionContext.getServletContext()
				.getRealPath("/" + "files/");// 获得路径

		String extName = ""; // 保存文件拓展名
		String newFileName = UUID.randomUUID().toString()
				+ findExt(fileuploadFileName); // 保存的文件名称、使用UUID+后缀进行保存 ; //
												// 保存新的文件名

		// 前台去显示一些东西，输出流
		PrintWriter out = null;

		// 获取拓展名
		if (fileuploadFileName.lastIndexOf(".") >= 0) {
			extName = fileuploadFileName.substring(fileuploadFileName
					.lastIndexOf("."));
		}
		// 检查上传的是否是图片
		try {
			out = response.getWriter();
			if (checkIsImage(extName)) {
				File target = new File(targetDirectory, newFileName);
				FileUtils.copyFile(fileupload, target);// 上传至服务器的目录
				addFieldError("error", "文件上传失败，请重试");
				JSONObject map = new JSONObject();
				map.put("success",true);
			    map.put("fileuploadFileName", fileuploadFileName); 
			    map.put("newFileName", newFileName); 
			    map.put("fileuploadContentType", fileuploadContentType);
			    map.put("fileuploadFileName",fileuploadFileName);
			    out.println(map.toString());
			} else {
				//out.print("<font color='red'>上传的文件类型错误，请选择jpg,jpeg,png和gif格式的图片!</font>");
			}
			out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
			out.print("上传失败，出错啦!");
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "uploadFile";
	}

	
	
	public String search() throws Exception {
		List<User> memberList = userService.findAllByYear(year);
		ActionContext.getContext().put("memberList", memberList);
		ActionContext.getContext().put("year", year);
		return "searchsuccess";
	}
	
	public String showImage() {
		try {
			String targetDirectory = ServletActionContext.getServletContext()
					.getRealPath("/" + "files/");// 获得路径
			// 根据图片地址构造file对象
			imageUrl = targetDirectory + "\\" + imageUrl;
			File file = new File(imageUrl);
//			InputStream is = new FileInputStream(file);
			BufferedImage bi = ImageIO.read(file);
			imageStream = SecurityImage.convertImageToStream(bi);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		} catch (IOException e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return "success";
	}

	private int image_x;
	private int image_y;
	private int image_width;
	private int image_height;
	private String image_filePath;

	public String cutPicture() {
		try {
			UploadFiles uf = new UploadFiles();
			uf.setUploadContentType(fileuploadContentType);
			uf.setUploadFileName("头像");
			uf.setUploadRealName(image_filePath);
			fileService.save(uf);
			User user =(User) ActionContext.getContext().getSession().get("user");
			user.setPortrait(uf);
			userService.update(user);
			ActionContext.getContext().getSession().remove("user");
			ActionContext.getContext().getSession().put("user", user);
			
			String targetDirectory = ServletActionContext.getServletContext()
					.getRealPath("/" + "files/");// 获得路径
			// 根据图片地址构造file对象
			image_filePath = targetDirectory + "\\" + image_filePath;
			cutImage(image_filePath, image_x, image_y, image_width, image_height);
		} catch (Exception e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
		return null;
	}
	/***
	 * 图片切割
	 * 
	 * @param imagePath
	 *            原图地址
	 * @param x
	 *            目标切片坐标 x轴起点
	 * @param y
	 *            目标切片坐标 y轴起点
	 * @param w
	 *            目标切片 宽度
	 * @param h
	 *            目标切片 高度
	 */
	private void cutImage(String imagePath, int x, int y, int w, int h) {
		Image img;
		ImageFilter cropFilter;
		try {
			// 读取源图像
			BufferedImage bi = ImageIO.read(new File(imagePath));
			int srcWidth = bi.getWidth();// 原图宽度
			int srcHeight = bi.getHeight();// 原图高度
			// 若原图大小大于大于切片大小，则进行切割
			if (srcWidth >= w && srcHeight >= h) {
				Image image = bi.getScaledInstance(srcWidth, srcHeight,
						Image.SCALE_DEFAULT);
				// int x1=x*srcWidth/400;
				// int y1=y*srcHeight/270;
				// int w1=w*srcWidth/400;
				// int h1=h*srcHeight/270;
				int x1 = x;
				int y1 = y;
				int w1 = w;
				int h1 = h;

				cropFilter = new CropImageFilter(x1, y1, w1, h1);
				img = Toolkit.getDefaultToolkit().createImage(
						new FilteredImageSource(image.getSource(), cropFilter));
				BufferedImage tag = new BufferedImage(w1, h1,
						BufferedImage.TYPE_INT_BGR);
				Graphics g = tag.getGraphics();
				g.drawImage(img, 0, 0, null);
				ImageIO.write(tag, "JPEG",new File(imagePath));
				g.dispose();
			}
		} catch (IOException e) {
			 e.printStackTrace();
			 logger.error(Logger2File.getTrace(e)); //将异常输出到文件
		}
	}
	public int getImage_x() {
		return image_x;
	}


	public void setImage_x(int image_x) {
		this.image_x = image_x;
	}


	public int getImage_y() {
		return image_y;
	}


	public void setImage_y(int image_y) {
		this.image_y = image_y;
	}

	public int getImage_width() {
		return image_width;
	}


	public void setImage_width(int image_width) {
		this.image_width = image_width;
	}


	public int getImage_height() {
		return image_height;
	}


	public void setImage_height(int image_height) {
		this.image_height = image_height;
	}


	public String getImage_filePath() {
		return image_filePath;
	}


	public void setImage_filePath(String image_filePath) {
		this.image_filePath = image_filePath;
	}


	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	public File getFileupload() {
		return fileupload;
	}

	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getAttachmentUrl() {
		return attachmentUrl;
	}

	public void setAttachmentUrl(String attachmentUrl) {
		this.attachmentUrl = attachmentUrl;
	}

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
		this.response.setCharacterEncoding("utf-8");
	}

	public String getFileuploadFileName() {
		return fileuploadFileName;
	}

	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}

	public static String findExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}

	// 检查是否是图片格式
	public static boolean checkIsImage(String imgStr) {
		boolean flag = false;
		if (imgStr != null) {
			if (imgStr.equalsIgnoreCase(".gif")
					|| imgStr.equalsIgnoreCase(".jpg")
					|| imgStr.equalsIgnoreCase(".jpeg")
					|| imgStr.equalsIgnoreCase(".png")) {
				flag = true;
			}
		}
		return flag;
	}

	public ByteArrayInputStream getImageStream() {
		return imageStream;
	}

	public void setImageStream(ByteArrayInputStream imageStream) {
		this.imageStream = imageStream;
	}


	public Map getMap() {
		return map;
	}


	public void setMap(Map map) {
		this.map = map;
	}


	public String getFileuploadContentType() {
		return fileuploadContentType;
	}


	public void setFileuploadContentType(String fileuploadContentType) {
		this.fileuploadContentType = fileuploadContentType;
	}
	
}