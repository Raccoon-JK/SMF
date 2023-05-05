package com.smf.main.controller;

import java.io.IOException;
import java.net.URL;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WeatherNumber.wn")
public class WeatherNumberController extends HttpServlet {
    
    private String weather;
    
    public void init() throws ServletException {
        // doGet() 메서드 실행
        try {
			doGet(null, null);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        URL url = new URL("http://localhost:8085/SMF_Project/WeatherCoding.wc");
        Scanner scanner = new Scanner(url.openStream());

        // HTML 문서에서 숫자를 추출
        scanner.useDelimiter("\\D+");
        int number = scanner.nextInt();
        // 숫자를 저장
        weather = Integer.toString(number);
        
        scanner.close();
    }
    
    public String getWeather() {
        return weather;
    }
}
