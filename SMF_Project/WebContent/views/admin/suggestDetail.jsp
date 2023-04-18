<%@ page import= "com.smf.shop.model.vo.Stock"%>
<%@ page import="com.smf.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member) session.getAttribute("loginUser");
	
%>
<%
	Stock s = (Stock) request.getAttribute("s");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매제안</title>
</head>
<style>
    
    
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
        padding-bottom: 0;
        border-bottom: 1px solid #black;
    }
    
    .title{
    	border-bottom: .3rem solid black;
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
     box-sizing: border-box;
     border : 1px solid #ebebeb;
     margin: 0 auto;
     padding: 60px 0 10px;
     width: 900px;
    }
    .dropdown_head{
        padding: 15px 0 0px;
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
   		height: 400px;
        padding: 30px 30px 28px;
        background-color: #fafafa;
        border-bottom: 1px solid #ebebeb;
        font-size: 14px;
        letter-spacing: -.21px;
    }
    .dropdown_content .content{
        max-width: 900px;
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
    
    .suggestdetail_all{
    
   	 padding: 200px 300px 200px 300px;	
    }
    
    
	

    
</style>
<body>
 <jsp:include page="adminform.jsp"></jsp:include>
 <jsp:include page="/views/common/menubar.jsp"></jsp:include>
    <div class="suggestdetail_all">
   
        <div class= "content lg">
            <div class="sub_area">

            </div>

                <div class="content_area">
                    <div class="content_title border">
                        <div class="title">
                            <div class="suggest_underline">
                            <h3>판매제안서 상세보기</h3>
                            </div>
                            <div class="test">
                           	<% if(loginUser != null && loginUser.getUserId().equals("admin@naver.com")) {%>
                                <a href="" class="btn btn warning btn-sm">수정</a>
                                <a href="" class="btn btn danger  btn-sm">삭제</a>
                            <%} %>
                            </div>
                        </div>      
                      
                        
                          
                    </div>
                
                <div class="dropdown">
                    <div class="dropdown_head">
                        <div class="title_box">
                            <span class="date"><%= s.getSuggestDate() %></span>
                            <p class="pdname"><%= s.getProductName() %>  </p>
                            <p class="username"><%= s.getUserId() %></p>
                        </div>
                    </div>
                    <div class="dropdown_content">
                        <div class="content">
							<h6>상품명  :  <%= s.getProductName()%></h6>
							<h6>판매가격 :  <%= s.getPrice()%></h6>
							<h6>사이즈  :  <%=s.getSize() %></h6>
							<h6>수량   : <%= s.getStock()%></h6>
							<h6>제안자  : <%= s.getUserId()%></h6>
							<h6>제안일자 : <%=s.getSuggestDate() %></h6>
                        </div>
                    </div> 
                </div>
                <div class="btn_list">
                    <a href="<%= contextPath %>/suggestlist.no" class="btn btn-success btn-block">목록보기</a>
                </div>

            </div>




            
            
            
        </div>
    </div>
     <jsp:include page="/views/common/footer.jsp"></jsp:include>
</body>
</html>