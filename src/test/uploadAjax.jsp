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
	<div class = "uploadResult">
		<ul>
		
		</ul>
	</div>
		<button id = 'uploadBtn'>등록</button>
		
		<script
 			 src="https://code.jquery.com/jquery-3.6.0.min.js"
 			 integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
			 crossorigin="anonymous"></script>
		
		
<script>
	$(document).ready(function(){
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
	
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
		
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
	var cloneObj = $(".uploadDiv").clone();
	
	$("#uploadBtn").on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		//add file data to formdata
		for(var i=0; i<files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : '/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType:'json',
			success : function(result){
				console.log(result);
				showUploadedFile(result);
				$(".uploadDiv").html(cloneObj.html());
			}
		}); // $.ajax
	});
});
	var uploadResult = $(".uploadResult ul");
	function showUploadedFile(uploadResultArr){
		var str = "";
		$(uploadResultArr).each(function(i,obj){
			if(!obj.image){
				str += "<li><img src='/resources/images/slider-1.jpg'>"+obj.fileName+"</li>";
			}else{
				//str += "<li>"+obj.fileName+"</li>";
				var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
				str += "<li><img src = '/display?fileName="+fileCallPath+"'><li>";
			}
		});
		uploadResult.append(str);
	}
</script>

<script>
$(document).ready(function(e){
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		console.log("submit clicked");
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; // 5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	$("input[type = 'file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		for(var i=0; i<files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : '/uploadAjaxAction',
			processData : false,
			contentType : false, 
			data : formData,
			type : 'POST',
			dataType : 'json',
				success:function(result){
					console.log(result);
				}
		});
	});
});
</script>
</body>
</html>