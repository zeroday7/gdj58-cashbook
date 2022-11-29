<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	Member loginMember = (Member)session.getAttribute("login");
	if(loginMember == null || loginMember.getMemberLevel() < 1) {
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}
	
	int currentPage = 1;
	// request.getParameter("currentPage")
	int rowPerPage = 10;
	int beginRow = (1-currentPage) * rowPerPage;
	HelpDao helpDao = new HelpDao();
	ArrayList<HashMap<String,Object>> list = helpDao.selectHelpList(beginRow, rowPerPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>helpListAll.jsp</title>
</head>
<body>
	<!-- header include -->
	
	<!-- 고객센터 문의 목록 -->
	<table>
		<tr>
			<th>문의내용</th>
			<th>회원ID</th>
			<th>문의날짜</th>
			<th>답변내용</th>
			<th>답변날짜</th>
			<th>답변추가 / 수정 / 삭제</th>
		</tr>
		<%
			for(HashMap<String, Object> m : list) {
		%>
				<tr>
					<td><%=m.get("helpMemo")%></td>
					<td><%=m.get("memberId")%></td>
					<td><%=m.get("helpCreatedate")%></td>
					<td><%=m.get("commentMemo")%></td>
					<td><%=m.get("commentCreatedate")%></td>
					<td>
						<%
							if(m.get("commentMemo") == null) { // 답변전이면
						%>
								<a href="<%=request.getContextPath()%>/admin/insertCommentForm.jsp?helpNo=<%=m.get("helpNo")%>">
									답변입력
								</a>
						<%		
							} else { // 답변완료글
						%>
								<a href="<%=request.getContextPath()%>/admin/insertCommentForm.jsp?commentNo=<%=m.get("commentNo")%>">답변수정</a>
								<a href="<%=request.getContextPath()%>/admin/deleteComment.jsp?commentNo=<%=m.get("commentNo")%>">답변삭제</a>
						<%		
							}
						%>
					</td>
				</tr>
		<%		
			}
		%>
	</table>
	<!-- footer include -->
</body>
</html>










