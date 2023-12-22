package kr.co.group.cart;

public class CartDTO {

	private int sin_code;
	private int su_no;
	private String u_id;
	private String sin_regdate;
	private String sin_status;
	private String su_name;
	private String su_date_start; 
	private String su_date_end; 
	private String su_time_start; 
	private String su_time_end; 
	private String su_mo_status;
	private int su_fee;
	
	public CartDTO() {}
	
	public int getSin_code() {
		return sin_code;
	}
	public void setSin_code(int sin_code) {
		this.sin_code = sin_code;
	}
	public int getSu_no() {
		return su_no;
	}
	public void setSu_no(int su_no) {
		this.su_no = su_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getSin_regdate() {
		return sin_regdate;
	}
	public void setSin_regdate(String sin_regdate) {
		this.sin_regdate = sin_regdate;
	}

	public String getSin_status() {
		return sin_status;
	}

	public void setSin_status(String sin_status) {
		this.sin_status = sin_status;
	}

	public String getSu_name() {
		return su_name;
	}

	public void setSu_name(String su_name) {
		this.su_name = su_name;
	}

	public String getSu_date_start() {
		return su_date_start;
	}

	public void setSu_date_start(String su_date_start) {
		this.su_date_start = su_date_start;
	}

	public String getSu_date_end() {
		return su_date_end;
	}

	public void setSu_date_end(String su_date_end) {
		this.su_date_end = su_date_end;
	}

	public String getSu_time_start() {
		return su_time_start;
	}

	public void setSu_time_start(String su_time_start) {
		this.su_time_start = su_time_start;
	}

	public String getSu_time_end() {
		return su_time_end;
	}

	public void setSu_time_end(String su_time_end) {
		this.su_time_end = su_time_end;
	}

	public String getSu_mo_status() {
		return su_mo_status;
	}

	public void setSu_mo_status(String su_mo_status) {
		this.su_mo_status = su_mo_status;
	}

	public int getSu_fee() {
		return su_fee;
	}

	public void setSu_fee(int su_fee) {
		this.su_fee = su_fee;
	}

	@Override
	public String toString() {
		return "CartDTO [sin_code=" + sin_code + ", su_no=" + su_no + ", u_id=" + u_id + ", sin_regdate=" + sin_regdate
				+ ", sin_status=" + sin_status + "]";
	}
}
