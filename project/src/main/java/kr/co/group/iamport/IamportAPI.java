package kr.co.group.iamport;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class IamportAPI {

	@Value("${imp.api.key}")
	private String API_KEY;
	
	@Value("${imp.api.secretkey}")
	private String SECRET_KEY;
	
	public IamportAPI() {}
	
	public String getApiKey() {
		return API_KEY;
	} // getApiKey() ends 
	
	public String getApiSecret() {
		return SECRET_KEY;
	} // getApiSecret() ends 
}
