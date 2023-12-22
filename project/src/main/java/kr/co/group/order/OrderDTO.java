package kr.co.group.order;

public class OrderDTO {
	private String 	order_no;
	private String 	order_class;
	private int		order_total;
	private String 	order_status;
	private String 	order_date;
	private String  u_id;
	private String 	order_imp_uid;
	
	public OrderDTO() {}

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public String getOrder_class() {
		return order_class;
	}

	public void setOrder_class(String order_class) {
		this.order_class = order_class;
	}

	public int getOrder_total() {
		return order_total;
	}

	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}
	
	
	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	
	
	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	public String getOrder_imp_uid() {
		return order_imp_uid;
	}

	public void setOrder_imp_uid(String order_imp_uid) {
		this.order_imp_uid = order_imp_uid;
	}

	@Override
	public String toString() {
		return "OrderDTO [order_no=" + order_no + ", order_class=" + order_class + ", order_total=" + order_total
				+ ", order_status=" + order_status + ", order_date=" + order_date + ", u_id=" + u_id
				+ ", order_imp_uid=" + order_imp_uid + "]";
	}

} // class ends 
