<%@page import="board.BoardDTO" %>
<%@page import="board.BoardDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("utf-8");	
	String title = request.getParameter("title");
	String pw = request.getParameter("pw");
	String confirmPw = request.getParameter("confirmPw");
	
	// 입력 값 검증
	if(pw == ""){
		out.print("<script>alert(' 필수 항목입니다.'); history.go(-1);</script>");
		return;
	}
		
	// 입력 값 검증.
	if(pw.equals(confirmPw) == false){
		out.print("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
		return ;
	}
	
	BoardDAO boardDao = new BoardDAO();
	BoardDTO board = boardDao.selectTitle(title);
	if(board.getPw().equals(pw) == false) {
		out.print("<script>alert('비밀번호가 일치하지 않습니다.'); history.go(-1);</script>");
		return;
	}
	
	if(pw.equals(confirmPw) == true && board.getPw().equals(pw) == true) {
		boardDao.delete(board);
		session.invalidate();
	}
%>
<script>alert('글삭제 완료'); location.href='boardList.jsp';</script>