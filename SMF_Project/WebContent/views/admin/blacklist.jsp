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
    

  	th{
  	 color:#fff;
  	 background-color: #28a745;
  	 
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
    .membermanagetitle{
    	border-bottom: .3rem solid black;
    }
	.membermanage_all{

	padding: 200px, 300px, 300px, 300px;
	}
	
	.membermanagetable{
		padding : 70px 0px;
	}
	
	
    
</style>
<body>
<jsp:include page="/views/common/menubar_sun.jsp"></jsp:include>
 <jsp:include page="adminform.jsp"></jsp:include>
 
    <div class="wrap">
    		
   <div class="membermanage_all">
        <div class= "content lg">
                    <div class="content_title border">
                        <div class="membermanagetitle">
                            <h2 align="center">블랙리스 조회</h2>
                        </div>      

                    </div>
                
              
                   
                    
                        <div class="content">
                          
                         <div class="membermanagetable">
                            <div class="tabletest">
                            <table border="3" class="membertable">
                              <thead>
                                <tr>
                                  <th width="100" height="30"> 번호</th>                                  
                                  <th width="130">이메일</th>
                                  <th width="130">블랙리스트 날짜</th>
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
                              			<td height="50"><%= m.getEnrollDate() %></td>
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
                        </div>
                    
               
                <div class="btn_list">
                    <a href="" class="btn btn-success ">목록보기</a>
                </div>

            </div>

           
            </div>
             <jsp:include page="/views/common/footer.jsp"></jsp:include>
        </div>
    
    
</body>
</html>