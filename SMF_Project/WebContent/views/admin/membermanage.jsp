<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smf.member.model.vo.Member" %>
<%@ page import="java.util.ArrayList, com.smf.admin.model.vo.Notice" %>    
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");

%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%
	String contextPath = request.getContextPath();

	Member loginUser = (Member) session.getAttribute("loginUser");
	
	int index =1;
	
	String alertMsg = (String) session.getAttribute("alertMsg");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    div {
        box-sizing: border-box;
        border : 1px solid blue;
    }                   
    
    .wrap { 
    position: relative;
    padding-top: 10rem;
    overflow-anchor: none;

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
    

  
   

   .tabletest{
    display: flex;
    justify-content: center;
   }


    .btn_list{
        margin-top : 30px;
        text-align: center;
    }

    body, button, div, p, h3, h4 ,h5, h6, input, form{
        margin:0;
        padding:0;
    }
    table{
        max-width: 1280px;
    }

    
</style>
<body>
 <jsp:include page="adminform.jsp"></jsp:include>
    <div class="wrap">
   
        <div class= "content lg">
                    <div class="content_title border">
                        <div class="title">
                            
                            <h2>회원정보 조회</h2>
                           
                            <div class="test">
                                <input type="button" value="수정하기">
                                <input type="button" value="삭제하기">
                            </div>
                        </div>      
                      
                        
                          
                    </div>
                
              
                   
                    
                        <div class="content">
                          
                         
                            <div class="tabletest">
                            <table border="1">
                              <thead>
                                <tr>
                                  <th width="100">등록일</th>
                                  <th>이름</th>
                                  <th>이메일</th>
                                  <th>휴대폰</th>
                                  <th width="300">배송지</th>
                                  <th width="110">이메일 수신여부</th>
                                </tr>
                              </thead>
                              <tbody>
                              	<%if(list.isEmpty()) {%>
                              	  <tr>
                              	  	<td colspan ="6"> 회원이 없습니다 </td>
                              	  </tr>
                              	<%}else {%> 
                              	<% for (Member m : list){ %>
                              		<tr>
                              			<td><%= m.getEnrollDate() %></td>
                              			<td><%= m.getUserName() %></td>
                              			<td><%= m.getUserId() %></td>
                              			<td><%= m.getPhone()%></td>
                              			<td><%= m.getAddress() %></td>
                              			<td><%= m.getAgreeEmail() %></td>
                              		</tr> 
                              <% }%>
							<%} %>                             
                                
                                  
                                <!-- 검색 결과에 따른 동적 테이블 데이터 삽입 -->
                              </tbody>
                            </table>
                            </div>
                        </div>
                    
               
                <div class="btn_list">
                    <a href="" class="btn outlinegreymedium">목록보기</a>
                </div>

            </div>




            
            
            
        </div>
    
    
</body>
</html>