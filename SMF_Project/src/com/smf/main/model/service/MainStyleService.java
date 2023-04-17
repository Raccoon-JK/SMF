package com.smf.main.model.service;

import static com.smf.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.smf.main.model.dao.MainStyleDao;
import com.smf.main.model.vo.MainStyle;

public class MainStyleService {

    public ArrayList<MainStyle> getStyle() {
        Connection conn = getConnection();
        
		ArrayList<MainStyle> productList = new MainStyleDao().getStyle(conn);
		
        close(conn);
        
        return productList;
    }
    
}

