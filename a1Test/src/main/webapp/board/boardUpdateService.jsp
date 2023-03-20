<%@page import="board.BoardDTO" %>
<%@page import="board.BoardDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String star = request.getParameter("star");
	String pw = request.getParameter("pw");
	String confirmPw = request.getParameter("confirmPw");
	
	if(title == "" || content == "" || pw == "") {
		out.print("<script>alert('입력값을 입력해야합니다.'); location.href='boardWrite.jsp';</script>");
		return;
	}
	
	if(pw.equals(confirmPw) == false) {
		out.print("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
	}
	
	BoardDAO boardDao = new BoardDAO();
	BoardDTO check = boardDao.selectTitle(title);
	
	if(check.getPw().equals(pw) == false) {
		out.print("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
		return;
	}
	
	if(pw.equals(confirmPw) == true && check.getPw().equals(pw) == true) {
		check.setTitle(title);
		check.setContent(content);
		check.setStar(star);
		boardDao.update(check);
		session.invalidate();
	}
%>
<script>alert('글수정 완료'); location.href='boardList.jsp';</script>