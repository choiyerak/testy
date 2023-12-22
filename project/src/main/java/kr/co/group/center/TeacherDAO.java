package kr.co.group.center;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


@Repository
public class TeacherDAO {

    @Autowired
    private JdbcTemplate jt;

    public TeacherDAO() {
        System.out.println("-----TeacherDAO() 객체 생성됨");
    } // 생성자 ends

    public TeacherDTO getTeacher(String t_id) {
        TeacherDTO teacher = null;
        try {
            String sql = "SELECT "
            		+ "t_id,"
            		+ "teacher.t_class,"
            		+ "u_level,"
            		+ "c_no,"
            		+ "t_pw,"
            		+ "t_name,"
            		+ "t_sex,"
            		+ "t_birth,"
            		+ "t_phone,"
            		+ "t_postcode,"
            		+ "t_addr,"
            		+ "t_address,"
            		+ "t_email,"
            		+ "t_regist,"
            		+ "t_retouch,"
            		+ "t_career,"
            		+ "t_pic,"
            		+ "t_sangse.t_levname "
            		+ "FROM teacher "
            		+ "JOIN t_sangse ON teacher.t_class = t_sangse.t_class "
            		+ "WHERE t_id = ?";

            RowMapper<TeacherDTO> rowMapper = new RowMapper<TeacherDTO>() {
                @Override
                public TeacherDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
                    TeacherDTO dto = new TeacherDTO();
                    dto.setT_id(rs.getString("t_id"));
                    dto.setT_name(rs.getString("t_name"));
                    dto.setT_class(rs.getString("t_class"));
                    dto.setU_level(rs.getString("u_level"));
                    dto.setC_no(rs.getString("c_no"));
                    dto.setT_pw(rs.getString("t_pw"));
                    dto.setT_sex(rs.getString("t_sex"));
                    dto.setT_birth(rs.getString("t_birth"));
                    dto.setT_phone(rs.getString("t_phone"));
                    dto.setT_postcode(rs.getString("t_postcode"));
                    dto.setT_addr(rs.getString("t_addr"));
                    dto.setT_address(rs.getString("t_address"));
                    dto.setT_email(rs.getString("t_email"));
                    dto.setT_regist(rs.getString("t_regist"));
                    dto.setT_retouch(rs.getString("t_retouch"));
                    dto.setT_career(rs.getString("t_career"));
                    dto.setT_pic(rs.getString("t_pic"));
                    dto.setT_levname(rs.getString("t_levname"));
                    return dto;
                }
            };

            teacher = jt.queryForObject(sql, new Object[]{t_id}, rowMapper);

        } catch (Exception e) {
            System.out.println("강사 정보 조회 실패: " + e);
        }
        return teacher;
    }
    
   
    public List<TeacherDTO> list(String centerCode) {
        List<TeacherDTO> list = null;
        try {
            String sql = "SELECT "
                    + "t_id,"
                    + "teacher.t_class,"
                    + "u_level,"
                    + "c_no,"
                    + "t_pw,"
                    + "t_name,"
                    + "t_sex,"
                    + "t_birth,"
                    + "t_phone,"
                    + "t_postcode,"
                    + "t_addr,"
                    + "t_address,"
                    + "t_email,"
                    + "t_regist,"
                    + "t_retouch,"
                    + "t_career,"
                    + "t_pic,"
                    + "t_sangse.t_levname "
                    + "FROM teacher "
                    + "JOIN t_sangse ON teacher.t_class = t_sangse.t_class "
                    + "WHERE c_no = ?";

            RowMapper<TeacherDTO> rowMapper = new RowMapper<TeacherDTO>() {
                @Override
                public TeacherDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
                    TeacherDTO dto = new TeacherDTO();
                    dto.setT_id(rs.getString("t_id"));
                    dto.setT_name(rs.getString("t_name"));
                    dto.setT_class(rs.getString("t_class"));
                    dto.setU_level(rs.getString("u_level"));
                    dto.setC_no(rs.getString("c_no"));
                    dto.setT_pw(rs.getString("t_pw"));
                    dto.setT_sex(rs.getString("t_sex"));
                    dto.setT_birth(rs.getString("t_birth"));
                    dto.setT_phone(rs.getString("t_phone"));
                    dto.setT_postcode(rs.getString("t_postcode"));
                    dto.setT_addr(rs.getString("t_addr"));
                    dto.setT_address(rs.getString("t_address"));
                    dto.setT_email(rs.getString("t_email"));
                    dto.setT_regist(rs.getString("t_regist"));
                    dto.setT_retouch(rs.getString("t_retouch"));
                    dto.setT_career(rs.getString("t_career"));
                    dto.setT_pic(rs.getString("t_pic"));
                    dto.setT_levname(rs.getString("t_levname"));
                    return dto;
                }
            };

            list = jt.query(sql.toString(),new Object[]{centerCode}, rowMapper);

        } catch (Exception e) {
            System.out.println("강사 목록 조회 실패: " + e);
        }
        return list;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}