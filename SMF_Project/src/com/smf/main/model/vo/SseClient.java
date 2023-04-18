package com.smf.main.model.vo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.AsyncContext;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class SseClient {
    private AsyncContext asyncContext;
    private PrintWriter writer;

    public SseClient(AsyncContext asyncContext) throws IOException {
        this.asyncContext = asyncContext;
        ServletResponse response = asyncContext.getResponse();
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.setContentType("text/event-stream;charset=UTF-8");
        httpServletResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        httpServletResponse.setHeader("Pragma", "no-cache");
        httpServletResponse.setHeader("Expires", "0");
        this.writer = httpServletResponse.getWriter();
    }

    public void send(String eventName, String data) {
        writer.write("event: " + eventName + "\n");
        writer.write("data: " + data + "\n\n");
        writer.flush();
    }

    public void close() {
        asyncContext.complete();
    }
}

