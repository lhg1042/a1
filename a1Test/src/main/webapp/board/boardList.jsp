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
		search = document.getElementById('search');
		if(search.value == "") {
			alert("검색어를 입력해주세요.");
		}
		document.getElementById('f').submit();
	}
</script>
</head>
<body>
	<div align="center">
		<h1>게시판 목록</h1>
		<input type="button" value="글쓰기" onclick="location.href='boardWrite.jsp'"><br><br>
		<%
			BoardDAO boardDao = new BoardDAO();
			ArrayList<BoardDTO> boards = boardDao.selectAll();
			
			if(boards.isEmpty() == true) {
				out.print("<h1>등록된 게시물이 없습니다.</h1>");
			} else {
		%>
		<table border="1" id="list">
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<%
				for(BoardDTO board : boards) {
			%>
				<tbody class="tableList">
					<tr>
						<td onclick="location.href='boardInfo.jsp?title=<%=board.getTitle()%>'">
							<%=board.getTitle() %>
						</td>
						<td><%=board.getNick() %></td>
					</tr>
				</tbody>
			<%
				}
			%>
		</table>
		<% } %>
		<br>
		<form action="boardSearch.jsp" method="get" id="f">
			<input type="text" placeholder="제목 또는 닉네임을 입력하세요." id="search" name="search">
			<input type="button" value="검색" id="search_btn" name="search_btn" onclick="check();">
		</form>
	</div>
</body>
</html>