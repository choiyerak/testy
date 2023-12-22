package kr.co.group.order;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public OrderDAO() {
		System.out.println("-----OrderDAO() 객체 형성됨");
	} // constructor ends
	
	// 받은 데이터 테이블에 저장하기 
	public int create(OrderDTO odto) {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			
			sql.append(" INSERT INTO orders(order_no, order_class, order_total, u_id) ");
			sql.append(" VALUES( ?, ? , ?, ? ) ");
			
			cnt = jt.update(sql.toString(), odto.getOrder_no(), odto.getOrder_class(), odto.getOrder_total(), odto.getU_id());
			
		} catch (Exception e) {
			System.out.println("주문 추가 실패" + e);
		}
		return cnt;
	} // insert() ends 
	
	// 결제 성공시 결제 상태 변경 
	public int updateStatus(OrderDTO odto) {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			
			sql.append(" UPDATE orders ");
			sql.append(" SET order_imp_uid = ?, order_status = ? ");
			sql.append(" WHERE order_no = ? ");
			
			System.out.println(sql.toString());
			cnt = jt.update(sql.toString(), odto.getOrder_imp_uid(), odto.getOrder_status(), odto.getOrder_no());
			System.out.println(cnt);
		} catch (Exception e) {
			System.out.println("주문 상태 변경 실패" + e );
		}
		return cnt;
	} // updateStatus() ends 
	
	public Map<String, Object> checkPay(OrderDTO odto) {
		Map<String, Object> map = null;
		try {
			sql = new StringBuilder();
			sql.append(" SELECT order_imp_uid, order_total ");
			sql.append(" FROM orders ");
			sql.append(" WHERE order_no = ? ");
			
			map = jt.queryForMap(sql.toString(), odto.getOrder_no());
			System.out.println(map);
		} catch (Exception e) {
			System.out.println("결제 정보 확인 실패" + e);
		} // t-c ends 
		return map;
	} // checkPay() ends 
	
} // class ends 
