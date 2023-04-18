package com.smf.main.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class MainNewCommentController {
    private static Connection connection = null;

    public static Connection getConnection() throws SQLException {
        if (connection == null) {
            // 데이터베이스 접속 정보 설정
            Properties props = new Properties();
            props.setProperty("user", "PASSION");
            props.setProperty("password", "PASSION");
            props.setProperty("ssl", "false");

            // 데이터베이스 접속
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", props);
        }
        return connection;
    }

    public static void executeXml(String xml) throws SQLException {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = MainNewCommentController.getConnection();
            statement = connection.createStatement();
            statement.execute(xml);
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
        }
    }
}