<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>funDigo</title>


<!-- local style sheet -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/bootstrap-grid.min.css" rel="stylesheet">

<!-- font/fontIcon -->
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700|Raleway:400,300,500,700,600'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	type="text/css">
	
<link rel="stylesheet" href="../resources/css/board/boardform.css">
</head>

<body>
	<%@include file="../header.jsp"%>
	<input type="hidden" name="pno" value="${product.pno}">
	<div class="container">
		<form role="form" action="/product/register" method="post" enctype="">
			<input type="hidden" name="id" value="${id}" />
			<div class="col-sm-12 pt-3">
				<div class="register">
					<div class="register-header register-header-primary">
						<h4 class="register-title">
							<i class="fas fa-squre"></i>펀딩 등록
						</h4>
						<p class="register-catagory"></p>
					</div>
					<div class="register-body">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr style="line-height: 32px;">
										<td>펀딩 이름</td>
										<td><input type="text" name="title" class="form-control"
											value="" placeholder="펀딩 제목 입력"></td>
									</tr>
									<tr>
										<td>카테고리</td>
										<td><select name="tag" id="tag" class="form-control form-control-sm" style = "width:30%;'">
												<option value="G">게임</option>
												<option value="D">디자인</option>
												<option value="L">생활</option>
												<option value="T">테크</option>
										</select> * 카테고리 하나를 선택하세요</td>
									</tr>
									<tr>
										<td>설명</td>
										<td><textarea rows="3" style="height:100%;" class="form-control"
												name="description" placeholder="펀딩 설명 입력"></textarea></td>
									</tr>
									<tr>
										<td>목표 금액</td>
										<td><input type="text" class="form-control"
											name="goalPrice" placeholder="목표 금액 입력"></td>
									</tr>
									<tr>
										<td>목표 날짜</td>
										<td><input type="text" class="form-control"
											name="goalPrice" placeholder="목표 날짜 입력"> * yyyy-mm-dd
											형식으로 입력해 주세요</td>
									</tr>

								</tbody>
							</table>
							<div class="row">
								<div class="col-lg-12">
									<div class="register register-default">
										<div class="register-heading">첨부파일 등록</div>
										<!-- /.panel-heading -->
										<div class="register-body">
											<div class="register-body">
												<div class="form-group uploadDiv">
													<input type="file" class = "form-control-file" name='uploadFile' multiple>
												</div>
												<div class='uploadResult'>
													<ul>

													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row pull-right" style="width: 100%; margin: 0px auto;">
								<button type="submit" name="uploadBtn" class="btn btn-outline-secondary">등록</button>
								&nbsp; &nbsp;
								<button type="button" value="취소" class="btn btn-outline-secondary"
									onclick="location.href='http://localhost:8181/main/mainpage'">취소</button>
								&nbsp; &nbsp;
								<button type="reset" value="초기화" class = "btn btn-outline-secondary">리셋</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@include file="../footer.jsp"%>
	<script>
		$(document)
				.ready(
						function(e) {
							var formObj = $("form[role='form']");

							$("button[type='submit']")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												console.log("submit clicked");
												var str = "";

												$(".uploadResult ul li")
														.each(
																function(i, obj) {
																	var jobj = $(obj);
																	console
																			.dir(jobj);
																	str += "<input type = 'hidden' name = 'attachList["
																			+ i
																			+ "].fileName' value = '"
																			+ jobj
																					.data("filename")
																			+ "'>";
																	str += "<input type = 'hidden' name = 'attachList["
																			+ i
																			+ "].uuid' value = '"
																			+ jobj
																					.data("uuid")
																			+ "'>";
																	str += "<input type = 'hidden' name = 'attachList["
																			+ i
																			+ "].uploadPath' value = '"
																			+ jobj
																					.data("path")
																			+ "'>";
																	str += "<input type = 'hidden' name = 'attachList["
																			+ i
																			+ "].fileType' value = '"
																			+ jobj
																					.data("type")
																			+ "'>";
																});
												formObj.append(str).submit();
											});
							var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
							var maxSize = 5242880; //5MB

							function checkExtension(fileName, fileSize) {
								if (fileSize >= maxSize) {
									alert("파일 사이즈 초과");
									return false;
								}
								if (regex.test(fileName)) {
									alert("해당 종류의 파일은 업로드가 불가능합니다.");
									return false;
								}
								return true;
							}
							$("input[type = 'file']")
									.change(
											function(e) {
												var formData = new FormData();
												var inputFile = $("input[name='uploadFile']");
												var files = inputFile[0].files;

												for (var i = 0; i < files.length; i++) {
													if (!checkExtension(
															files[i].name,
															files[i].size)) {
														return false;
													}
													formData.append(
															"uploadFile",
															files[i]);
												}
												$
														.ajax({
															url : '/uploadAjaxAction',
															processData : false,
															contentType : false,
															data : formData,
															type : 'POST',
															dataType : 'json',
															success : function(
																	result) {
																console
																		.log(result);
																showUploadResult(result); //업로드 결과 처리 함수
															}
														}); //$.ajax
											});
						});

		function showUploadResult(uploadResultArr) {
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return;
			}
			var uploadUL = $(".uploadResult ul");
			var str = "";

			$(uploadResultArr)
					.each(
							function(i, obj) {
								//image type
								if (obj.image) {
									var fileCallPath = encodeURIComponent(obj.uploadPath
											+ "/s_"
											+ obj.uuid
											+ "_"
											+ obj.fileName);
									str += "<li data-path='"+obj.uploadPath+"'";
				  str += " data-uuid='"+obj.uuid+"' datafilename = '"+obj.fileName+"'data-type='"+obj.image+"'";
				  str += " ><div>";
									str += "<span>" + obj.fileName + "</span>";
									str += "<button type = 'button' data-file=\'"+fileCallPath+"'";
				  str += "data-type='image' class = 'btn btn-warning btn-circle'><i class = 'fa fa-times'></i></button><br>";
									str += "<img src='/display?fileName="
											+ fileCallPath + "'>";
									str += "</div>";
									str += "</li>";
								} else {
									var fileCallPath = encodeURIComponent(obj.uploadPath
											+ "/"
											+ obj.uuid
											+ "_"
											+ obj.fileName);
									var fileLink = fileCallPath.replace(
											new RegExp(/\\/g), "/");

									str += "<li ";
				  str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
									str += "<span> " + obj.fileName + "</span>";
									str += "<button type = 'button' data-file = \'"+fileCallPath+"\' data-type='file'";
				  str += "class = 'btn btn-warning btn-circle'><i class = 'fa fa-times'></i></button><br>";
									str += "<img src = '/resources/img/attach.png'></a>";
									str += "</div>";
									str += "</li>";
								}
							});

			uploadUL.append(str);
		}
		$(".uploadResult").on("click", "button", function(e) {
			console.log("delete file");

			var targetFile = $(this).data("file");
			var type = $(this).data("type");

			var targetLi = $(this).closest("li");
			$.ajax({
				url : '/deleteFile',
				data : {
					fileName : targetFile,
					type : type
				},
				dataType : 'text',
				type : "POST",
				success : function(result) {
					alert(result);
					targetLi.remove();
				}
			});//$.ajax
		});
	</script>
</body>
</html>
