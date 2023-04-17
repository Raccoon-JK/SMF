package com.smf.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smf.main.model.service.MainStyleService;
import com.smf.main.model.vo.MainStyle;

/**
 * Servlet implementation class StyleController
 */
@WebServlet("/Style.st")
public class MainStyleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainStyleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MainStyle> styleList = new MainStyleService().getStyle();

        // 조회한 스타일 정보를 JSON 형식으로 변환
        String json = "[";
        for (int i = 0; i < styleList.size(); i++) {
            MainStyle style = styleList.get(i);
            json += "{";
            json += "\"image\":\"" + "." + style.getImgPath() + style.getImgName() + "\",";
            json += "\"id\":\"" + style.getSnsId() + "\",";
            json += "\"userImg\":\"" + "." + style.getUserImage() + "\"";
            json += "}";
            if (i < styleList.size() - 1) {
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
