<%@ page import= "com.smf.admin.model.vo.Notice"%>
<%@ page import="com.smf.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member) session.getAttribute("loginUser");
	
%>
<%
	Notice n = (Notice) request.getAttribute("n");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
</head>
<style>
    div {
        box-sizing: border-box;
        border : 1px solid blue;
    }    
    
    p{
    	height:150px;
    }               
    
    
    
    .content{
    margin-left: auto;
    margin-right: auto;
    max-width: 1280px;
    }


    .container .customer .lg{
        margin-left : auto;
        margin-right : auto;
        max-width: 1280px;

    }

    .container .customer .snb_area{
        float : left;
        width:  160px;
        margin-right: 40px;
    }
    .content_title.border{
        padding-bottom: 16px;
        border-bottom: 3px solid #222;
    }
    .title>h3{
        line-height: 29px;
        font-size: inherit;
       
    }
    .title>div{
       display: inline-block;
        
    }
    .test{
        display:flex;
        float: right;
    }
    

    .dropdown_head .title_box{
        margin-right: 10px;
    }

    .container.customer .content_area{
        overflow:hidden
    }

    .content_area{
        margin: 0 auto;
    padding: 60px 0 160px;
    width: 400px;
    }
    .dropdown_head{
        padding: 17px 0 19px;
        align-items: center;
        border-bottom : 1px solid #ebebeb;
        cursor: pointer
    }

    .dropdown_head .title_box {
        margin-right: 10px;
    }

    .dropdown_head date{
        margin-bottom: 1px;
        display : inline-flex;
        font-size : 12px;
        letter-spacing: -.06px;
    }

    .dropdown_head .title{
        font-size: 15px;
        letter-spacing: -.15px;
    }
    .dropdown_content{
        display: block;
    }

    .dropdown_content{
        padding: 30px 30px 28px;
        background-color: #fafafa;
        border-bottom: 1px solid #ebebeb;
        font-size: 14px;
        letter-spacing: -.21px;
    }
    .dropdown_content .content{
        max-width: 640px;
        word-break: break-word;
    }

    .btn_list{
        margin-top : 30px;
        text-align: center;
    }

    body, button, div, p, h3, h4 ,h5, h6, input, form{
        margin:0;
        padding:0;
    }

    
</style>
<body>
 <jsp:include page="adminform.jsp"></jsp:include>
    <div class="wrap">
   
        <div class= "content lg">
            <div class="sub_area">

            </div>

                <div class="content_area">
                    <div class="content_title border">
                        <div class="title">
                            <div>
                            <h3>공지사항</h3>
                            </div>
                            <div class="test">
                           	<% if(loginUser != null && loginUser.getUserId().equals("admin@naver.com")) {%>
                                <a href="<%=contextPath %>/updateForm.no?nno=<%=n.getAlertNo() %>" class="btn btn warning btn-sm">수정</a>
                                <a href="<%=contextPath %>/delete.no?nno=<%=n.getAlertNo() %>" class="btn btn danger  btn-sm">삭제</a>
                            <%} %>
                            </div>
                        </div>      
                      
                        
                          
                    </div>
                
                <div class="dropdown">
                    <div class="dropdown_head">
                        <div class="title_box">
                            <span class="date"><%= n.getCreateDate() %></span>
                            <p class="title"><%= n.getAlertCategory() %> <%= n.getAlertTitle() %> </p>
                        </div>
                    </div>
                    <div class="dropdown_content">
                        <div class="content">
							<p><%=n.getAlertContent() %></p>
                        </div>
                    </div>
                </div>
                <div class="btn_list">
                    <a href="<%= contextPath %>/list.no" class="btn outlinegreymedium">목록보기</a>
                </div>

            </div>




            
            
            
        </div>
    </div>
    
</body>
</html>