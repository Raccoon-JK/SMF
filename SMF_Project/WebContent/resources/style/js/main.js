/**
 * 
 */

const $topBtn = document.querySelector(".moveTopBtn");

// 버튼 클릭 시 맨 위로 이동
$topBtn.onclick = () => {
window.scrollTo({ top: 0 });  
}


$(function(){
    $(".feedwrap").click(function(){
        location.href = "<%= contextPath%>/follow.st?pno="+$(this).children().eq(0).val();
    })
});
