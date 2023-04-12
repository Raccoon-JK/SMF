package com.smf.style.model.service;


import java.sql.Connection;
import static com.smf.common.JDBCTemplate.*;
import java.util.ArrayList;

import com.smf.common.model.vo.PageInfo;
import com.smf.style.model.dao.StyleDao;
import com.smf.style.model.vo.PostImg;
import com.smf.style.model.vo.StyleComment;
import com.smf.style.model.vo.StylePost;

public class StyleService {
	
	public ArrayList<StylePost> selectList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<StylePost> list = new StyleDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	
	public int insertPost(StylePost sp , PostImg pi) {
		
		Connection conn = getConnection();
		
		int result1 = new StyleDao().insertPost(conn, sp);
		
		//attachment테이블에 등록여부를 판단할 변수
		int result2 = 1; // 1로 미리 선언과동시에 초기화시켜주는 이유는 , Attachment테이블에 Insert문이 실행되지 않을수도 있으므로
		
		if (sp != null) {
			result2 = new StyleDao().insertImg(conn, pi);
		}
		
		//int result2 = new BoardDao().insertAttachment(conn, at);
		
		// 트랜잭션 처리
		if(result1 > 0 && result2 > 0) {
			// 첨부파일이 없는 경우 insert가 성공했을때도 result2는 여전히 0이기때문에 rollback처리가 될수 있음.
			// 따라서 애초에 result2의값을 1로 초기화시켜줘야한다.
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;// 혹시 하나라도 실패해서 0이 반환될경우 아예 실패값을 반환하기 위해 곱셈결과를리턴
	
	}
	
	public ArrayList<StylePost> selectImgList(){
		
		Connection conn = getConnection();
		
		ArrayList<StylePost> list = new StyleDao().selectImgList(conn);
		
		close(conn);
		
		return list;
	}
	
	public StylePost selectPost(int postNo) {
		Connection conn = getConnection();
		
		StylePost sp = new StyleDao().selectPost(conn, postNo);
		
		close(conn);
		
		return sp;
	}
	
	public PostImg selectImg(int postNo) {
		Connection conn = getConnection();
		
		PostImg pi = new StyleDao().selectImg(conn, postNo);
		
		close(conn);
		
		return pi;
	}
	
	public int updatePost(StylePost sp, PostImg pi) {
		
		Connection conn = getConnection();
		
		int result1 = new StyleDao().updatePost(conn, sp);
		
		int result2 = 1; // 애초에 insert나 update문이 실행조차 되지 않을경우를 대비해서 1로 초기화시킴
		
		// 새롭게 첨부된 파일이 있는경우에만 update, insert문을 실행시킴.
		if( pi != null ) {
			// 기존에 첨부파일이 있었을경우 => update문 실행하기위해서 fileNo값이 필요함.
			if(pi.getImgNo() != 0) {
				result2 = new StyleDao().updateImg(conn, pi);
			} else {// 기존에 첨부파일 없는경우 => insert문에는 fileNo값이 필요없어서 at객체에 fileNo값이 안담겨있음
				result2 = new StyleDao().insertNewImg(conn, pi);
			}
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else{
			rollback(conn);
		}
		
		close(conn);
		
		return result1 * result2;
	}
	
	public int deletePost(int postNo, String userId , PostImg pi) {
		Connection conn = getConnection();
		
		int result = new StyleDao().deletePost(conn, postNo, userId);
		int result2 = 1;
		
		if(pi != null) {
			result2 = new StyleDao().deleteImg(conn, postNo);
		}
		
		if(result > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result*result2;
	}
	
	public int insertPostImgList(StylePost sp , ArrayList<PostImg> list) {
		Connection conn = getConnection();
		
		int result1 = new StyleDao().insertImgPost(conn, sp);
		
		int result2 = new StyleDao().insertImgList(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1*result2;
	}
	
	
	public ArrayList<StylePost> selectPostImgList(){
		
		Connection conn = getConnection();
		
		ArrayList<StylePost> list = new StyleDao().selectImgList(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<PostImg> selectImgList(int postNo){
		Connection conn = getConnection();
		
		ArrayList<PostImg> list = new StyleDao().selectImgList(conn, postNo);
		
		close(conn);
		
		return list;
	}
	
	public int insertComment(StyleComment sc) {
		
		Connection conn = getConnection();
		
		int result = new StyleDao().insertComment(conn, sc);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<StyleComment> selectCommentList(int postNo){
		
		Connection conn = getConnection();
		
		ArrayList<StyleComment> list = new StyleDao().selectCommentList(conn, postNo);
		
		close(conn);
		
		return list;
	}
	
	
	
}
