package kr.co.group.utility;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator{
<<<<<<< HEAD
	// 사용하고자 하는 메일서버(SMTP, POP3)에서 인증받은 계정 + 비번 등록
	
	private PasswordAuthentication pa;
	
	public MyAuthenticator() {	// 기본 생성자 default constructor
		pa = new PasswordAuthentication("soldesk@pretyimo.cafe24.com","soldesk6901");
	} // end
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
	
} // class end
=======
	
	private PasswordAuthentication pa;
	
	public MyAuthenticator() {
		 pa = new PasswordAuthentication("soldesk@pretyimo.cafe24.com", "soldesk6901");
	} // 생성자 ends 

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	} // getPasswordAuthentication() ends 

	@Override
	public String toString() {
		return "MyAuthenticator [pa=" + pa + "]";
	} // toString() ends 
}
>>>>>>> 59114d0c28a67bc88e76599c07e67d66141c0961
