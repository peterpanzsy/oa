package cn.wangan.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.jca.cci.core.InteractionCallback;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sun.misc.BASE64Encoder;

import cn.wangan.domain.MyEmail;
import cn.wangan.exception.EmailException;
import cn.wangan.service.MyEmailService;
import cn.wangan.utils.Logger2File;

@Service("myEmailService")
@Transactional
public class MyEmailServiceImpl implements MyEmailService {
	// 表示要发送的邮件
	private MyEmail myEmail =new MyEmail();
	private String[] realname;

	public Map<String,String> send(MyEmail model,String[] realName) throws UnsupportedEncodingException {
		Map<String,String> error = new HashMap<String, String>();
//		myEmail = model;
		this.realname = realName;
//		myEmail.setFromAddress(model.getFromAddress());
		myEmail.setToAddress(model.getToAddress());
//		myEmail.setUsername(model.getFromAddress());
//		myEmail.setPassword(model.getPassword());
		myEmail.setSubject(model.getSubject());
		myEmail.setContent(model.getContent());
		
		myEmail.setFilename(model.getFilename());
		try {
			error = sendToUser();
		}catch(Exception e) {
		   e.printStackTrace();
		   //logger.error(Logger2File.getTrace(e)); //将异常输出到文件
//			throw new EmailException(e);
		}
//		if (!init(myEmail.getUsername())) {
//			error.put("errormsg","邮箱不在服务范围内，请联系管理员");
//		}else{
//			System.out.println(myEmail.toString());
//			try {
//				error = sendToUser();
//			}catch(Exception e) {
//				throw new EmailException(e);
//			}
//		}
		return error;
	}

//	public boolean init(String username) {
//		if (username != null && username.length() > 0) {
//			String fromEmailExt = null;
//			fromEmailExt = username.substring(
//						username.lastIndexOf("@") + 1, username.lastIndexOf("."));
//			String temp = myEmail.getMailType().get(fromEmailExt);
//			if (temp != null) {
//				myEmail.setMailServerHost(myEmail.getMailType().get(fromEmailExt));
//				return true;
//			} else {
//				return false;
//			}
//		}
//		return false;
//	}
	
