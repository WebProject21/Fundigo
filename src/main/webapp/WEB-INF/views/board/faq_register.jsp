<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>funDigo</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="stylesheet" href="${path}/resources/css/board/boardform.css">

<script type="text/javascript">
	function check_onclick(){
		if(document.register.title.value == ""){
			alert("제목을 입력해 주세요.");
			return false;
		}
		if(document.register.content.value == ""){
			alert("내용을 입력해주세요.");
			return false;
		}
		return true;
	}
</script>
</head>

<body>
	<input type="hidden" name="pno" value="${product.pno}">
	<div class = "container">
		<form role = "form" action = "/product/community_register?pno=${product.pno}" method = "post" enctype = "">
			<input type = "hidden" name = "id" value="${id}" />
			<div class = "col-sm-12 pt-3">
				<div class ="register">
					<div class = "panel-header panel-header-primary">
						<h4 class = "panel-title"><i class = "fas fa-squre"></i>글 작성</h4>
						<p class = "panel-catagory"></p>
					</div>
					<div class = "panel-body">
						<div class = "table-panel">
							<table class = "table">
								<tbody>
									<tr style = "line-height: 32px;">
										<td>글 제목</td>
										<td><input type = "text" name = "title" class = "form-control" value="" placeholder = "제목입력"></td>
									</tr>
									<tr>	
										<td>내용 입력</td>
										<td><textarea rows="3" class = "form-control" name = "content" placeholder = "내용입력"></textarea></td>
									</tr>
								</tbody>
							</table>
							<div class = "row" style = "width: 100%; margin: 0px auto;">
								<button type= "submit" name = "uploadBtn" class = "btn btn-default">등록</button>
								<button type = "button" value="취소" onclick="location.href='/product/community?pno=${product.pno}&id=${id}'">취소</button>
								<button type = "reset" value="초기화">리셋</button>
							</div>
							<div class = "row">
								<div class = "col-lg-12">
									<div class = "register register-default">
										<div class = "register-heading">첨부파일 등록</div>
										<!-- /.panel-heading -->
										<div class = "register-body">
											<div class = "register-body">
												<div class = "form-group uploadDiv">
													<input type = "file" name = 'uploadFile' multiple>
												</div>
												<div class = 'uploadResult'>
													<ul>
						
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>					
			</div>
		</form>
	</div>

<script>
	$(document).ready(function(e){
		var formObj = $("form[role='form']");
		
		$("button[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);
				str += "<input type = 'hidden' name = 'attachList["+i+"].fileName' value = '" + jobj.data("filename")+"'>";
				str += "<input type = 'hidden' name = 'attachList["+i+"].uuid' value = '" + jobj.data("uuid") + "'>";
				str += "<input type = 'hidden' name = 'attachList["+i+"].uploadPath' value = '" + jobj.data("path") + "'>";
				str += "<input type = 'hidden' name = 'attachList["+i+"].fileType' value = '" + jobj.data("type") + "'>";
			});
			formObj.append(str).submit();
		});
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
	
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드가 불가능합니다.");
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
					showUploadResult(result); //업로드 결과 처리 함수
				}
			}); //$.ajax
		});
	});
	
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length == 0){return ;}
			var uploadUL = $(".uploadResult ul");
			var str = "";
		
		  $(uploadResultArr).each(function(i, obj){
			  //image type
			  if(obj.image){
				  var fileCallPath = encodeURIComponent( obj.uploadPath + "/s_"+obj.uuid+"_"+obj.fileName);
				  str += "<li data-path='"+obj.uploadPath+"'";
				  str += " data-uuid='"+obj.uuid+"' data-filename = '"+obj.fileName+"'data-type='"+obj.image+"'";
				  str += " ><div>";
				  str += "<span>"+obj.fileName+"</span>";
				  str += "<button type = 'button' data-file=\'"+fileCallPath+"'";
				  str += "data-type='image' class = 'btn btn-warning btn-circle'><i class = 'fa fa-times'></i></button><br>";
				  str += "<img src='/display?fileName="+fileCallPath+"'>";
				  str += "</div>";
				  str += "</li>";
			  }else{
				  var fileCallPath = encodeURIComponent( obj.uploadPath + "/"+obj.uuid+"_"+obj.fileName);
				  var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
				  
				  str += "<li ";
				  str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
				  str += "<span> "+ obj.fileName+"</span>";
				  str += "<button type = 'button' data-file = \'"+fileCallPath+"\' data-type='file'";
				  str += "class = 'btn btn-warning btn-circle'><i class = 'fa fa-times'></i></button><br>";
				  str += "<img src = '/resources/img/attach.png'></a>";
				  str += "</div>";
				  str += "</li>";
			  }
		  });
		  
		  uploadUL.append(str);
	}
	$(".uploadResult").on("click", "button", function(e){
		console.log("delete file");
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type:type},
			dataType: 'text',
			type: "POST",
			success: function(result){
				alert(result);
	  			targetLi.remove();
			}
		});//$.ajax
	});
</script>
</body>
</html>