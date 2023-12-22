package kr.co.group.admin;

public class AdminDTO {
	private String tname;
	private int numPerPage;
	private int pagePerBlock;
	
	public AdminDTO() {}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	@Override
	public String toString() {
		return "AdminDTO [tname=" + tname + ", numPerPage=" + numPerPage + ", pagePerBlock=" + pagePerBlock + "]";
	}
}
