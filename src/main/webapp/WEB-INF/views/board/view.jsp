<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
							onclick="location.href='http://localhost:8181/product/<c:out value="${list_type}"/>?pno=${product.pno}&id=${board.id}'">목록</button>
						<form id = "operForm" action = "/board/product_modify" method = "get">
							<input type="hidden" id = "pno" name = "pno" value="<c:out value = '${product.pno}'/>">
							<input type="hidden" id = "bno" name = "bno" value="<c:out value = '${board.bno}'/>">
							<input type="hidden" id = "pageNum" name = "pageNum" value="<c:out value = '${cri.pageNum }'/>">
						</form>
						<!-- Modal -->
						<div class = "modal fade" id = "MyModal" tabindex = "-1" role = "dialog"
						aria-labelledby = "myModalLabel" aria-hidden = "true">
							<div class = "modal-dialog">
								<div class = "modal-content">
									<div class = "modal-header">
										<button  type = "button" class = "close" data-dismiss = "modal"
											aria-hidden = "true">&times;</button>
										<h4 class = "modal-title" id = "myModalLabel">댓글작성FORM</h4>
									</div>
									<div class = "modal-body">
										<div class = "form-group">
											<label>댓글작성</label>
											<input class = "form-control" name = 'reply-content' value = '' placeholder = "댓글을 입력해주세요.">
										</div>
										<div class = "form-group">
											<label>작성자</label>
											<input class = "form-control" name = "reply-id" value = '' placeholder = "작성자">
										</div>
										<div class = "form-group">
											<label>작성일</label>
											<input class = "form-control" name = "reply-regDate" value = "">
											<input type = "hidden" name = "reply-bd_type" value = '<c:out value="${list_type}"/>'>
										</div>
									</div>
									<div class = "modal-footer">
										<button id = "modalModBtn" type = "button" class = "btn btn-warning">수정</button>
										<button id = "modalRemoveBtn" type = "button" class = "btn btn-danger">삭제</button>
										<button id = "modalRegisterBtn" type = "button" class = "btn btn-primary" data-dismiss = "modal">등록</button>
										<button id = "modalCloseBtn" type = "button" class = "btn btn-default" data-dismiss = "modal">닫기 </button>
									</div>
								</div>
							</div>	
						</div>
						<!-- /.row -->
						<div class = "row">
							<div class = "col-lg-12">
								<!-- /.panel -->
								<div class ="panel panel-default">
									<div class = "panel-heading">
										<i class = "fa fa-comments"></i>댓글
										<button data-oper='addReplyBtn' type = "button" id = 'addReplyBtn' class = 'btn btn-primary btn-xs pull-right'>댓글작성</button>
									</div> 
									<!-- /.panel-heading -->
									<div class = "panel-body">
										<ul class = "chat">
											<!-- 댓글 시작 -->
											<li class = "left clearfix" data-rno = '12'>
												<div>
													<div class = "header">
														
													</div>
													
												</div>
											</li>
											<!-- end reply -->
										</ul>
										<!-- . / end ul -->
									</div>
									<!-- /. panel .chat-panel -->
									<div class = "panel-footer">
									
									</div>
								</div>
							</div>
							<!-- ./ end row -->
						</div>	
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
		var bnoValue = '<c:out value = "${board.bno}"/>';
		var replyUL = $(".chat");
	$(document).ready(function(){	
		
		showList(1);
		
		function showList(page){
			console.log("show list : " + page);
			
			replyService.getList({bno:bnoValue, page: page||1}, function(replyCnt, list){
				console.log("replyCnt : " + replyCnt);
				console.log("list :" + list);
				console.log(list);
				
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				if(list == null || list.length == 0){
					replyUL.html("");
					return;
				}
				
				for(var i = 0, len = list.length || 0; i < len; i++){
					str += "<li class = 'left clearfix' data-rno = '"+list[i].rno+"'>";
					str += "	<div><div class = 'header'><strong class = 'primary-font'>["+list[i].rno+"] "+list[i].id+"</strong>";
					str += "	<small class = 'pull-rigth text-muted'>"+replyService.displayTime(list[i].regDate)+"</small></div>";
					str += "	<p>"+list[i].content+"</p></div></li>";
				}
				replyUL.html(str);
				showReplyPage(replyCnt);
			});//end function
		}//end showList
		
		var modal = $(".modal");
		var modalInputContent = modal.find("input[name='reply-content']");
		var modalInputId = modal.find("input[name = 'reply-id']");
		var modalInputRegDate = modal.find("input[name = 'reply-regDate']");
		var modalInputBd_type = modal.find("input[name = 'reply-bd_type']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		$('#addReplyBtn').on("click", function(e) {
			modal.find("input").val("");
			modalInputRegDate.closest("div").hide();
			modal.find("button[id !='modalCloseBtn']").hide();
			modalRegisterBtn.show();

		    $(".modal").modal("show");
		});
		modalRegisterBtn.on("click", function(e){
			
			var reply = {
					content : modalInputContent.val(),
					id : modalInputId.val(),
					bd_type : modalInputBd_type.val(),
					bno : bnoValue
			};
			replyService.add(reply, function(result){
				alert(result);
				modal.find("input").val("");
				modal.modal("hide");
				showList(-1);
			});
		});
		
		$(".chat").on("click", "li", function(e){
			var rno = $(this).data("rno");
			console.log(rno);
			replyService.get(rno, function(reply){
				modalInputContent.val(reply.content);
				modalInputId.val(reply.id);
				modalInputRegDate.val(replyService.displayTime(reply.regDate));
				modalInputBd_type.val(reply.bd_type);
				modal.data("rno",reply.rno);
				
				modal.find("button[id != 'modalCoseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
			});
		});
		
		modalModBtn.on("click", function(e){
			var reply = {rno : modal.data("rno"), content : modalInputContent.val()};
			replyService.update(reply, function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		modalRemoveBtn.on("click", function(e){
			var rno = modal.data("rno");
			replyService.remove(rno, function(result){
				alert(result);
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt){
		var endNum = Math.ceil(pageNum / 10.0)* 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		if(endNum * 10 < replyCnt){
			next = true;
		}
		var str = "<ul class = 'pagination pull-right'>";
		if(prev){
			str += "<li class = 'page-item'><a class = 'page-link' href = '"+(startNum -1)+"'>이전</a></li>";
		}
		for(var i = startNum; i <= endNum; i++){
			var active = pageNum == i? "active":"";
			str += "<li class ='page-item"+active+"'><a class = 'page-link' href = '"+i+"'>"+i+"</a></li>";
		}
		str += "</ul></div>";
		console.log(str);
		replyPageFooter.html(str);
	}
	
	replyPageFooter.on("click", "li a", function(e){
		e.preventDefault();
		console.log("page click");
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum: "+targetPageNum);
		pageNum = targetPageNum;
		showList(pageNum);
	});
});	
</script>	
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
				operForm.attr("action", "/board/productBoard_modify").submit();
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
			$(".bigPictureWrapper").css("display", "flex").show();
			$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%',height:'100%'}, 1000);
		}
		
		$(".bigPictureWrapper").on("click",function(e){
			$(".bicPicture").animate({width:'0%', height:'0%'}, 1000);
			setTimeout(function(){
				$('.bigPictureWrapper').hide();
			});
		})
		$("button[data-oper='']").on("click", function(e){
			operForm.find("#bno").remove();
		});
	</script>
</body>
</html>