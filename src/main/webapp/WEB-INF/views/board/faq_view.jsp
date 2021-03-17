<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>fundigo</title>
</head>
<body>
	<c:set var="list_type" value="FAQ" />
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
										value='<c:out value="${board.title}"/>' readonly="readonly"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out
												value="${board.content}" /></textarea></td>
								</tr>
							</tbody>
						</table>

						<button data-oper='modify' class="btn btn-default">수정</button>
						<button data-oper='list' class="btn btn-default"
							onclick="location.href='http://localhost:8181/board/<c:out value="${list_type}"/>?id=${board.id}'">목록</button>
						<form id = "operForm" action = "/board/faq_modify" method = "get">
							<input type="hidden" id = "bno" name = "bno" value="<c:out value = '${board.bno}'/>">
							<input type="hidden" id = "pageNum" name = "pageNum" value="<c:out value = '${cri.pageNum }'/>">
						</form>	
						<div class = 'bigPictureWrapper'>
							<div class = 'bigPicture'>
							
							</div>
							<div class = "row">
								<div class = "col-lg-12">
									<div class = "panel-heading">첨부파일</div>
									<!-- /.panel-heading -->
									<div class = "panel-body">
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
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function() {
		(function(){
			var bno = '<c:out value = "${board.bno}"/>';
				$.getJSON("/board/getAttachList", {bno : bno}, function(arr){
					console.log(arr);
					var str = "";
					$(arr).each(function(i, attach){
						//imageType
						if(attach.fileType){
							var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
							
							str += "<li data-path = '" + attach.uploadPath + "' data-uuid = '" + attach.uuid + "'data-filename = '"
							+ attach.fileName + "' data-type = '" + attach.fileType+"' ><div>";
							str += "<img src='/display?fileName=" + fileCallPath + "'>";
							str += "</div>";
							str + "</li>";
						}else {
							str += "<li data-path = '" + attach.uploadPath + "' data-uuid = '" + attach.uuid + "' data-filename = '"
							+ attach.fileName + "'data-type'" + attach.fileType + "'><div>";
							str += "<span>" + attach.fileName + "</span><br/>";
							str += "<img src = '/resources/imags/attach.png'>";
							str += "</div>";
							str + "</li>";
						}
					});
					$(".uploadResult ul").html(str);
				});//end getJson
			})();//end function
		});
		
		$(document).ready(function(){
			var operForm = $("#operForm");
			$("button[data-oper = 'modify']").on("click", function(e){
				operForm.attr("action", "/board/faq_modify").submit();
			});
		});
		
		$(".uploadResult").on("click", "li", function(e){
			console.log("view image");
			var liObj = $(this);
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
			if(liObj.data("type")){
				showImage(path.replace(new RegExp(/\\/g),"/"));
			}else{
				//download
				self.location = "/download?fileName="+path;
				}
			});
		
		function showImage(fileCallPath){
			alert(fileCallPath);
			$("bigPictureWrapper").css("display", "flex").show();
			$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%',height:'100%'}, 1000);
		}
		$(".bigPictureWrapper").on("click",function(e){
			$(".bicPicture").animate({width:'0%', height:'0%'}, 1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			});
		})
		/* $("button[data-oper=""]").on("click", function(e){
			operForm.find("#bno").remove();
		}); */
	</script>

</body>
</html>