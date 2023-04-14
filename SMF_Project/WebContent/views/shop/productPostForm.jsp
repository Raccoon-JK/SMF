<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>        
        <script src="/semi/resources/ckeditor/translations/ko.js"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
        <link rel="stylesheet" href="../../resources/shop/css/content-styles.css" type="text/css">
        <style>
        
        </style>
    </head>

    <body>
        <form action="<%= contextPath %>/insert.sh" method="POST" enctype="multipart/form-data" id="productPostForm">
            <div id="itemDetail">
                <h2>상품 등록</h2>
                <table>
                    <tr>
                        <td>브랜드 명</td>
                        <td><input type="text" placeholder="브랜드 명 입력" name="brandName"></td>
                    </tr>
                    <tr>
                    <tr>
                        <td>제품 명</td>
                        <td><input type="text" placeholder="제품 명 입력" name="productName"></td>
                    </tr>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><input type="text" placeholder="가격 입력" name="price"></td>
                    </tr>
                    <tr>
                        <td>분류</td>
                        <td>
                            <select name="category" id="category">  
                            	<option>카테고리 선택</option>                                                              
                                <option value="신발">신발</option>
                                <option value="아우터">아우터</option>
                                <option value="상의">상의</option>
                                <option value="하의">하의</option>
                                <option value="가방">가방</option>
                                <option value="지갑">지갑</option>
                                <option value="시계">시계</option>
                                <option value="패션잡화">패션잡화</option>								
                            </select>    
                            <select name="subCategory" id="subCategory" class="categoryDetail"
                                style="display: inline-block;">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>성별</td>
                        <td>
                            <input type="radio" name="productGender" id="male" value="M"><label for="male">남성</label>
                            <input type="radio" name="productGender" id="female" value="F"><label for="female">여성</label>
                        </td>
                    </tr>
                    <tr>
                        <td>사이즈</td>
                        <td>
                            <select name="size" id="">
                                <option value="Free">Free</option>
                                <option value="XXS">XXS</option>
                                <option value="XS">XS</option>
                                <option value="S">S</option>
                                <option value="M">M</option>
                                <option value="L">L</option>
                                <option value="XL">XL</option>
                                <option value="XXL">XXL</option>
                                <option value="XXXL">XXXL</option>
                                <option value="215">215</option>
                                <option value="220">220</option>
                                <option value="225">225</option>
                                <option value="230">230</option>
                                <option value="235">235</option>
                                <option value="240">240</option>
                                <option value="245">245</option>
                                <option value="250">250</option>
                                <option value="255">255</option>
                                <option value="260">260</option>
                                <option value="265">265</option>
                                <option value="270">270</option>
                                <option value="275">275</option>
                                <option value="280">280</option>
                                <option value="285">285</option>
                                <option value="290">290</option>
                                <option value="295">295</option>
                                <option value="300">300</option>
                                <option value="305">305</option>
                                <option value="310">310</option>
                                <option value="315">315</option>
                                <option value="320">320</option>
                                <option value="325">325</option>
                                <option value="330">330</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                                <option value="32">32</option>
                                <option value="33">33</option>
                                <option value="34">34</option>
                                <option value="35">35</option>
                                <option value="36">36</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>날씨</td>
                        <td>
                            <input type="checkbox" name="productWeather" id="clear" value="C"><label for="clear">맑음</label>
                            <input type="checkbox" name="productWeather" id="blur" value="B"><label for="blur">흐림</label>
                            <input type="checkbox" name="productWeather" id="rain" value="R"><label for="rain">비</label>
                            <input type="checkbox" name="productWeather" id="snow" value="S"><label for="snow">눈</label>
                        </td>
                    </tr>
                    <tr>
                        <td>수량</td>
                        <td>
                            <input type="text" name="stock" placeholder="총 수량 입력">
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            상세정보
                        </td>
                        <td>
                            <textarea name="content" id="editor"></textarea>
                        </td>
                    </tr>
                    <tr>
						<th>첨부파일</th>
						<td><input type="file" name="upfile" multiple></td>
					</tr>
                </table>
                <div style="width: 100px; margin: auto;">
                    <button type=button id="submit">확인</button>
                    <button type="reset">취소</button>
                </div>
            </div>
        </form>
    </body>
    <script>
        let editorTxT;
        CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
            toolbar: {
                items: [
                    //'exportPDF', 'exportWord', '|',
                    'findAndReplace', 'selectAll', '|',
                    'heading', '|',
                    'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
                    'bulletedList', 'numberedList', 'todoList', '|',
                    'outdent', 'indent', '|',
                    'undo', 'redo', '|',
                    'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
                    'alignment', '|',
                    'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
                    'specialCharacters', 'horizontalLine', 'pageBreak', '|',
                    'textPartLanguage', '|',
                    'sourceEditing'
                ],
                shouldNotGroupWhenFull: true
            },
            ckfinder: {
                uploadUrl: '<%= request.getContextPath()%>/fileupload.sh'
            },
            language: 'ko',
            list: {
                properties: {
                    styles: true,
                    startIndex: true,
                    reversed: true
                }
            },
            heading: {
                options: [
                    { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                    { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                    { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                    { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
                    { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
                    { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
                    { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
                ]
            },
            placeholder: '내용을 입력하세요.',
            fontFamily: {
                options: [
                    'default',
                    'Arial, Helvetica, sans-serif',
                    'Courier New, Courier, monospace',
                    'Georgia, serif',
                    'Lucida Sans Unicode, Lucida Grande, sans-serif',
                    'Tahoma, Geneva, sans-serif',
                    'Times New Roman, Times, serif',
                    'Trebuchet MS, Helvetica, sans-serif',
                    'Verdana, Geneva, sans-serif'
                ],
                supportAllValues: true
            },
            fontSize: {
                options: [10, 12, 14, 'default', 18, 20, 22],
                supportAllValues: true
            },
            htmlSupport: {
                allow: [
                    {
                        name: /.*/,
                        attributes: true,
                        classes: true,
                        styles: true
                    }
                ]
            },
            htmlEmbed: {
                showPreviews: true
            },
            link: {
                decorators: {
                    addTargetToExternalLinks: true,
                    defaultProtocol: 'https://',
                    toggleDownloadable: {
                        mode: 'manual',
                        label: 'Downloadable',
                        attributes: {
                            download: 'file'
                        }
                    }
                }
            },
            mention: {
                feeds: [
                    {
                        marker: '@',
                        feed: [
                            '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
                            '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
                            '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
                            '@sugar', '@sweet', '@topping', '@wafer'
                        ],
                        minimumCharacters: 1
                    }
                ]
            },
            removePlugins: [
                'ExportPdf',
                'ExportWord',
                'CKBox',
                'EasyImage',
                'RealTimeCollaborativeComments',
                'RealTimeCollaborativeTrackChanges',
                'RealTimeCollaborativeRevisionHistory',
                'PresenceList',
                'Comments',
                'TrackChanges',
                'TrackChangesData',
                'RevisionHistory',
                'Pagination',
                'WProofreader',
                'MathType'
            ]
        })
        .then( newEditor => {
        	editorTxT = newEditor;
        })
        .catch( error => {
            console.log(error);
        });

//         $('#category').change(function () {
//             if ($(this).val() == '신발') {
//                 $('.categoryDetail').css('display', 'none');
//                 $('#shoeCategory').css('display', 'inline-block');
//             } else if ($(this).val() == '아우터') {
//                 $('.categoryDetail').css('display', 'none');
//                 $('#outerCategory').css('display', 'inline-block');
//             } else if ($(this).val() == '상의') {
//                 $('.categoryDetail').css('display', 'none');
//                 $('#topCategory').css('display', 'inline-block');
//             } else if ($(this).val() == '하의') {
//                 $('.categoryDetail').css('display', 'none');
//                 $('#bottomCategory').css('display', 'inline-block');
//             } else if ($(this).val() == '가방') {
//                 $('.categoryDetail').css('display', 'none');
//                 $('#bagCategory').css('display', 'inline-block');
//             } else if ($(this).val() == '지갑') {
//                 $('.categoryDetail').css('display', 'none');
//                 $('#walletCategory').css('display', 'inline-block');
//             } else if ($(this).val() == '시계') {
//                 $('.categoryDetail').css('display', 'none');
//                 $('#watchCategory').css('display', 'inline-block');
//             } else if ($(this).val() == '패션잡화') {
//                 $('.categoryDetail').css('display', 'none');
//                 $('#accessoryCategory').css('display', 'inline-block');
//             }
//         });

        
        let a = $("#category option:selected").val();
        $('#category').change(function () {
            let category = $("#category option:selected").val();
            console.log(category);
        	$.ajax({
				url : "<%=contextPath%>/subCat.sh",
				data : {category},
				success : function(data){
					console.log(data);
					let str = "";
					for(let i = 0; i < data.length; i++) {
						str += '<option value= '+data[i].subCategoryNo+'>'
							+ data[i].subCategoryName
							+ "</option>"
					}
					$("#subCategory").html(str);
				},
				error : function(){
					console.log("통신실패");
				}
				
			})
        });
        

        $('#submit').click(function(){
			let form = $("#productPostForm")[0];
			let formData = new FormData(form);
            let editorVal = editorTxT.getData();

            formData.delete("content"); // <- 기존 html에 있는 form안에 <textarea name="content"> 삭제
            formData.append("content", editorVal);
			$.each($("input[name='upfile']")[0].files, function(index, file){
				console.log(index, file);
				formData.append("upfile"+index, file);
			});
			formData.delete("upfile");
			
    		$.ajax({
    			cache: false,
    			url: "<%=contextPath%>/insert.sh",
                type : 'POST', 
                data : formData,
                processData: false,
                contentType: false,
                success: function(data){
                	alert("성공");
                },
                error: function(data){
                	alert("실패");
                }
    		});
            $(this).submit();
    	});
    </script>

    </html>