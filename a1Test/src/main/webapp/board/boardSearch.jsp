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
</head>
<body>
<%
	String search = (String)session.getAttribute("search");	
			
	request.setCharacterEncoding("utf-8");
	search = request.getParameter("search");
			
	BoardDAO boardDao = new BoardDAO();
	BoardDTO board = boardDao.selectSearch(search);
		
%>
	<div align="center">
		<h1><%=search%> 에 대한 검색 결과</h1>
		<%
			if(board == null) {
				out.print("<h1>검색 결과 없음</h1>");
			} else {
		%>
		<table border="1" id="list">
			<thead>
				<tr>
					<th>제목</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody class="tableList">
					<tr>
						<td onclick="location.href='boardInfo.jsp?title=<%=board.getTitle()%>'">
							<%=board.getTitle() %>
						</td>
						<td><%=board.getNick() %></td>
					</tr>
			</tbody>
		</table>
		<%} %>
		<input type="button" value="이전" onclick="location.href='boardList.jsp'">
	</div>
</body>
</html>