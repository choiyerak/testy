package kr.co.group.iamport;

import com.fasterxml.jackson.annotation.JsonProperty;

public class IamportDTO {

    @JsonProperty("code")
    private Integer code;

    @JsonProperty("message")
    private String message;

    @JsonProperty("response")
    private Response response;

    public static class Response {
        @JsonProperty("access_token")
        private String accessToken;

        @JsonProperty("now")
        private long now;

        @JsonProperty("expired_at")
        private long expiredAt;

		public String getAccessToken() {
			return accessToken;
		}

		public void setAccessToken(String accessToken) {
			this.accessToken = accessToken;
		}

		public long getNow() {
			return now;
		}

		public void setNow(long now) {
			this.now = now;
		}

		public long getExpiredAt() {
			return expiredAt;
		}

		public void setExpiredAt(long expiredAt) {
			this.expiredAt = expiredAt;
		}

        
    }

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Response getResponse() {
		return response;
	}

	public void setResponse(Response response) {
		this.response = response;
	}

    
}
