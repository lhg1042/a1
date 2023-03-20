<%@page import="java.util.ArrayList" %>
<%@page import="board.BoardDAO" %>
<%@page import="board.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A1 performance factory</title>
<script>
	function check() {
		title = document.getElementById('title');
		content = document.getElementById('content');
		nick = document.getElementById('nick');
		pw = document.getElementById('pw');
		confirmPw = document.getElementById("confirmPw");
		
		if(title.value == "") {
			alert('제목을 입력해주세요.');
		}
		if(content.value == "") {
			alert('내용을 입력해주세요.');
		}
		if(nick.value == "") {
			alert('닉네임을 입력해주세요.');
		}
		
		if(pw.value != confirmPw.value) {
			alert('두 비밀번호가 일치하지 않습니다.');
			return;
		}
		document.getElementById('f').submit();	
	}
</script>
</head>
<body>
	<div align="center">
		<h1>게시판 작성</h1>
		<form action="boardWriteService.jsp" method="post" id="f">
			닉네임: <input type="text" name="nick" id="nick" placeholder="닉네임"><br>
			제목: <input type="text" name="title" id="title" placeholder="제목" autocomplete="off"><br>
			내용: <input type="text" name="content" id="content" placeholder="내용" autocomplete="off"><br>
			<input type="checkbox" name="star" id="star" value="1">중요 게시물<br>
			
			<input type="password" name="pw" placeholder="비밀번호" id="pw" autocomplete="off"><br>
			<input type="password" name="confirmPw" placeholder="비밀번호 확인" id="confirmPw" autocomplete="off"><br>
			<input type="button" value="취소" onclick="location.href='boardList.jsp'">
			<input type="button" value="글쓰기" onclick="check();">
		</form>
	</div>
</body>
</html>