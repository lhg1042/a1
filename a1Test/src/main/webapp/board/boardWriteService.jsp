<%@page import="board.BoardDTO" %>
<%@page import="board.BoardDAO" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String nick = request.getParameter("nick");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String star = request.getParameter("star");
	String pw = request.getParameter("pw");
	String confirmPw = request.getParameter("confirmPw");
	
	if(nick == "" || title == "" || content == "" || pw == "") {
		out.print("<script>alert('입력값을 입력해야합니다.'); location.href='boardWrite.jsp';</script>");
		return;
	}
	
	if(pw.equals(confirmPw) == false) {
		response.sendRedirect("boardWrite.jsp");
	}
	
	BoardDAO boardDao = new BoardDAO();
	BoardDTO board = new BoardDTO();
	
	board.setNick(nick);
	board.setTitle(title);
	board.setContent(content);
	board.setStar(star);
	board.setPw(pw);
	boardDao.insert(board);
%>
<script>alert('글쓰기 완료'); location.href='boardList.jsp';</script>