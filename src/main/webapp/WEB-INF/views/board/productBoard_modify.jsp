<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<meta charset="UTF-8">
<title>fundigo</title>
</head>
<body>
	<c:choose>
		<c:when test="${board.bd_type == 'NOTI'}">
			<c:set var="list_type" value="notice" />
		</c:when>
		<c:when test="${board.bd_type == 'COMM'}">
			<c:set var="list_type" value="community" />
		</c:when>
	</c:choose>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				Board Read
			</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<form role = "form" action="/board/productBoard_modify" method="post" >
						<input type = "hidden" name ="pageNum" value = "<c:out value = '${cri.pageNum}'/>">
						<input type = "hidden" name ="amount" value = "<c:out value = '${cri.amount}'/>">
						<input type = "hidden" name ="pno" value = "<c:out value = '${product.pno}'/>">
						<input type = "hidden" name ="id" value = "<c:out value = '${board.id}'/>">
						<div class="form-group">
							<div class="table-panel">
								<table class="table">
									<tbody>
										<tr>
											<td>번호</td>
											<td><input class="form-control" name="bno"
												value='<c:out value = "${board.bno}"/>' readonly="readonly"></td>
											<td>id</td>
											<td><input class="form-control" name="id"
												value='<c:out value = "${board.id}"/>' readonly="readonly"></td>
										</tr>
										<tr style="line-height: 32px;">
											<td>글 제목</td>
											<td><input class="form-control" name="title"
												value='<c:out value="${board.title}"/>'></td>
										</tr>
										<tr>
											<td>내용</td>
											<td><textarea class="form-control" rows="3"
													name='content'><c:out value="${board.content}" /></textarea></td>
										</tr>
										<tr>
											<td><input type = "hidden" class = "formcontrol" name = "regDate" value="${board.regDate}" readonly="readonly"/></td>
											<td><input type = "hidden" class = "formcontrol" name = "pno" value = "${product.pno}">
											<td><input type = "hidden" class = "formcontrol" name = "updateDate" value="${board.updateDate}"></td>
										</tr>
									</tbody>
								</table>
								<button type = "submit" data-oper = "modify" class="btn btn-default">수정완료</button>
								<button type = "submit" data-oper = "remove" class="btn btn-danger">삭제</button>
								<button type = "submit" data-oper = "list" class="btn btn-info">목록</button>
							</div>
						</div>
					
					<div class = 'bigPictureWrapper'>
						<div class = 'bigPicture'>
							
						</div>
					</div>
					</form>
					<div class = "row">
						<div class = "col-lg-12">
							<div class = "panel-heading">첨부파일</div>
							<!-- /.panel-heading -->
							<div class = "panel-body">
								<div class = "form-group uploadDiv">
									<input type = "file" name = 'uploadFile' multiple="multiple">
								</div>
								<div class = 'uploadResult'>
									<ul>
									</ul>
								</div>
							</div>
							<!-- end panel body -->
						</div>
						<!-- end panel -->
					</div>
					<!-- /.row -->
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	var bno = '<c:out value = "${board.bno}"/>';
	var pno = '<c:out value = "${product.pno}"/>';
	var type = '<c:out value = "${list_type}"/>';
	var id = '<c:out value = "${board.id}"/>';
	
	$(document).ready(function(){
		(function(){
			var bno = '<c:out value = "${board.bno}"/>';
			$.getJSON("/board/getAttachList", {bno:bno}, function(arr){
				console.log(arr);
				var str = "";
				$(arr).each(function(i, attach){
					//image type
					if(attach.fileType){ 
						var fileCallPath = encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName);
						
						str += "<li data-path = '"+attach.uploadPath+"'data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"'data-type='"+attach.fileType+"'><div>";
						str += "<span>"+attach.fileName+"</span>";
						str += "<button type = 'button' data-file = \'"+fileCallPath+"\' data-type = 'image' ";
						str += "class = 'btn btn-warning btn-circle'><i class = 'fa fa-times'></i></button><br/>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str + "</li>";
					}else{
						str += "<li data-path = '"+attach.uploadPath+"'data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"'data-type='"+attach.fileType+"'><div>";
						str += "<span>"+attach.fileName+"</span>";
						str += "<button type = 'button' data-file = \'"+fileCallPath+"\' data-type = 'file'";
						str += "class = 'btn btn-warning btn-circle'><i class = 'fa fa-times'></i></button><br/>";
						str += "<img src = '/resources/imags/attach.png'>";
						str += "</div>";
						str + "</li>";
					}
				});
				$(".uploadResult ul").html(str);
			})//end getjson
		})();//end function
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
				  str += "<img src = '/resources/images/attach.png'></a>";
				  str += "</div>";
				  str += "</li>";
			  }
		  });
		  
		  uploadUL.append(str);
	}
	
	$(".uploadResult").on("click", "button", function(e){
		console.log("delete file");
		if(confirm("Remove this file?")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});
	$(document).ready(function(){
		var formObj = $("form");
		$('button').on("click", function(e){
			e.preventDefault();
			var operation = $(this).data("oper");
			console.log(operation);
			
			if(operation === 'remove'){
				if(confirm("Remove this file?")){
					formObj.attr("action", "/board/remove?pno="+pno+"&bno="+bno);
				}
			}else if(operation === 'list'){
				//move to list
				
				formObj.attr("action", "/product/"+type).attr("method","get");
				var pageNumTag = $("input[name = 'pageNum']").clone();
				var amountTag = $("input[name = 'amount']").clone();
				var pnoTag = $("input[name = 'pno']").clone();
				var idTag = $("input[name = 'id']").clone();
				formObj.empty();
				formObj.append(pnoTag);
				formObj.append(idTag);
				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}else if(operation === "modify"){
				console.log("submit clicked");
				var str = "";
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					console.dir(jobj);
					str += "<input type = 'hidden' name = 'attachList["+i+"].fileName' value = '" + jobj.data("filename")+"'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].uuid' value = '" + jobj.data("uuid")+"'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].uploadPath' value = '" + jobj.data("path") + "'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].fileType' value = '"+jobj.data("type")+"'>";
				});
				
				formObj.append(str).submit();
			}
			formObj.submit();
		});
	});
	
	</script>

</body>
</html>