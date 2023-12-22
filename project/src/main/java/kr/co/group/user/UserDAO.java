package kr.co.group.user;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public UserDAO() {
		System.out.println("-----UserDAO() 객체 생성됨");
	} // 생성자 ends 
	
	// 회원가입 정보 입력 
	public int create(UserDTO dto) {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			sql.append(" insert into user(u_id, u_pw, u_name, u_sex, u_birth, u_phone, u_postcode, u_addr, u_address, u_email, u_level) ");
			sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'C') ");
			
			cnt = jt.update(sql.toString(), dto.getU_id(), dto.getU_pw(), dto.getU_name(), dto.getU_sex(), dto.getU_birth(), dto.getU_phone(), dto.getU_postcode(), dto.getU_addr(), dto.getU_address(), dto.getU_email(), dto.getU_regist(), dto.getU_level());
			
		} catch (Exception e) {
			System.out.println("회원 등록 실패" + e);
		}
		
		return cnt;
	} // create() ends 
	
	public List<UserDTO> list(int start, int end, String user_col, String user_word){
 		List<UserDTO> list = null;
 		try {
 			sql = new StringBuilder();
 			
 			if(user_word == null) {
 				sql.append(" SELECT u_id, u_name ");
 	 			sql.append(" FROM user ");
 	 			sql.append(" ORDER BY u_name DESC ");
 	 			sql.append(" LIMIT " + start + ", " + (end - start + 1));
 			} else {
 				sql.append(" SELECT u_id, u_name ");
 	 			sql.append(" FROM user ");
 	 			if(user_col.equals("id_name")) {
 	 				sql.append("WHERE u_id LIKE '%" + user_word + "%' or u_name LIKE '%" + user_word + "%'");
 	 			} else if (user_col.equals("id")) {
 	 				sql.append("WHERE u_id LIKE '%" + user_word + "%'");
 	 			} else if (user_col.equals("name")) {
 	 				sql.append("WHERE u_name LIKE '%" + user_word + "%'");
 	 			}
 				
 	 			sql.append(" ORDER BY u_name DESC ");
 	 			sql.append(" LIMIT " + start + ", " + (end - start + 1));
 			} // 
 			
 			// 익명 객체를 이용해서 rowmapper 객체 생성 
 			RowMapper<UserDTO> rowMapper = new RowMapper<UserDTO>() {
				@Override
				public UserDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					UserDTO dto = new UserDTO();
					dto.setU_id(rs.getString("u_id"));
					dto.setU_name(rs.getString("u_name"));
					return dto;
				} // mapRow() ends 
			}; // rowmapper 익명 객체 ends 
			// System.out.println(sql.toString());
			list = jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("회원목록실패" + e);
		}
 		
 		return list;
	}; // list() ends
	
	
	// 목록 생성 
	public List<UserDTO> list(){
 		List<UserDTO> list = null;
 		try {
 			sql = new StringBuilder();
 			sql.append(" SELECT u_id, u_name ");
 			sql.append(" FROM user ");
 			sql.append(" ORDER BY u_name DESC ");
 			
 			// 익명 객체를 이용해서 rowmapper 객체 생성 
 			RowMapper<UserDTO> rowMapper = new RowMapper<UserDTO>() {
				@Override
				public UserDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					UserDTO dto = new UserDTO();
					dto.setU_id(rs.getString("u_id"));
					dto.setU_name(rs.getString("u_name"));
					return dto;
				} // mapRow() ends 
			}; // rowmapper 익명 객체 ends 
			
			
			list = jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("회원목록실패" + e);
		}
 		
 		return list;
	}; // list() ends 
	
	// 목록(글) 갯수
	public int totalRowCount(String user_col, String user_word) {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			
			if(user_word == null) {
				sql.append(" SELECT COUNT(*) ");
				sql.append(" FROM user ");
			} else {
				sql.append(" SELECT COUNT(*) ");
				sql.append(" FROM user ");
				if(user_col.equals("id_name")) {
 	 				sql.append("WHERE u_id LIKE '%" + user_word + "%' or u_name LIKE '%" + user_word + "%'");
 	 			} else if (user_col.equals("id")) {
 	 				sql.append("WHERE u_id LIKE '%" + user_word + "%'");
 	 			} else if (user_col.equals("name")) {
 	 				sql.append("WHERE u_name LIKE '%" + user_word + "%'");
 	 			}
			}
			
			
			cnt = jt.queryForObject(sql.toString(), Integer.class);
		} catch (Exception e) {
			System.out.println("글 갯수 실패" + e);
		} // t-c ends 
		
		return cnt;
		
	} // totalRowCount() ends 
	
	// 목록(글) 갯수
	public int totalRowCount() {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			
			sql.append(" SELECT COUNT(*) ");
			sql.append(" FROM user ");
			
			cnt = jt.queryForObject(sql.toString(), Integer.class);
		} catch (Exception e) {
			System.out.println("글 갯수 실패" + e);
		} // t-c ends 
		
		return cnt;
		
	} // totalRowCount() ends 
	
}
