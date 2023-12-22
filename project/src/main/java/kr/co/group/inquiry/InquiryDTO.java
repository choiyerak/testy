package kr.co.group.inquiry;

public class InquiryDTO {
	private int i_no; 
	private String u_id; 
	private String i_cno; 
	private String i_subject;
	private String i_content;
	private String i_date;
	private int i_readcnt;
	private short i_secret;
	private String u_name;
	
	public InquiryDTO() {}

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getI_cno() {
		return i_cno;
	}

	public void setI_cno(String i_cno) {
		this.i_cno = i_cno;
	}

	public String getI_subject() {
		return i_subject;
	}

	public void setI_subject(String i_subject) {
		this.i_subject = i_subject;
	}

	public String getI_content() {
		return i_content;
	}

	public void setI_content(String i_content) {
		this.i_content = i_content;
	}

	public String getI_date() {
		return i_date;
	}

	public void setI_date(String i_date) {
		this.i_date = i_date;
	}

	public int getI_readcnt() {
		return i_readcnt;
	}

	public void setI_readCnt(int i_readcnt) {
		this.i_readcnt = i_readcnt;
	}

	public short getI_secret() {
		return i_secret;
	}

	public void setI_secret(short i_secret) {
		this.i_secret = i_secret;
	}
	
	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public void setI_readcnt(int i_readcnt) {
		this.i_readcnt = i_readcnt;
	}

	@Override
	public String toString() {
		return "InquiryDTO [i_no=" + i_no + ", u_id=" + u_id + ", i_cno=" + i_cno + ", i_subject=" + i_subject
				+ ", i_content=" + i_content + ", i_date=" + i_date + ", i_readCnt=" + i_readcnt + ", i_secret="
				+ i_secret + "]";
	}
}
