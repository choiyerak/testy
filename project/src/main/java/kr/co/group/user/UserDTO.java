package kr.co.group.user;

public class UserDTO {
	// 멤버변수
	private String u_id;
	private String u_level;
	private String u_pw;
	private String u_name;
	private String u_sex; // char 확인 할 것 
	private String u_birth;
	private String u_phone;
	private String u_postcode;
	private String u_addr;
	private String u_address;
	private String u_email;
	private String u_regist;
	private String u_retouch;
	private String u_cancel;
	
	public UserDTO() {} // 생성자 

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_level() {
		return u_level;
	}

	public void setU_level(String u_level) {
		this.u_level = u_level;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_sex() {
		return u_sex;
	}

	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getU_postcode() {
		return u_postcode;
	}

	public void setU_postcode(String u_postcode) {
		this.u_postcode = u_postcode;
	}

	public String getU_addr() {
		return u_addr;
	}

	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_regist() {
		return u_regist;
	}

	public void setU_regist(String u_regist) {
		this.u_regist = u_regist;
	}

	public String getU_retouch() {
		return u_retouch;
	}

	public void setU_retouch(String u_retouch) {
		this.u_retouch = u_retouch;
	}

	public String getU_cancel() {
		return u_cancel;
	}

	public void setU_cancel(String u_cancel) {
		this.u_cancel = u_cancel;
	}

	@Override
	public String toString() {
		return "UserDTO [u_id=" + u_id + ", u_level=" + u_level + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_sex="
				+ u_sex + ", u_birth=" + u_birth + ", u_phone=" + u_phone + ", u_postcode=" + u_postcode + ", u_addr="
				+ u_addr + ", u_address=" + u_address + ", u_email=" + u_email + ", u_regist=" + u_regist
				+ ", u_retouch=" + u_retouch + ", u_cancel=" + u_cancel + "]";
	}
	
}
