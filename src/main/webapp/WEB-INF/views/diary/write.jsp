<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyLog : write</title>
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<script src="/resources/ckeditor/ko.js"></script>
	<script>
		function MyCustomUploadAdapterPlugin(editor) {
		    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
		        return new UploadAdapter(loader)
		    }
		}
	</script>
</head>
<body>
	<div id="main_wrap">
		<form action="write.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="ddate" value="${param.ddate }">
			<table>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="dtitle">
					</td>
				</tr>
				<tr>
					<th>투두리스트</th>
					<td>
						<input type="radio" name="dtodoin" value="0" checked="checked">첨부안함
						<input type="radio" name="dtodoin" value="1">첨부
					</td>
				</tr>
				<tr>
					<th>공개범위</th>
					<td>
						<input type="radio" name="dstatus" value="0" checked="checked">나만보기
						<input type="radio" name="dstatus" value="1">친구공개
						<input type="radio" name="dstatus" value="2">전체공개
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="classic" name="dcontent"></textarea>
						<script>
					        ClassicEditor
					            .create( document.querySelector( '#classic' ), {
					                language: 'ko' //언어설정
					            })
					            .catch( error => {
					                console.error( error );
					            } );
					    </script>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>