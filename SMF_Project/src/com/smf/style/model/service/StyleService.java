package com.smf.style.model.service;


import java.sql.Connection;
import static com.smf.common.JDBCTemplate.*;
import java.util.ArrayList;

import com.smf.common.model.vo.PageInfo;
import com.smf.member.model.vo.Member;
import com.smf.style.model.dao.StyleDao;
import com.smf.style.model.vo.Follow;
import com.smf.style.model.vo.PostImg;
import com.smf.style.model.vo.PostLike;
import com.smf.style.model.vo.StyleComment;
import com.smf.style.model.vo.StylePost;

public class StyleService {
	
	
	public int insertThumbnailPost(StylePost sp , ArrayList<PostImg> list) {
		Connection conn = getConnection();
		
		int result1 = new StyleDao().insertThumbnailPost(conn, sp);
		
		int result2 = new StyleDao().insertPostImgList(conn, list);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1*result2;
	}
	
	
	
	public ArrayList<StylePost> selectPostList(){
		
		Connection conn = getConnection();
		
		ArrayList<StylePost> list = new StyleDao().selectPostList(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<StylePost> selectUserPost(){
		
		Connection conn = getConnection();
		
		ArrayList<StylePost> list = new StyleDao().selectPostList(conn);
		
		close(conn);
		
		return list;
	}
	
	public StylePost selectPost(int postNo) {
		Connection conn = getConnection();
		
		StylePost sp = new StyleDao().selectPost(conn, postNo);
		
		close(conn);
		
		return sp;
	}
	
	public ArrayList<StylePost> selectPostImgList(){
		Connection conn = getConnection();
		// 총 게시물의 수
		ArrayList<StylePost> list = new StyleDao().selectPostImgList(conn);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<ArrayList<PostImg>> selectPostImgList2(){
		// 한 개의 게시물의 이미지 수
		Connection conn = getConnection();
		ArrayList<StylePost> list = new StyleDao().selectPostImgList(conn);
		ArrayList<ArrayList<PostImg>> list2 = new ArrayList<>();
		
		for(int i=0; i<list.size(); i++) {
			list2.add(new StyleDao().selectPostImgList2(conn,  list.get(i).getPostNo()));			
		}
		
		
		close(conn);
		
		return list2;
	}
	
	
	public ArrayList<StylePost> selectHtList(){
		
		Connection conn = getConnection();
		
		ArrayList<StylePost> list = new StyleDao().selectHtList(conn);
		
		close(conn);
		
		return list;
	}
	
	public int insertFollow(Follow f) {
		Connection conn = getConnection();
		
		int result = new StyleDao().insertFollow(conn, f);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int insertPostLike(PostLike pl) {
		Connection conn = getConnection();
		
		int result = new StyleDao().insertPostLike(conn, pl);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
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
	
	public PostImg selectPostImg(int postNo) {
		Connection conn = getConnection();
		
		PostImg pi = new StyleDao().selectPostImg(conn, postNo);
		
		close(conn);
		
		return pi;
	}
	

}
