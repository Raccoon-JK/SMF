package com.smf.main.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeController
 */
@WebServlet("/Notice.no")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public NoticeController() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection connection = null;
		try {
			// JMS 연결 팩토리 생성
			ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");

			// 연결 생성
			connection = connectionFactory.createConnection();
			connection.start();

			// 세션 생성
			Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);

			// 메시지 큐 생성
			Destination destination = session.createQueue("notificationQueue");

			// 메시지 송신자 생성
			MessageConsumer consumer = session.createConsumer(destination);

			// 메시지 수신
			Message message = consumer.receive();

			// 수신한 메시지 읽기
			if (message instanceof TextMessage) {
				TextMessage textMessage = (TextMessage) message;
				String text = textMessage.getText();

				// modal 창에 알림 표시
				PrintWriter out = response.getWriter();
				out.println("<script>alert('" + text + "');</script>");
			}

		} catch (JMSException e) {
			e.printStackTrace();
		} finally {
			// 연결 종료
			if (connection != null) {
				try {
					connection.close();
				} catch (JMSException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
