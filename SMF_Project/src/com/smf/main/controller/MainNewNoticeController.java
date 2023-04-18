package com.smf.main.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smf.main.model.vo.SseClient;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@WebServlet(name = "NotificationServlet", urlPatterns = { "/notification" })
public class MainNewNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ExecutorService executorService = Executors.newCachedThreadPool();
	private final List<SseClient> clients = new CopyOnWriteArrayList<>();
	
	final String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	final String DB_USER = "PASSION";
	final String DB_PASSWORD = "PASSION";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/event-stream;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Connection", "keep-alive");

		HttpSession session = request.getSession(true);

		SseClient sseClient = new SseClient(response, session.getId());
		clients.add(sseClient);

		executorService.execute(() -> {
			try {
				while (!Thread.currentThread().isInterrupted()) {
					// 테이블에서 데이터가 insert될 때까지 대기
					Thread.sleep(1000);

					// 데이터가 insert되면 클라이언트에게 알림 메시지 전송
					String message = getNotificationMessage();
					if (message != null) {
						sseClient.send(message);
					}
				}
			} catch (IOException | InterruptedException e) {
				e.printStackTrace();
			}
		});
	}

	// 테이블에서 데이터가 insert되면 알림 메시지를 생성하여 반환하는 메소드
	private String getNotificationMessage() {
	    String message = null;

	    // XML 파일에서 SQL문을 가져와서 실행
	    try {
	        InputStream inputStream = getClass().getResourceAsStream("sql.xml");
	        Properties properties = new Properties();
	        properties.loadFromXML(inputStream);

	        String query = properties.getProperty("Main_New_Notice");

	        Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	        Statement statement = connection.createStatement();
	        ResultSet resultSet = statement.executeQuery(query);

	        // 데이터가 insert 되었는지 확인
	        if (resultSet.next()) {
	            message = "새로운 알림이 있습니다.";
	        }

	        // 리소스 반환
	        resultSet.close();
	        statement.close();
	        connection.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return message;
	}

	@Override
	public void destroy() {
		clients.forEach(SseClient::close);
		executorService.shutdownNow();
	}
}