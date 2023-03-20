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
		pw = document.getElementById('pw');
		confirmPw = document.getElementById("confirmPw");
		if(title.value == "") {
			alert('제목을 입력해주세요.');
		}
		if(content.value == "") {
			alert('내용을 입력해주세요.');
		}
		if(pw.value != confirmPw.value) {
			alert('두 비밀번호가 일치하지 않습니다.').
			return;
		}
		document.getElementById('f').submit();
	}
</script>
</head>
<body>
<%
	String title = (String)session.getAttribute("title");
	
	request.setCharacterEncoding("utf-8");	
	title = request.getParameter("title");
	BoardDAO boardDao = new BoardDAO();
	BoardDTO board = boardDao.selectTitle(title);
%>
	<div align="center">
		<form action="boardUpdateService.jsp" method="post" id="f">
			닉네임: <%=board.getNick() %><br>
			제목: <input type="text" name="title" id="title" value=<%=board.getTitle() %>><br>
			내용: <input type="text" name="content" id="content" value=<%=board.getContent() %>><br>
			<input type="checkbox" name="star" id="star" value="1">중요 게시물<br>
			<input type="password" name="pw" placeholder="비밀번호" id="pw" autocomplete="off"><br>
			<input type="password" name="confirmPw" placeholder="비밀번호 확인" id="confirmPw" autocomplete="off"><br>
			<input type="button" value="수정하기" onclick="check();">
			<input type="button" value="취소" onclick="location.href='boardList.jsp'">
		</form>
	</div>
</body>
</html>