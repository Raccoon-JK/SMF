package com.smf.shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.smf.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import com.smf.shop.model.service.ShopService;
import com.smf.shop.model.vo.Category_Sub;
import com.smf.shop.model.vo.Product_Img;

/**
 * Servlet implementation class subCategoryController
 */
@WebServlet("/subCat.sh")
public class subCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public subCategoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cat = request.getParameter("category");

		ArrayList<Category_Sub> list = new ShopService().list(cat);
		
		request.setAttribute("list", list);
		
		response.setContentType("apllication/json; charset=UTF-8");

		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
