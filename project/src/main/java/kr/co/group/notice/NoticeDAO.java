package kr.co.group.notice;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public NoticeDAO() {
		System.out.println("-----NoticeDAO() 객체 생성됨");
	} // 생성자 ends
	
	// 목록 생성 
	public List<NoticeDTO> list(int start, int end, String col, String word) {
		List<NoticeDTO> list = null;
		try {
			sql = new StringBuilder();
			
			if(word == null) {
				sql.append(" SELECT n_no, n_subject, n_content, U.u_id, U.u_name, n_subject, n_readcnt, n_date ");
				sql.append(" FROM notice N ");
				sql.append(" JOIN user U ");
				sql.append(" ON N.u_id = U.u_id ");
				sql.append(" ORDER BY n_date DESC ");
				sql.append(" LIMIT " + start + ", " + (end - start + 1));
			} else {
				sql.append(" SELECT n_no, n_subject, n_content, U.u_id, U.u_name, n_subject, n_readcnt, n_date ");
				sql.append(" FROM notice N ");
				sql.append(" JOIN user U ");
				sql.append(" ON N.u_id = U.u_id ");
				if(col.equals("subject_content")) {
					sql.append("WHERE n_subject LIKE '%" + word + "%' or n_content LIKE '%" + word + "%'");
				} else if(col.equals("subject")) {
					sql.append("WHERE n_subject LIKE '%" + word + "%'");
				} else if(col.equals("content")) {
					sql.append("WHERE n_content LIKE '%" + word + "%'");
				} else if(col.equals("uname")) {
					sql.append("WHERE U.u_name LIKE '%" + word + "%'");
				}
				sql.append(" ORDER BY n_date DESC ");
				sql.append(" LIMIT " + start + ", " + (end - start + 1));
			} // if ends 검색어 null 여부 확인
			
			System.out.println(sql.toString());
			
			RowMapper<NoticeDTO> rowMapper = new RowMapper<NoticeDTO>() {
				
				@Override
				public NoticeDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					NoticeDTO dto = new NoticeDTO();
					
					dto.setN_no(rs.getInt("n_no"));
					dto.setN_subject(rs.getString("n_subject"));
					dto.setN_content(rs.getString("n_content"));
					dto.setU_id(rs.getString("u_id"));
					dto.setU_name(rs.getString("u_name"));
					dto.setN_readcnt(rs.getInt("n_readcnt"));
					dto.setN_date(rs.getString("n_date"));
					
					return dto;
				} // mapRow() ends 
			}; // rowMapper() ends 
			
			list = jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("공지 목록 실패" + e);
		} // t-c ends 
		return list;
	} // list() ends 
	
	// 글 갯수 
	public int totalRowCount(String col, String word) {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			if(word == null) {
				sql.append(" SELECT COUNT(*) ");
				sql.append(" FROM notice ");
			} else {
				sql.append(" SELECT COUNT(*) ");
				sql.append(" FROM notice N ");
				sql.append(" JOIN user U ");
				sql.append(" ON N.u_id = U.u_id ");
				if(col.equals("subject_content")) {
					sql.append("WHERE n_subject LIKE '%" + word + "%' or n_content LIKE '%" + word + "%'");
				} else if(col.equals("subject")) {
					sql.append("WHERE n_subject LIKE '%" + word + "%'");
				} else if(col.equals("content")) {
					sql.append("WHERE n_content LIKE '%" + word + "%'");
				} else if(col.equals("uname")) {
					sql.append("WHERE U.u_name LIKE '%" + word + "%'");
				}
			} // if ends 검색어 null 여부 확인 
			
			cnt = jt.queryForObject(sql.toString(), Integer.class);
			
		} catch (Exception e) {
			System.out.println("글 갯수 실패" + e);
		} // t-c ends
		
		return cnt;
		
	} // totalRowCount() ends
	
	
} // class ends 