	/**
	 * Properties props = new Properties();//环境变量设置。发送邮件时才需要
		props.setProperty("mail.transport.protocol", "smtp");//发送使用的协议
		props.setProperty("mail.host", "smtp.163.com");//发送服务器的主机地址
		props.setProperty("mail.smtp.auth", "true");//请求身份验证
		Session session = Session.getDefaultInstance(props);
		MimeMessage message = new MimeMessage(session);//代表一封邮件
		
		message.setFrom(new InternetAddress("itheimacloud@163.com"));//设置发件人
		message.setRecipients(Message.RecipientType.TO, "itheima14@163.com");//设置收件人
		message.setSubject("这是JavaMail发出的第一封邮件");//设置主体
		
		//设置邮件的正文内容
		message.setText("嘿嘿！JavaMail发送的邮件哦");
		message.saveChanges();
		//发送邮件
		Transport ts = session.getTransport();//得到火箭
		ts.connect("itheimacloud","iamsorry");//连接
		ts.sendMessage(message, message.getAllRecipients());
		
		ts.close();
	 */
	/**
	 * 发送邮件的主体
	 */
	 @SuppressWarnings("null")
	private Map<String,String> sendToUser(){
		 //用来存放错误信息，如果error不空则说明存在错误，发送不成功
		 Map<String,String> error = new HashMap<String, String>();
		 String errormsg = null;//用来存放错误信息
		 Properties props = new Properties();//环境变量设置。发送邮件时才需要
			props.setProperty("mail.transport.protocol", "smtp");//发送使用的协议
			props.setProperty("mail.host","smtp.163.com");//发送服务器的主机地址
//			props.setProperty("mail.host",myEmail.getMailServerHost());//发送服务器的主机地址
			props.setProperty("mail.smtp.auth", "true");//请求身份验证
			//开启会话
			Session session = Session.getDefaultInstance(props);;
//			session.setDebug(true);
			/**
			 *
				// Create the message part  
				BodyPart messageBodyPart = new MimeBodyPart(); 
				// Fill the message 
			
				// Part two is attachment 
				messageBodyPart = new MimeBodyPart(); 
				DataSource source = new FileDataSource(filename); 
				messageBodyPart.setDataHandler(new DataHandler(source)); 
				messageBodyPart.setFileName(filename); 
				multipart.addBodyPart(messageBodyPart); 
				// Put parts in message 
				message.setContent(multipart); 
				// Send the message 
				Transport.send(message); 

			 */
			//设置邮件内容
			MimeMessage message = new MimeMessage(session);//代表一封邮件

			try {
				//设置收件人地址
				InternetAddress[] address = null;
				 try {
					String[] temp = null;
					 temp = myEmail.getToAddress().split(";");
					 address = new InternetAddress[temp.length];
					 for(int i=0;i<temp.length;i++){
						 	address[i] = new InternetAddress(temp[i]);				
						};
				} catch (AddressException e1) {
					error.put("errormsg","请输入正确的收件人地址，多个地址之间用,隔开");
				}
				
				message.setFrom(new InternetAddress("wanganOA@163.com"));//设置发件人
				message.setRecipients(Message.RecipientType.TO, address);//设置收件人
				message.setSubject(myEmail.getSubject());//设置主体
				//设置邮件的内容
				//设置消息体
				BodyPart messageBodyPart = new MimeBodyPart(); 
				
				messageBodyPart.setText(myEmail.getContent()); 
				//整合
				Multipart multipart = new MimeMultipart(); 
				multipart.addBodyPart(messageBodyPart); 
				//和附件联系在一起
				
				if(myEmail.getFilename()!=null){
					String[] path =myEmail.getFilename().split(",");
					for(int i=0;i<path.length;i++){
						messageBodyPart = new MimeBodyPart(); 
						DataSource source = new FileDataSource(path[i]); 
						messageBodyPart.setDataHandler(new DataHandler(source)); 
						messageBodyPart.setFileName(MimeUtility.encodeText(realname[i])); 
						multipart.addBodyPart(messageBodyPart);
					}
				}
//				message.setContent(multipart,"text/html;charset=utf-8"); 
				message.setContent(multipart, "text/plain"); 
				message.saveChanges();
			} catch (AddressException e) {
				errormsg = "邮箱地址不正确，请查证";
//				throw new EmailException(e);
			} catch (MessagingException e) {
				errormsg = "邮件发送失败！错误原因：\n"+e.getMessage();
//				throw new EmailException(e);
			} catch (UnsupportedEncodingException e) {
				errormsg = "文件编码不正确\n"+e.getMessage();
//				throw new EmailException(e);
			} 

			//发送邮件
			Transport ts = null;
			
			try {
				//发送邮件
				ts = session.getTransport();//得到火箭
				ts.connect("wanganoa@163.com","wangan1234");//连接
				ts.sendMessage(message, message.getAllRecipients());
			} catch (NoSuchProviderException e1) {
				errormsg = "邮件发送失败！错误原因：\n"+"身份验证错误!";
//				throw new EmailException(e1);
			} 
			catch (MessagingException e1) {
				errormsg = "邮件发送失败！错误原因：\n"+"邮箱服务器忙!";
			}
			finally{
				if(ts!=null){
					try {
						ts.close();
					} catch (MessagingException e) {
						System.out.println("ts关闭异常");
//						throw new EmailException(e);
					}
				}
				ts = null;
			}
			
			if(errormsg!=null){
				error.put("errormsg",errormsg);
			}
			return error;
			//另外一种发送邮件的方式
//			try {
//			session = Session.getDefaultInstance(props,new Authenticator() {
//				@Override
//				protected PasswordAuthentication getPasswordAuthentication() {
//					return new PasswordAuthentication(myEmail.getUsername(),myEmail.getPassword());
//				}
//			});
//		} catch (Exception e2) {
//			e2.printStackTrace();
//		}
//		try {
//		Transport.send(message);
//	} catch (MessagingException e) {
//		e.printStackTrace();
//	}
	 }
}
