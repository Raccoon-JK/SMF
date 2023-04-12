package com.smf.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.smf.common.JDBCTemplate;
import com.smf.member.model.dao.MemberDao;
import com.smf.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return m;
	}
	
	
	public int insertMember(Member m) {
		//반환형 int : 처리된 행의 갯
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		//트랜잭션 처리 
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}

			//사용한 자원 반납 , conn.close();
			JDBCTemplate.close(conn);
			//컨트롤러에게 결과값 반환(처리된 행의 갯수)
			return result;
	}
	
	
	//이메일을 조회 하는 메서드
		public String searchEmail(String uphone) {
			
			String email = "";
			Connection conn = JDBCTemplate.getConnection();
			
			//1. DB에서 uphone을 준비물로 email을 조회
			email = new MemberDao().searchEmail(conn, uphone);
			
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return email;
		}
		
		
		
		
		
		
}
	
	
	

