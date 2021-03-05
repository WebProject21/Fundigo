<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/thml; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class ='uploadDiv'>
		<input type="file" name='uploadFile' multiple>
	</div>
		<button id = 'uploadBtn'>등록</button>
		
		<script
 			 src="https://code.jquery.com/jquery-3.6.0.min.js"
 			 integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			 crossorigin="anonymous"></script>
		
		
		<script>$(document).ready(function(){
				$("#uploadBtn").on("click", function(e){
					var formData = new FormData();
					var inputFile = $("input[name='uploadFile']");
					var files = inputFile[0].files;
					
					var console = window.console || {log:function(){}};
					console.log(files);
					
					//add filedate to formdata
					for(var i = 0; i<files.length;i++){
						formData.append("uploadFile", files[i]);
					}
					
					$.ajax({
						url: '/uploadAjaxAction',
							processData: false,
							contentType: false,
							data: formData,
							type: 'Post',
							success: function(result){
								alert("Uploaded")
							}
					}); //$.ajax
				});
			});
			
		</script>
</body>
</html>