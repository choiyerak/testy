package kr.co.group.inquiry;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class InquiryDAO {
	
	@Autowired
	private JdbcTemplate jt;
	
	StringBuilder sql = null;
	
	public InquiryDAO() {
		System.out.println("-----InquiryDAO() 객체 생성됨");
	} // 생성자 ends 
	
	// 문의사항 목록 
	public List<InquiryDTO> list(int start, int end, String col, String word){
		List<InquiryDTO> list = null;
		try {
			sql = new StringBuilder();
			
			if(word == null) {
				sql.append(" SELECT I.i_no, I.i_subject, I.i_content, U.u_name, I.i_date ");
				sql.append(" FROM inquiry I ");
				sql.append(" JOIN user U ");
				sql.append(" ON I.u_id = U.u_id ");
				sql.append(" ORDER BY i_date DESC ");
				sql.append(" LIMIT " + start + ", " + (end - start + 1));
			} else {
				sql.append(" SELECT I.i_no, I.i_subject, I.i_content, U.u_name, I.i_date ");
				sql.append(" FROM inquiry I ");
				sql.append(" JOIN user U ");
				sql.append(" ON I.u_id = U.u_id ");
				if(col.equals("subject_content")) {
					sql.append("WHERE I.i_subject LIKE '%" + word + "%' or I.i_content LIKE '%" + word + "%'");
				} else if(col.equals("subject")) {
					sql.append("WHERE I.i_subject LIKE '%" + word + "%'");
				} else if(col.equals("content")) {
					sql.append("WHERE I.i_content LIKE '%" + word + "%'");
				} else if(col.equals("uname")) {
					sql.append("WHERE U.u_name LIKE '%" + word + "%'");
				}
				sql.append(" ORDER BY i_date DESC ");
				sql.append(" LIMIT " + start + ", " + (end - start + 1));
			} // if ends : 검색어 null 여부 확인 
			
			System.out.println(sql.toString());
			RowMapper<InquiryDTO> rowMapper = new RowMapper<InquiryDTO>() {
				
				@Override
				public InquiryDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					InquiryDTO dto = new InquiryDTO();
					
					dto.setI_no(rs.getInt("i_no"));
					dto.setI_subject(rs.getString("i_subject"));
					dto.setI_content(rs.getString("i_content"));
					dto.setU_name(rs.getString("u_name"));
					dto.setI_date(rs.getString("i_date"));
					
					return dto;
				} // mapRow() ends 
			}; // rowMapper() ends 
			
			list = jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("문의사항 목록 실패" + e);
		} // t-c ends 
		
		return list;
	} // list() ends
	
	// 목록(글) 갯수
	public int totalRowCount(String col, String word) {
		int cnt = 0;
		try {
			sql = new StringBuilder();
			
			if(word == null) {
				sql.append(" SELECT COUNT(*) ");
				sql.append(" FROM inquiry ");
			} else {
				sql.append(" SELECT COUNT(*) ");
				sql.append(" FROM inquiry I ");
				sql.append(" JOIN user U ");
				sql.append(" ON I.u_id = U.u_id ");
				if(col.equals("subject_content")) {
					sql.append("WHERE I.i_subject LIKE '%" + word + "%' or I.i_content LIKE '%" + word + "%'");
				} else if(col.equals("subject")) {
					sql.append("WHERE I.i_subject LIKE '%" + word + "%'");
				} else if(col.equals("content")) {
					sql.append("WHERE I.i_content LIKE '%" + word + "%'");
				} else if(col.equals("uname")) {
					sql.append("WHERE U.u_name LIKE '%" + word + "%'");
				}
			} // if ends 키워드 존재 여부 확인 
			cnt = jt.queryForObject(sql.toString(), Integer.class);
		} catch (Exception e) {
			System.out.println("글 갯수 실패" + e);
		} // t-c ends 
		
		return cnt;
	} // totalRowCount() ends
}
