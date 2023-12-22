package kr.co.group.user;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kr.co.group.utility.MyAuthenticator;

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
	
	public List<UserDTO> getids() {
		List<UserDTO> list = null;
		try {
			sql = new StringBuilder();
			
			sql.append(" SELECT u_id, u_email");
			sql.append(" FROM user ");
			
			RowMapper<UserDTO> rowMapper = new RowMapper<UserDTO>() {
				
				@Override
				public UserDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					UserDTO dto = new UserDTO();
					
					dto.setU_id(rs.getString("u_id"));
					
					return dto;
				}
			};
			
			list = jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("아이디 목록 실패" + e );
		}
		return list;
	}
	
	public List<UserDTO> loginProc(){
		List<UserDTO> list = null;
		try {
			sql = new StringBuilder();
			sql.append(" SELECT u_id, u_pw ");
			sql.append(" FROM user ");
			
			RowMapper<UserDTO> rowMapper = new RowMapper<UserDTO>() {
				
				@Override
				public UserDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					UserDTO dto = new UserDTO();
					dto.setU_id(rs.getString("u_id"));
					dto.setU_pw(rs.getString("u_pw"));
					return dto;
				}
			};
			
			list=jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("로그인 실패" + e);
		}
		return list;
	} // login() end
	
	
	
	public String findID(String username, String useremail) {
	    String message = "";

	    try {
	        sql = new StringBuilder();
	        sql.append(" SELECT u_id, u_name, u_email ");
	        sql.append(" FROM user ");
	        sql.append(" WHERE u_name=? and u_email=? ");

	        RowMapper<UserDTO> rowMapper = new RowMapper<UserDTO>() {
	            @Override
	            public UserDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
	                UserDTO dto = new UserDTO();
	                dto.setU_id(rs.getString("u_id"));
	                dto.setU_name(rs.getString("u_name"));
	                dto.setU_email(rs.getString("u_email"));
	                return dto;
	            }
	        };

	        // query 메서드로 변경
	        List<UserDTO> resultList = jt.query(sql.toString(), rowMapper, username, useremail);

	        // 결과가 없는 경우
	        if (resultList.isEmpty()) {
	            message = "<span style='color:red;font-weight:bold'>이름/이메일 불일치</span>";
	        } else {
	        	UserDTO dto = resultList.get(0);
	            message = "<span style='color:green;font-weight:bold'>아이디 : " + dto.getU_id() +"</span>";
	        }

	    } catch (EmptyResultDataAccessException e) {
	        // queryForObject에서 예외 발생 시
	        message = "<span style='color:red;font-weight:bold'>이름/이메일 불일치</span>";
	    } catch (Exception e) {
	        System.out.println("오류: " + e);
	        message = "<span style='color:red;font-weight:bold'>오류가 발생했습니다</span>";
	    }

	    return message;
	}
			
			
			
			
	public boolean findLogin(UserDTO dto) {
		boolean flag = false; 
		
		try {
			
			sql = new StringBuilder();
			sql.append(" SELECT u_id, u_name, u_email ");
			sql.append(" FROM user ");
			sql.append(" WHERE u_id=? and u_email=? ");
			
			RowMapper<UserDTO> rowMapper = new RowMapper<UserDTO>() {
				
				@Override
				public UserDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					UserDTO dto = new UserDTO();
					dto.setU_id(rs.getString("u_id"));
					dto.setU_name(rs.getString("u_name"));
					dto.setU_email(rs.getString("u_email"));
				return dto;
				}
			};
			
			dto = jt.queryForObject(sql.toString(), rowMapper, dto.getU_id(), dto.getU_email());
			
			String u_id = dto.getU_id();
			//System.out.println(u_id);
				
			String[] chSet = { "a","b","c","d","e","f","g","h","i","j","k","l","m"
					  ,"n","o","p","q","r","s","t","u","v","w","x","y","z"
					  ,"A","B","C","D","E","F","G","H","I","J","K","L","M"
					  ,"N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
					  ,"0","1","2","3","4","5","6","7","8","9"
					  };	// chSet[0]~chSet[61]

			// chSet 배열에서 랜덤하게 10글자 뽑아서 가져오기
			StringBuilder temPW = new StringBuilder();			// temPW : 임시 비밀번호
			for(int i=0; i<10; i++) {							// 10글자 이내로
				int idx=(int)(chSet.length * Math.random());	// 랜덤
				temPW.append(chSet[idx]);
			} // for end
			
			//System.out.println(temPW);
			// 임시 비밀번호로 테이블 수정하기(업데이트)
			sql=new StringBuilder();
			sql.append(" update user ");
			sql.append(" set u_pw = ? ");
			sql.append(" where u_id = ? and u_email = ? ");
			//System.out.println(sql.toString());
			int cnt = 0;
			//System.out.println(dto);
			cnt = jt.update(sql.toString(), temPW, dto.getU_id(), dto.getU_email());

			//System.out.println(cnt);
			if(cnt==1) {	// 임시 비밀번호로 테이블 수정되었다면
				// 아이디(id)와 임시비밀번호로(temPW)를 웹 메일 전송하기
				
				// 메일 내용
				String content = "※ 임시비밀번호로 로그인 후, 나의 정보에서 비밀번호를 수정해주세요 ※";
				content += "<hr>";
				content += "<table border='1'>";
				content += "<tr>";
				content += "	<th>아이디</th>";
				content += "	<th>" + u_id + "</th>";
				content += "</tr>";
				content += "<tr>";
				content += "	<td>임시비밀번호</td>";
				content += "	<td><span style='color:blue; font-weight: bold;'>"+ temPW.toString() +"</span></td>";
				content += "</tr>";
				content += "</table>";
				
				// 메일 전송
				String mailServer = "mw-002.cafe24.com";		// cafe24 메일서버 
				Properties props = new Properties();
				props.put("mail.smtp.host", mailServer);
				props.put("mail.smtp.auth", true);
				Authenticator myAuth = new MyAuthenticator();	// 다형성
				Session sess = Session.getInstance(props, myAuth);
				
				InternetAddress[] address = { new InternetAddress(dto.getU_email()) };	// 받는 사람 이메일 주소
				Message msg = new MimeMessage(sess);									// 메일 관련 정보 작성
				msg.setRecipients(Message.RecipientType.TO, address);					// 받는사람
				msg.setFrom(new InternetAddress("rladbwjd037@naver.com"));				// 보내는 사람
				msg.setSubject("아이디/임시비밀번호 보내드립니다 :D");	     			// 메일 제목
				msg.setContent(content, "text/html; charset=UTF-8");					// 메일 내용
				msg.setSentDate(new Date());											// 메일 보낸날짜
				Transport.send(msg);													// 메일 전송
				
				flag = true;	// 아이디+비밀번호 찾기 최종적으로 성공
		} // if end
			
		}catch (Exception e) {
			System.out.println("이름/이메일 불일치: " + e);
		} // end
		
		return flag;
		
	} // findLogin() end
	
	// 나라님 소스
