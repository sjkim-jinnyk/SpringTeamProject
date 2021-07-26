let nocheck = document.querySelector('#noagreeC');

// 회원 탈퇴 동의 체크박스 js
$(document).ready(function(){
    $("#agreeC").change(function(){
        if($("#agreeC").is(":checked")){
            nocheck.disabled = true;
        }
    });
});

