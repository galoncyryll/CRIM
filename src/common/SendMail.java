package common;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMail {
	
	protected static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(SendMail.class);

	private String path;
	private EncryptedProperties configFile;
	private String userid = "eteeap.phil@gmail.com";
	private String host;
	private String port;
	private String password = "1a0b1c6d";
	private String[] recipient;
	private String filedir;
	
	public SendMail(String host, String username, 
			String password, String port, String recipient){
		this.userid = new String(StringUtil.base64Decode(username));
		this.password = new String(StringUtil.base64Decode(password));
		this.host = new String(StringUtil.base64Decode(host));
		this.port = new String(StringUtil.base64Decode(port));
		this.recipient = new String(StringUtil.base64Decode(recipient)).split(",");
	}
	
	public SendMail(String host, String port, String recipient){
		this.host = host;
		this.port = port;
		this.recipient = recipient.split(",");
	}
	
	public SendMail() throws IOException{
		
		logger.info("Initialize Default Properties");
		
		try{
			configFile = new EncryptedProperties();
		} catch(Exception e){
			logger.error("EncryptedProperties receives Exception", e);
			Logger.LogServer(e);
			configFile = null;
		}

		path = Util.getWorkingDirectory() + "/config.properties";
		File f = new File(path);
		if(!f.exists()){
			try {
				f.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else{
			FileInputStream in = new FileInputStream(f);
			configFile.load(in);
		}
	
		try {
			
			this.userid = configFile.getProperty("email_user");
			this.password = configFile.getProperty("email_password");
			this.host = configFile.getProperty("email_host");
			this.port = configFile.getProperty("email_port");
			this.recipient = configFile.getProperty("email_recipient").split(",");
			//configFile.save(path);
			FileOutputStream out = new FileOutputStream(f);
			configFile.store(out, "Encrypted Properties File");
			out.close();
		
		} catch(Exception e){
			Logger.LogServer(e);
		}
	}
	
	static String getDate(){
		SimpleDateFormat f = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		return f.format(new Date()); 
	}
	
	public void sendMail(String message, String subject, String reportType){
		
		if((message == "") || (message.equals(""))){
			Logger.LogServer("SEND EMAIL: No Content to be send on Email. System will exit now. " + reportType);
		}
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.ssl.trust", host);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.user", userid);
		props.put("mail.smtp.password", password);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props,null);
		session.setDebug(false);
		MimeMessage mime = new MimeMessage(session);
		
		try{
			
			mime.setFrom(new InternetAddress(userid));
			mime.setSender(new InternetAddress(userid));
			InternetAddress[] toAddress = new InternetAddress[recipient.length];
			
			for(int i = 0; i < recipient.length; i++){
				toAddress[i] = new InternetAddress(recipient[i]);
			}
			
			for(int j = 0; j < toAddress.length; j++){
				mime.addRecipient(RecipientType.TO, toAddress[j]);
			}
			
			mime.setSubject(subject + " | " + getDate());
			mime.setText(message);
			
			Transport transport = session.getTransport("smtp");
			
			transport.connect(host, userid, password);
			transport.sendMessage(mime, mime.getAllRecipients());
			transport.close();
			
			Logger.LogServer(reportType + " | " + userid + " | " + message);
					
		} catch(MessagingException me){
			me.printStackTrace();
			Logger.LogServer(reportType + me);
		}
		
	}
	
	public boolean sendEmail(String message, String subject, String reportType){
		
		if((message == "") || (message.equals(""))){
			Logger.LogServer("SEND EMAIL: No Content to be send on Email. System will exit now. " + reportType);
			return false;
		}
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.ssl.trust", host);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.user", userid);
		props.put("mail.smtp.password", password);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		//props.put("mail.smtp.debug", "true");
		
		Session session = Session.getDefaultInstance(props,null);
		session.setDebug(false);
		MimeMessage mime = new MimeMessage(session);
		
		try{
			
			mime.setFrom(new InternetAddress(userid));
			mime.setSender(new InternetAddress(userid));
			InternetAddress[] toAddress = new InternetAddress[recipient.length];
			
			for(int i = 0; i < recipient.length; i++){
				toAddress[i] = new InternetAddress(recipient[i]);
			}
			
			for(int j = 0; j < toAddress.length; j++){
				mime.addRecipient(RecipientType.TO, toAddress[j]);
			}
			
			mime.setSubject(subject + " | " + getDate());
			mime.setText(message);
			
			Transport transport = session.getTransport("smtp");
			transport.connect(host, userid, password);
			transport.sendMessage(mime, mime.getAllRecipients());
			transport.close();
			
			Logger.LogServer(reportType + " | " + userid + " | " + message);
			
			return true;
			
		} catch(MessagingException me){
			me.printStackTrace();
			Logger.LogServer(reportType + me);
		}
		
		return false;
		
	}
	
	public boolean sendEmail(String message, String subject, String reportType, String Attachment){
		
		if((message == "") || (message.equals(""))){
			Logger.LogServer("SEND EMAIL: No Content to be send on Email. System will exit now. " + reportType);
			return false;
		}
		
		filedir = Util.getWorkingDirectory() + "/DATA/" + Attachment;
		Properties props = System.getProperties();
		
		props.put("mail.smtp.ssl.trust", host);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.user", userid);
		props.put("mail.smtp.password", password);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		//props.put("mail.smtp.debug", "true");
		
		Session session = Session.getDefaultInstance(props,null);
		session.setDebug(false);
		MimeMessage mime = new MimeMessage(session);
		BodyPart messageBody = new MimeBodyPart();
		Multipart multiPart = new MimeMultipart();
		
		try{
			
			mime.setFrom(new InternetAddress(userid));
			mime.setSender(new InternetAddress(userid));
			InternetAddress[] toAddress = new InternetAddress[recipient.length];
			
			for(int i = 0; i < recipient.length; i++){
				toAddress[i] = new InternetAddress(recipient[i]);
			}
			
			for(int j = 0; j < toAddress.length; j++){
				mime.addRecipient(RecipientType.TO, toAddress[j]);
			}
			
			mime.setSubject(subject + " | " + getDate());			
			messageBody.setText(message);
			multiPart.addBodyPart(messageBody);
			messageBody = new MimeBodyPart();

	        DataSource dtsource = new FileDataSource(filedir);
	        messageBody.setDataHandler(new DataHandler(dtsource));
	        messageBody.setFileName(filedir);
	        multiPart.addBodyPart(messageBody);

	        mime.setContent(multiPart);			
			
			Transport transport = session.getTransport("smtp");
			transport.connect(host, userid, password);
			transport.sendMessage(mime, mime.getAllRecipients());
			transport.close();
			
			Logger.LogServer(reportType + " | " + userid + " | " + message);
			
			return true;
			
		} catch(MessagingException me){
			me.printStackTrace();
			Logger.LogServer(reportType + me);
		}
		
		return false;
		
	}	

}
