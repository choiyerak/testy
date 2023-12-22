package kr.co.group.pay;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public PayDAO() {
		System.out.println("-----PayDAO() 객체 생성함");
	} // 생성자 ends
	
	public List<PayDTO> order(String p_no) {
		List<PayDTO> list = null;
		try {
			sql = new StringBuilder();
			sql.append(" SELECT sin_code, p_method, p_regdate, p_total ");
			sql.append(" FROM su_pay ");
			sql.append(" WHERE  p_no = '" + p_no + "'" );
			System.out.println(sql.toString());
			
			RowMapper<PayDTO> rowMapper = new RowMapper<PayDTO>() {
				
				@Override
				public PayDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					
					PayDTO pdto = new PayDTO();
					
					pdto.setP_no(p_no);
					pdto.setSin_code(rs.getInt("sin_code"));
					pdto.setP_method(rs.getString("p_method"));
					pdto.setP_regdate(rs.getString("p_regdate"));
					pdto.setP_total(rs.getInt("p_total"));
					
					return pdto;
				}// mapRow() ends 
			}; // rowMapper() ends 
			
			list = jt.query(sql.toString(),  rowMapper);
			System.out.println(list);
			
		} catch (Exception e) {
			System.out.println("상품 가져오기 실패" + e);
		}
		return list;
	} // product() ends 
	
	
	// 목록(글) 갯수
	public int totalRowCount() {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			
			sql.append(" SELECT COUNT(*) ");
			sql.append(" FROM su_pay ");
			
			cnt = jt.queryForObject(sql.toString(), Integer.class);
		} catch (Exception e) {
			System.out.println("글 갯수 실패" + e);
		} // t-c ends 
		
		return cnt;
		
	} // totalRowCount() ends 
} // class ends
