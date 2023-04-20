package com.smf.main.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;

@WebServlet("/WeatherCoding.wc")
public class WeatherCodingController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public WeatherCodingController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String urlStr = "http://localhost:8080/SMF_Project/Weather.we";

        URL url = new URL(urlStr);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();

        con.setDoOutput(true);
        con.setRequestMethod("GET");

        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));

        String line;
        String resultLine = "";

        while ((line = in.readLine()) != null) {
            resultLine += line;
        }

        in.close();

        Document xml = null;
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            xml = builder.parse(new ByteArrayInputStream(resultLine.getBytes()));
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (xml != null) {
            XPath xpath = XPathFactory.newInstance().newXPath();
            Node fcstValue6;
            Node fcstValue7;

            try {
                fcstValue6 = (Node) xpath.evaluate("//item[6]/fcstValue", xml, XPathConstants.NODE);
				/*
				 * fcstValue7 = (Node) xpath.evaluate("//item[7]/fcstValue", xml,
				 * XPathConstants.NODE);
				 */

                String fcstValue6Str = fcstValue6.getTextContent();
				/* String fcstValue7Str = fcstValue7.getTextContent(); */

                String result = fcstValue6Str;
                		/*fcstValue6Str + " / 7번째 값 : " + fcstValue7Str;*/
                response.getWriter().write(result);
                System.out.println(result);

            } catch (XPathExpressionException e) {
                e.printStackTrace();
            }
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
