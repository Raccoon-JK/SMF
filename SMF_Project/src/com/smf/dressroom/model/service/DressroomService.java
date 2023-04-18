package com.smf.dressroom.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.smf.common.JDBCTemplate.*;

import com.smf.dressroom.model.dao.DressroomDao;
import com.smf.shop.model.vo.ProductAll;

public class DressroomService {

	public ArrayList<ProductAll> categoryItemList(String categoryName){
		
		Connection conn = getConnection();
		
		ArrayList<ProductAll> list = new DressroomDao().categoryItemList(conn, categoryName);
		
		close(conn);
		
		return list;
	}
}
