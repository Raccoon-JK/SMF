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
			// JMS ���� ���丮 ����
			ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://localhost:61616");

			// ���� ����
			connection = connectionFactory.createConnection();
			connection.start();

			// ���� ����
			Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);

			// �޽��� ť ����
			Destination destination = session.createQueue("notificationQueue");

			// �޽��� �۽��� ����
			MessageConsumer consumer = session.createConsumer(destination);

			// �޽��� ����
			Message message = consumer.receive();

			// ������ �޽��� �б�
			if (message instanceof TextMessage) {
				TextMessage textMessage = (TextMessage) message;
				String text = textMessage.getText();

				// modal â�� �˸� ǥ��
				PrintWriter out = response.getWriter();
				out.println("<script>alert('" + text + "');</script>");
			}

		} catch (JMSException e) {
			e.printStackTrace();
		} finally {
			// ���� ����
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
