package com.smf.main.model.service;

import static com.smf.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.smf.main.model.dao.MainNoticeDao;
import com.smf.main.model.vo.MainNotice;

public class MainNoticeService {

    public ArrayList<MainNotice> getNotice() {
        Connection conn = getConnection();
        
		ArrayList<MainNotice> noticeList = new MainNoticeDao().getNotice(conn);
		
        close(conn);
        
        return noticeList;
    }
}

