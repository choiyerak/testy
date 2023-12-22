package kr.co.group.utility;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator{
	
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
