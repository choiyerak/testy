package kr.co.group.admin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	
	@Autowired
	JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public AdminDAO() {
		System.out.println("-----AdminDAO() 객체 생성됨");
	} // 생성자 ends 
	
	// 페이지네이션 변경
	public int updatePage(AdminDTO adto) {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			sql.append(" UPDATE admin ");
			sql.append(" SET numPerPage= ?,  pagePerBlock= ? ");
			sql.append(" WHERE tname = ? ");
			
			cnt = jt.update(sql.toString(), adto.getNumPerPage(), adto.getPagePerBlock(), adto.getTname());
			System.out.println(cnt);
		} catch (Exception e) {
			System.out.println("페이지 수정 실패" + e);
		} // t-c ends 
		return cnt;
	} // updatePage() ends 
	
	// numPerPage, pagePerBlock 가져오기 
	public List<AdminDTO> paging(String tname) {
		List<AdminDTO> list = null;
		try {
			sql = new StringBuilder();
			sql.append(" SELECT numPerPage, pagePerBlock ");
			sql.append(" FROM admin ");
			sql.append(" WHERE tname =  ? " );
			System.out.println(sql.toString());
			RowMapper<AdminDTO> rowMapper = new RowMapper<AdminDTO>() {
				
				@Override
				public AdminDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					AdminDTO adto = new AdminDTO();
					
					adto.setNumPerPage(rs.getInt("numPerPage"));
					adto.setPagePerBlock(rs.getInt("pagePerBlock"));
					
					return adto;
				} // mapRow() ends
			}; // rowMapper() ends
			
			list = jt.query(sql.toString(), new Object[] {tname},rowMapper);
		} catch (Exception e) {
			System.out.println("불러오기 실패" + e);
		} // t-c ends 
		return list;
	} // 
} // class ends 
