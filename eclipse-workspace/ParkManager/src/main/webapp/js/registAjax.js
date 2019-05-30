/* 
$("#registAjaxBtn").on("submit", function(){
	var ajaxPostSend =  function() {
	    
	    var url = "/user/registerAjax";   //Controller 호출
	    var postString = "";
	    postString  = "id=" + $('#id').val();
	    postString += "&password=" + $('#password').val();
	    postString += "&name=" + $('#name').val();
	    postString += "&phone=" + $('#name').val();
	    postString += "&carNum=" + $('#carNum').val();
	    postString += "&carType=" + $('#carType').val();
	    postString += "&user=" + $('#id').val();

	    
	    $.ajax({
	        type: "POST",
	        url: url,
	        data: postString,
	        error: function() {
	        	alert("회원가입 실패");
	        },
	        success: function() { 
	            alert("회원가입 성공");
	       }
	    });
	    return false;
	 };

});
*/

