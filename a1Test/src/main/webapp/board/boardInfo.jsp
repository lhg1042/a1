<%@page import="board.BoardDAO" %>
<%@page import="board.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script>
	function check() {
		pw = document.getElementById('pw');
		confirmPw = document.getElementById('confirmPw');
		if(pw.value != confirmPw.value) {
			alert('두 비밀번호가 일치하지 않습니다.');
			return;
		}
		document.getElementById('f').submit();
	}
</script>
<body>
	<%
		String title = (String)session.getAttribute("title");
		String pw = (String)session.getAttribute("pw");	
	
		request.setCharacterEncoding("utf-8");
		title = request.getParameter("title");
		pw = request.getParameter("pw");
		BoardDAO  boardDao = new BoardDAO();
		BoardDTO board = boardDao.selectTitle(title);
	%>
	<div align="center">
		<form action="boardDeleteService.jsp" method="post" id="f">
		<% 
		if(board.getStar() == null) {
		%>
				<div align="center">
					작성자: <%=board.getNick() %><br>
					제목: <%=board.getTitle() %><br>
					<input type="hidden" id="title" name="title" value="<%=board.getTitle() %>">
					내용: <%=board.getContent() %><br>
					<button type="button" onclick="location.href='boardUpdate.jsp?title=<%=board.getTitle()%>'">글수정</button><br>
					<input type="password" placeholder="비밀번호" name="pw" id="pw"><br> 
					<input type="password" placeholder="비밀번호 확인" name="confirmPw" id="confirmPw"><br>
					<input type="submit" value="글삭제">
					<input type="button" value="취소" onclick="location.href='boardList.jsp'">
				</div>
		<%
			} else {
		%>
				<div align="center" style="background-color:yellow">
					작성자: <%=board.getNick() %><br>
					제목: <%=board.getTitle() %><br>
					<input type="hidden" id="title" name="title" value="<%=board.getTitle() %>">
					내용: <%=board.getContent() %><br>
					<button type="button" onclick="location.href='boardUpdate.jsp?title=<%=board.getTitle()%>'">글수정</button><br>
					<input type="password" placeholder="비밀번호" name="pw" id="pw"><br> 
					<input type="password" placeholder="비밀번호 확인" name="confirmPw" id="confirmPw"><br>
					<input type="submit" value="글삭제">
					<input type="button" value="취소" onclick="location.href='boardList.jsp'">
				</div>
		<%
			}
		%>
		</form>
	</div>
</body>
</html>