package kr.co.group.pay;

public class PayDTO {
	
	private String p_no;
	private int sin_code;
	private String p_method;
	private String p_regdate;
	private int p_total;
	
	public PayDTO() {}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public int getSin_code() {
		return sin_code;
	}

	public void setSin_code(int sin_code) {
		this.sin_code = sin_code;
	}

	public String getP_method() {
		return p_method;
	}

	public void setP_method(String p_method) {
		this.p_method = p_method;
	}

	public String getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(String p_regdate) {
		this.p_regdate = p_regdate;
	}

	public int getP_total() {
		return p_total;
	}

	public void setP_total(int p_total) {
		this.p_total = p_total;
	}

	@Override
	public String toString() {
		return "PayDTO [p_no=" + p_no + ", sin_code=" + sin_code + ", p_method=" + p_method + ", p_regdate=" + p_regdate
				+ ", p_total=" + p_total + "]";
	}
}
