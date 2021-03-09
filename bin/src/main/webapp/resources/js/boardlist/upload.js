// 이미지 파일 여부 판단

function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}

//업로드 파일 정보
function getFileInfo(fullName){
	var fileName, imgsrc, getLink, fileLink;
	var console = window.console || {log:function(){}};
	//이미지 파일일 경우
	if(checkImageType(fullName)){
		//이미지 파일 경로(썸네일)
		imgsrc = "C:\\upload\sum"+fullName;
		console.log(imgsrc);
		// 업로드 파일명
		fileLink = fullName.substr(14);
		console.log(fileLink);
		//날짜별 디렉토리 추출
		var front = fullName.substr(0,12);
		console.log(front);
		// s_를 제거한 업로드 이미지 파일명
		var end = fullName.substr(14);
		console.log(end);
		//원본이미지 파일 디렉토리
		getLink = "C:\\upload\origin"+front+end;
		console.log(getLink);
	//이미지 아닐 경우
	}else{
		//UUID를 제외한 원본파일명
		fileLink = fullName.substr(12);
		console.log(fileLink);
		//일반파일 디렉토리
		getLink = "C:\\upload\temp"+fullName;
		console.log(getLink);
	}
	//목록에 출력할 원본파일명
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	console.log(fileName);
	//{변수:값} json 객체 리턴
	return {fileName:fileName, imgsrc: imgsrc, getLink:getLink, fullName:fullName};
}

$(document).ready(function(){
	//파일 업로드 영역에서 기본효과를 제한
	$(".fileDrop").on("dragenter dragover", function(e){
		e.preventDefault(); // 기본 효과 제한
	});
	// 드래그해서 드롭한 파일들ajax 업로드 요청
	$(".fileDrop").on("drop",function(e){
		e.preventDefault();//기본 효과 제한
		var files = e.originalEvent.dataTransfer.files; // 드래그한 파일들
		var file = files[0]; //첫번째 첨부파일
		var formData = new FormData(); //폼데이터 객체
		formData.append("file", file); // 첨부파일 추가
		$.ajax({
			url: "/uploadAjaxAction",
			type: "post",
			data: formData,
			dataType: "text",
			processData: false, // processType: false - header가 아닌 body로 전달
			contentType: false,
			// ajax 업로드 요청이 성공적으로 처리되면
			success: function(data){
				var console = window.console || {log:function(){}};
				console.log(data);
				//첨부 파일의 정보
				var fileInfo = getFileInfo(data);
				// 하이퍼 링크
				var html = "<a href='"+fileInfo.getLink+"'>'"+fileInfo.fileName+"</a><br>";
				//hidden 태그 추가
				html += "<input type = 'hidden' class = 'file' value = '"+fileInfo.fullName+"'>'";
				//div에 추가
				$("#uploadedList").append(html);
			}
		});
	});
})