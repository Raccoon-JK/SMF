package com.smf.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

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
		public ArrayList<String> searchEmail(String uphone) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			//1. DB에서 uphone을 준비물로 email을 조회
			ArrayList<String> list = new MemberDao().searchEmail(conn, uphone);
			
			JDBCTemplate.close(conn);

			return list;
		}
		
		
		
		//비밀 번호를 조회하는 메서드
		public String searchPwd(String uphone, String userId) {
			
			String pwd = "";
			Connection conn = JDBCTemplate.getConnection();
			
			//1. DB에서 uphone, userId를 준비물로 Pwd조회
			
			pwd = new MemberDao().searchPwd(conn, uphone, userId);
			
			JDBCTemplate.close(conn);
			
			return pwd;
			
		}
		
		
		
		public ArrayList<Member> selectMemberList(){
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Member> list = new MemberDao().selectMemberList(conn);
			
		
			JDBCTemplate.close(conn);
			
			return list;
			
			
			
			
		}
		
		
		
}
	
	
	

