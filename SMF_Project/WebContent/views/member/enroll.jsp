<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/SMF_Project/resources/member/css/enroll.css">
<title>TEST</title>

</head>
<body>
    <div class="wrap">
        <div class="container join">
            <!-- 회원가입 영역 -->
            <div class="content lg">
                <div class="join_area">
                    <h2 class="join_title">회원가입</h2>
                    <form action="<%=request.getContextPath()%>/insert.me" method="post" id="join_form">
                    <div class="input_box" id="email_input_box">
                        <h3 class="input_title ess">이메일 주소</h3>
                        <div class="input_item">
                            <input type="text" placeholder="예) kream@kream.co.kr" class="input_txt in_essValue" id="uid" name="email" required>
                        </div>
                        <p class="input_error" id="email_input_error"></p>
                    </div>
                    <!---->
                    <div class="input_box" id="name_input_box">
                        <h3 class="input_title ess">이름(*)</h3>
                        <div class="input_item">
                            <input type="text" placeholder="이름을 입력하세요" class="input_txt" id="uname" name="name" required>
                        </div>
                    </div>

                    <div class="input_box has_button" id="password_input_box">
                        <h3 class="input_title ess">비밀번호</h3>
                        <div class="input_item">
                            <input type="password" placeholder="영문, 숫자, 특수문자 조합 8-16자"  class="input_txt" id="upwd" name="password" maxlength="16" required>
                        </div>
                        <p class="input_error" id="password_input_error"></p>
                    </div>

                    <div class="input_box" id="passwordcheck_input_box">
                        <h3 class="input_title ess">비밀번호 확인</h3>
                        <div class="input_item">
                            <input type="password" placeholder="비밀번호 확인"class="input_txt" id="urepwd" maxlength="16" required>
                        </div>
                    </div>
                    


                    <div class="input_box" id="tell_input_box">
                        <h3 class="input_title ess">휴대폰 번호</h3>
                        <div class="input_item">
                            <input type="text" placeholder="휴대폰 번호('-'제거 후 입력해주세요.)" class="input_txt" id="uphone" name="phone" maxlength="11" required>
                        </div>
                    
                    </div>

                    <div class="input_box" id="birth_input_box">
                        <h3 class="input_title ess">생년월일</h3>

                       <div class="birth_box" id="birth_input_box">
                        <label>
                            <input type="text" name="yy" id="yy" placeholder="년(4자)" maxlength="4" required> 
                            <select class="box" id="birth-mm" name="mm">
                                <option value="">월 선택 </option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                             월
                        </label> 
                        <input type="text" name="dd" id="dd" placeholder="일(2자)" maxlength="2" required>  일
                        </div> 
                    </div>
                    
                    <div class="input_box" id="email_agree">
                        <h3 class="input_title ess">이메일 수신여부</h3>
                   
                      <div class="radio_agree">
                        <label><input type="radio" name="agree"  value="Y" id="uagree" class="email_agree">동의</label>
                        <label><input type="radio" name="agree"  value="N" id="udisagree" class="email_disagree">비동의</label>
                        
                       </div>  
                    </div>

                    <div class="join_btn_box">
                        <input type="button" class="btn full solid disabled" id="join_btn" value="가입하기" onclick="joinform_check();"></input>
                    </div>
                    
                    </form>       
                    </div>
                </div>
        </div>
    </div>
    

    <script>
        function joinform_check(){
            var uid = document.getElementById("uid");
            var uname= document.getElementById("uname");
            var upwd = document.getElementById("upwd");
            var urepwd = document.getElementById("urepwd");
            var uphone = document.getElementById("uphone");
            var ubirth = document.getElementById("ubirth");
            var uagree = document.getElementById("uagree");
            var udisagree = document.getElementById("udisagree");

            
            var emailCheck = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$/g;
            
            if(! emailCheck.test(uid.value)){
                alert("아이디를 이메일형식으로 입력하세요");
                uid.focus();
                return false;
            };

            if (uname.value == "") {
                alert("이름을 입력하세요.");
                uname.focus();
                return false;
            };

            var upwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

            if(upwd.value == ""){
                alert("비밀번호를 입력하세요");
                upwd.focus();
                return false;
            }

            if (!upwdCheck.test(upwd.value)) {
                alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
                upwd.focus();
                return false;
            };

            
            if (urepwd.value !== upwd.value) {
                alert("비밀번호가 일치하지 않습니다.");
                urepwd.focus();
                return false;
            };

            var reg = /^[0-9]{11}/g;
           	if(!reg.test(uphone.value)){
                alert("올바른 전화번호 형식이 아닙니다 .");
                uphone.focus();
                return false;
            }
           

            
           if(!uagree.checked && !udisagree.checked) {
                alert("이메일 수신여부를 선택해주세요 ");
                uagree.focus();
                return false;
            }  
            
            var join_form = document.getElementById("join_form")
            join_form.submit();
          }

    </script>
    
    
</body>
</html>

