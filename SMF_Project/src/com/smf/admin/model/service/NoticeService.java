package com.smf.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.smf.common.JDBCTemplate.*;

import com.smf.admin.model.dao.NoticeDao;
import com.smf.admin.model.vo.Notice;
import com.smf.shop.model.vo.Stock;


public class NoticeService {

	public ArrayList<Notice> selectNoticeList(){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		
		close(conn);
		
		
		return list; 	
	}
	
	public Notice selectNotice(int nno) {
		
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectNotice(conn, nno);
		
		
		close(conn);
		
		return n;
		
	}
	
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	
	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
			
		
	}
	
	public int deleteNotice(int nno) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, nno);
		
		if(result> 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	public ArrayList<Notice> selectFaqNoticeList(){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectFaqNoticeList(conn);
		
		
		close(conn);
		
		
		return list; 	
	}
	
	public int insertFaq(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertFaq(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	public Notice selectfaqNotice(int nno) {
		
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectfaqNotice(conn, nno);
		
		
		close(conn);
		
		return n;
		
	}
	
	public int updatefaqNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().updatefaqNotice(conn, n);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
			
		
	}
	
	
	
	public int deletefaqNotice(int nno) {
		Connection conn = getConnection();
		
		int result = new NoticeDao().deletefaqNotice(conn, nno);
		
		if(result> 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public ArrayList<Stock> selectSuggestList(){
		Connection conn = getConnection();
		
		ArrayList<Stock> list = new NoticeDao().selectSuggestList(conn);
		
		
		close(conn);
		
		
		return list; 	
	}
	
	
	public Stock selectSuggest(int nno) {
		
		Connection conn = getConnection();
		
		Stock s = new NoticeDao().selectSuggest(conn, nno);
		
		
		close(conn);
		
		return s;
		
	}
}
