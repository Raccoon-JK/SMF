package com.smf.shop.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.smf.common.MyFileRenamePolicy;
import com.smf.member.model.vo.Member;
import com.smf.shop.model.service.ShopService;
import com.smf.shop.model.vo.Product;
import com.smf.shop.model.vo.Product_Detail;
import com.smf.shop.model.vo.Product_Img;
import com.smf.shop.model.vo.Stock;

/**
 * Servlet implementation class postInsertController
 */
@WebServlet("/insert.sh")
public class postInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public postInsertController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 메인사진업로드

		if (ServletFileUpload.isMultipartContent(request)) {

			// 1_1. 전송용량제한
			int maxSize = 10 * 1024 * 1024;

			// 1_2. 저장할 폴더의 물리적 경로 제시
			String savePath = request.getSession().getServletContext().getRealPath("/resources/shop/thumb_upfiles/");

			// 2. 전달된 파일명 수정작업 후 서버에 업로드
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());
			
			String pName = multi.getParameter("productName");
			String userId = ((Member) request.getSession().getAttribute("loginUser")).getUserId() + ""; // 로그인 유저 아이디 정보
			String userClass = ((Member) request.getSession().getAttribute("loginUser")).getUserType() + "";
			
			// 넘어오는 <input type="file" multiple>확인용도
//			Enumeration f = multi.getFileNames();
//			while (f.hasMoreElements()) {
//				String fileName = (String) f.nextElement();
//				String imgName = multi.getFilesystemName(fileName);
//				
//				System.out.println(fileName);
//				System.out.println(imgName);
//			}
			
			// 넘어오는 form안의 데이터들 확인 용도
//			Enumeration e = multi.getParameterNames();
//			while (e.hasMoreElements()) {
//				String name = (String) e.nextElement();
//				String[] values = multi.getParameterValues(name);
//				for (String value : values) {
//					System.out.println("name=" + name + ",value=" + value);
//				}
//			}
			
			// 3. DB에 저장
			// Product에 들어갈 값들 뽑아오기
			Product p = new Product();

			p.setBrandName(multi.getParameter("brandName"));
			p.setProductName(pName);
			p.setCategoryNo(Integer.parseInt(multi.getParameter("subCategory")));
			p.setProductGender(multi.getParameter("productGender"));
			p.setProductWeather(multi.getParameter("productWeather"));

			// 희망가격, 수량, 사이즈, 수량 >> 재고
			Stock s = new Stock();
			s.setUserId(userId);
			s.setProductName(pName);
			s.setPrice(Integer.parseInt(multi.getParameter("price")));
			s.setStock(Integer.parseInt(multi.getParameter("stock")));
			s.setSize(multi.getParameter("size"));
			s.setUserClass(userClass);

			// 상세정보 >> 상품상세
			Product_Detail pd = new Product_Detail();
			pd.setProductName(pName);
			pd.setProductContent(multi.getParameter("content"));
			
			// Attachment테이블에 여러번 insert할 데이터를 뽑기
			// 단, 여러개의 첨부파일이 있을것이기 때문에 attachment들을 ArrayList에 담을 예정 => 반드시 1개 이상은 담김(대표이미지)
			// >> Product_Img?
			int result = new ShopService().insertProduct(p, s, pd);
			
			if (result > 0) { // 성공 -> list.th를 요청
				
				// 상품 이미지
				int imgresult = 0;
				Enumeration f = multi.getFileNames();
				while (f.hasMoreElements()) {
					String fileName = (String) f.nextElement();
					String imgName = multi.getFilesystemName(fileName);
					
					System.out.println(fileName);
					System.out.println(imgName);
					
					Product_Img pi = new Product_Img();

					pi.setProductName(pName);
					pi.setImgName(imgName);
					pi.setImgPath("/resources/thumb_upfiles/");
					imgresult += new ShopService().insertProductImg(pi);
				}
				if(imgresult > 0) {
					response.sendRedirect(request.getContextPath());
				}
			} else {

			}

		}
	}
}
