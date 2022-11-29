<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	// 1 Controller
	request.setCharacterEncoding("utf-8");
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	
	Member member = new Member();
	member.setMemberId(memberId);
	member.setMemberPw(memberPw);
	member.setMemberName(memberName);
	
	// 2 Model 호출
	MemberDao memberDao = new MemberDao();
	if(memberDao.selectMemberIdCk(memberId)) {
		System.out.println("중복아이디");
		response.sendRedirect(request.getContextPath()+"/insertMemberForm.jsp");
		return;
	}
	int row = memberDao.insertMember(member);
	System.out.println(row + " <-- insertMemberAction.jsp row");
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
%>