package kr.co.group.notice;

public class NoticeDTO {
	private int n_no;
	private String c_no;
	private String n_cno;
	private String n_subject;
	private String n_content;
	private String n_date;
	private String u_id;
	private String u_name;
	private int n_readcnt;
	private String n_file;
	private String n_notice;
	
	public NoticeDTO() {}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getN_cno() {
		return n_cno;
	}

	public void setN_cno(String n_cno) {
		this.n_cno = n_cno;
	}

	public String getN_subject() {
		return n_subject;
	}

	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_date() {
		return n_date;
	}

	public void setN_date(String n_date) {
		this.n_date = n_date;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public int getN_readcnt() {
		return n_readcnt;
	}

	public void setN_readcnt(int n_readcnt) {
		this.n_readcnt = n_readcnt;
	}

	public String getN_file() {
		return n_file;
	}

	public void setN_file(String n_file) {
		this.n_file = n_file;
	}

	public String getN_notice() {
		return n_notice;
	}

	public void setN_notice(String n_notice) {
		this.n_notice = n_notice;
	}

	@Override
	public String toString() {
		return "NoticeDTO [n_no=" + n_no + ", c_no=" + c_no + ", n_cno=" + n_cno + ", n_subject=" + n_subject
				+ ", n_content=" + n_content + ", n_date=" + n_date + ", u_id=" + u_id + ", u_name=" + u_name
				+ ", n_readcnt=" + n_readcnt + ", n_file=" + n_file + ", n_notice=" + n_notice + "]";
	}
	
}
