package kr.co.group.cart;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.co.group.notice.NoticeDTO;

@Repository
public class CartDAO {

	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public CartDAO() {
		System.out.println("-----CartDAO() 객체 생성됨");
	} // 생성자 ends 
	
	// 목록 생성 
	public List<CartDTO> list(int start, int end){
		List<CartDTO> list = null;
		try {
			sql = new StringBuilder();
			
			sql.append(" SELECT C.sin_code, C.u_id, C.sin_status, C.su_no, C.sin_regdate, G.su_name, G.su_date_start, G.su_date_end, G.su_time_start, G.su_time_end, G.su_mo_status, G.su_fee ");
			sql.append(" FROM su_cart C ");
			sql.append(" JOIN sugang  G ");
			sql.append(" ON c.su_no = g.su_no ");
			// sql.append(" WHERE C.u_id = '' "); 로그인 완료 후 추가 
			sql.append(" ORDER BY sin_regdate DESC ");
			sql.append(" LIMIT " + start + ", " + (end - start + 1));
			
			// System.out.println(sql.toString());
			
			RowMapper<CartDTO> rowMapper = new RowMapper<CartDTO>() {
				
				@Override
				public CartDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					CartDTO dto = new CartDTO();
					
					dto.setSin_code(rs.getInt("sin_code"));
					dto.setSu_no(rs.getInt("su_no"));
					dto.setSin_regdate(rs.getString("sin_regdate"));
					dto.setU_id(rs.getString("u_id"));
					dto.setSin_status(rs.getString("sin_status"));
					dto.setSu_name(rs.getString("su_name"));
					dto.setSu_date_start(rs.getString("su_date_start"));
					dto.setSu_date_end(rs.getString("su_date_end"));
					dto.setSu_time_start(rs.getString("su_time_start"));
					dto.setSu_time_end(rs.getString("su_time_end"));
					dto.setSu_mo_status(rs.getString("su_mo_status"));
					dto.setSu_fee(rs.getInt("su_fee"));
					return dto;
				} // mapRow() ends 
			}; // rowMapper() ends 
			
			list = jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("카트 목록 생성 실패" + e);
		}
		return list;
	} // list() ends 
	
	// 상품 개수
	public int totalRowCount() {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			
			sql.append(" SELECT COUNT(*) ");
			sql.append(" FROM su_cart C ");
			sql.append(" JOIN sugang  G ");
			sql.append(" ON c.su_no = g.su_no ");
			
			cnt = jt.queryForObject(sql.toString(), Integer.class);
			
			// System.out.println(cnt);
		} catch (Exception e) {
			System.out.println("글 갯수 실패" + e);
		} // t-c ends 
		
		return cnt;
		
	} // totalRowCount() ends 
	
} // class ends 
