package com.smf.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.main.model.service.MainNoticeService;
import com.smf.main.model.vo.MainNotice;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/Notice.no")
public class MainNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<MainNotice> noticeList = new MainNoticeService().getNotice();

		
        // 조회한 공지 정보를 JSON 형식으로 변환
        String json = "[";
        for (int i = 0; i < noticeList.size(); i++) {
            MainNotice notice = noticeList.get(i);
            json += "{";
            json += "\"title\":\"" + notice.getAlertTitle() + "\"";
            json += "}";
            if (i < noticeList.size() - 1) {
                json += ",";
            }
        }
        json += "]";

        // JSON 형식으로 변환된 데이터를 HTTP 응답에 담아서 전송
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}