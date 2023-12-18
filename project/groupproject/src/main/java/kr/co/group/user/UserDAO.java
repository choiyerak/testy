package kr.co.group.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
}
