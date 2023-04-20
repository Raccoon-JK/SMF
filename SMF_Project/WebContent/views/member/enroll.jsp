<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/SMF_Project/resources/member/css/enroll.css">
<title>TEST</title>

</head>
<style>

@charset "utf-8";



 body, button, input, select, table, textarea {
    font-family: 'Noto Sans KR', sans-serif;
    color: #222;
}

html { font-size : 62.5% }

html, body, div, span, iframe, h1, h2, h3, h4, h5, h6, p, a, em, img, ins, small, strong, sub, sup, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, button, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, footer, header, nav, section, summary, time, mark { margin: 0; padding: 0; box-sizing: border-box; }

ul, ol, li { list-style: none; }

a, a:link, a:visited, a:hover, a:focus { text-decoration: none; color: inherit; }

img, fieldset, a { border: none;}

img, video { border: 0; vertical-align: top; }

input, select, textarea, button, form, img, label { vertical-align: middle; }

input, textarea {
    padding: 0;
    outline: 0;
    border: 0;
    resize: none;
    border-radius: 0;
    background-color: rgba(0,0,0,0);
}

input[type=text], input[type=number], input[type=password], input[type=tel], input[type=email] {
    box-sizing: border-box; 
    display: inline-block; 
    line-height: normal;
}

textarea { box-sizing: border-box; padding: .08rem; border: .1rem solid #ccc; font-size: 1.6rem; }

.container { overflow: hidden; position: relative; }

.wrap { position:relative; padding-top:10rem; overflow-anchor:none }

.blind, .u_skip {
    overflow: hidden!important;
    position: absolute!important;
    clip: rect(0,0,0,0)!important;
    width: .1rem!important;
    height: .1rem!important;
    margin: -1rem!important;
}

.title { font-size: 1.5rem; }

input, textarea {
    padding: 0;
    outline: 0;
    border: 0;
    resize: none;
    border-radius: 0;
    background-color: rgba(0,0,0,0);
}

.full {
    width: 100%;
    font-size: 1.6rem;
    letter-spacing: -.1rem;
    font-weight: 700;
    height: 52px;
    line-height: 50px;
    border-radius: 1.2rem;
}

.btn {
    display: inline-block;
    cursor: pointer;
    vertical-align: middle;
    text-align: center;
    background-color: #fff;
}

.btn {
    margin-top: 1.2rem;
    -ms-flex-item-align: start;
    align-self: flex-start;
}

.date { font-size: 1.4rem; }

.tab_item { display: table-cell; text-align: center; }

.tab_link { position: relative; display: block; padding-top: 1.8rem; height: 9.6rem;
}




.content{
    margin-left: auto;
    margin-right: auto;
    max-width: 1280px;
}


.join_area{
    margin: 0 auto;
    padding: 60px 0 160px;
    width: 500px;
}

.join_title { 
    padding-bottom: 20px; 
    text-align: center; 
    width: 100%;
    font-size: 3rem;
    letter-spacing: -.015rem;
    line-height: 2.2rem;
    }

.join_btn_box { padding-top: 4.5rem;}

.join_btn_box .btn+.btn { margin-top: .8rem;}

.solid { background-color: #222; color: #fff;}

.solid.disabled, .solid:disabled {
    background-color: #ebebeb;
    color: #fff;
    cursor: default;
}    

.input_txt {
    padding: .8rem 0;
    width: 100%;
    font-size: 1.5rem;
    letter-spacing: -.015rem;
    line-height: 2.2rem;
    border-bottom: .2rem solid #ebebeb;
}

.birth_box{
	
    padding: .8rem 0;
    width: 100%;
    font-size: 1.5rem;
    letter-spacing: -.015rem;
    line-height: 2.2rem;
    border-bottom: .2rem solid #ebebeb;
}
.radio_agree{
    padding: 0rem 0;
    width: 100%;
    letter-spacing: -.015rem;
    line-height: 2.2rem;
    border-bottom: .2rem solid #ebebeb;
}

#dd{
    text-align: center;
}

.input_txt { padding-right: 3rem; height: 3.8rem; }

.email_disagree, .email_agree{
    height: 50px;
    width: px;
    font-size: 20px;
}

</style>

<body>
    <div class="wrap">
    <jsp:include page="/views/common/menubar_sun.jsp"></jsp:include>
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
        <jsp:include page="/views/common/footer.jsp"></jsp:include>
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