//	String mailServer = "mw-002.cafe24.com"; // cafe24 메일 서버 
//	Properties props = new Properties();
//	props.put("mail.smtp.host", mailServer);
//	props.put("mail.smtp.auth", true);
//
//	Authenticator myAuth = new MyAuthenticator();
//
//	Session sess = Session.getInstance(props, myAuth);
//
//	String email = "sleepynara@daum.net";
//
//	String to = email;
//	String from = email;
//	String subject = "결제 완료 이메일";
//	String content = "주문 번호" + order_no; 
//
//	try {
//		InternetAddress[] address = {new InternetAddress(to)};
//		Message msg = new MimeMessage(sess);
//		msg.setRecipients(Message.RecipientType.TO, address);
//		
//		msg.setFrom(new InternetAddress(from));
//		
//		msg.setSubject(subject);
//		msg.setContent(content, "text/html; charset=UTF-8");
//		
//		msg.setSentDate(new Date());
//		
//		Transport.send(msg);
//		
//	} catch (Exception e) {
//		
//		System.out.println("이메일 전송 실패" + e);
//		
//	} // try- catch ends
	
	
	// 임시랜덤비밀번호 생성
	public String randomPW(int length) {
		
		String chars = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,0,1,2,3,4,5,6,7,8,9";
		Random random = new Random();
		StringBuilder stringbuilder = new StringBuilder(length);
		
		for(int i=0; i<length; i++) {							
			int index = random.nextInt(chars.length());
			stringbuilder.append(chars.charAt(index));
		} // for end
		
		return stringbuilder.toString();
		
	} // randomPW() end
	
} // class() end


	

