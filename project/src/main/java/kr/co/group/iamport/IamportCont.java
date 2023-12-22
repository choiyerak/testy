package kr.co.group.iamport;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class IamportCont {
	// 토큰 발급을 위해 아임포트에서 제공하는 rest  api 사용 (의존성 추가 필요)
	private IamportClient iamportClient;
	private final String iamportApiBaseUrl = "https://api.iamport.kr";
	
	@Value("${imp.api.key}")
	private String API_KEY;

	@Value("${imp.api.secretkey}")
	private String SECRET_KEY;
	
	@PostMapping("/user/getToken")
	public Map<String, Object> getToken(HttpServletRequest req) throws IOException{
		Map<String, Object> map = null;
		HttpsURLConnection conn = null;
		 
		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", API_KEY);
		json.addProperty("imp_secret", SECRET_KEY);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		map = new HashMap<>();
		
		String order_no = req.getParameter("order_no");
		int order_total = Integer.parseInt(req.getParameter("order_total"));
		
		map.put("order_no", order_no);
		map.put("order_total", order_total);
		map.put("token", token);
		
		return map;
	}
	
	/*
		public String getToken() {
		
			RestTemplate restTemplate = new RestTemplate();
		
			//서버로 요청할 Header
			HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.APPLICATION_JSON);
			
		    
		    Map<String, Object> map = new HashMap<>();
		    map.put("imp_key", API_KEY);
		    map.put("imp_secret", SECRET_KEY);
		    
		   
		    Gson var = new Gson();
		    String json=var.toJson(map);
			//서버로 요청할 Body
		   
		    HttpEntity<String> entity = new HttpEntity<>(json,headers);
			String token = restTemplate.postForObject("https://api.iamport.kr/users/getToken", entity, String.class);
		 
			System.out.println(token);
		
			
			return token ;
	}
	*/

	public String getToken() throws IOException{
		Map<String, Object> map = null;
		HttpsURLConnection conn = null;
		 
		URL url = new URL("https://api.iamport.kr/users/getToken");

		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JsonObject json = new JsonObject();

		json.addProperty("imp_key", API_KEY);
		json.addProperty("imp_secret", SECRET_KEY);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();
		bw.close();

		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();

		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		System.out.println(response);

		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		
		
		return token;
	} 
	
	// 생성자 
	public IamportCont() {
		// TODO Auto-generated constructor stub
	}
	public IamportCont(IamportAPI api) {
		
		this.iamportClient = new IamportClient(API_KEY, SECRET_KEY);
	} // constructor ends 
	
	// 결제 검증 
	@PostMapping("/payment/verify/{imp_uid}")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(@PathVariable(value="imp_uid") String imp_uid) throws IamportResponseException, IOException{
		return iamportClient.paymentByImpUid(imp_uid); //
	} // paymentByImpUid() ends 
	
	// 
	private RestTemplate restTemplate=new RestTemplate();
    private HttpHeaders headers=new HttpHeaders();
    private JSONObject body=new JSONObject();

    
    /*
    private IamportDTO getToken() {
        headers.setContentType(MediaType.APPLICATION_JSON);
        body.put("imp_key", iamportApi.getApiKey());
        body.put("imp_secret", iamportApi.getApiSecret());
        try {  
            HttpEntity<JSONObject>entity=new HttpEntity<>(body,headers);
            
            IamportDTO token=restTemplate.postForObject("https://api.iamport.kr/users/getToken", entity, IamportDTO.class);
            System.out.println(token+" FULLtoken");
    
            return token;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("gettoken에서 오류가 발생");
        }finally{
        	headers.clear();
            body.clear();
        }
        return null;
    } // getToken
    
    public void getPaymentInfo(String impUid) {
        // Step 1: Get Access Token
        IamportDTO token = getToken();

        if (token != null && "success".equals(token.getCode())) {
            String accessToken = token.getResponse().getAccessToken();

            // Step 2: Use Access Token to make another API call
            headers.set("Authorization", "Bearer " + accessToken);
            
            try {
                // Replace with your own logic for the payment details endpoint
                String paymentDetailsUrl = iamportApiBaseUrl + "/payments/" + impUid;
                IamportDTO idto = new IamportDTO();
                 idto = restTemplate.getForObject(paymentDetailsUrl, IamportDTO.class);
                
                // Handle the paymentInfo as needed
                System.out.println(idto);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error occurred in getPaymentInfo");
            } finally {
                headers.clear();
            }
        } else {
            // Handle the case where obtaining the token failed
            System.out.println("Failed to obtain access token");
        }
    } // ends 
    
    public static void main(String[] args) {
		IamportDTO token = new IamportCont().getToken();
		if(token != null & token.getCode()==0) {
			String accessToken = token.getResponse().getAccessToken();
			
			System.out.println(accessToken);
		} // if ends
	} */
}
