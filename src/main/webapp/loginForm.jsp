<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*" %>
<%
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	int rowPerPage = 5;
	int beginRow = (currentPage-1)*rowPerPage;
	// int lastPage = 0;
	
	NoticeDao noticeDao = new NoticeDao();
	ArrayList<Notice> list = noticeDao.selectNoticeListByPage(beginRow, rowPerPage);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>
	<!-- 공지(5개)목록 페이징 -->
	<div>
		<h1>공지사항</h1>
		<table border="1">
			<tr>
				<th>공지내용</th>
				<th>날짜</th>
			</tr>
			<%
				for(Notice n : list) {
			%>
					<tr>
						<td><%=n.getNoticeMemo()%></td>
						<td><%=n.getCreatedate()%></td>
					</tr>
			<%		
				}
			%>
		</table>
	</div>
	
	<!-- 로그인 폼 -->
	<div>
		<h1>
			<span>로그인</span>
		</h1>
	</div>

	<div>
		<form method="post"
			action="<%=request.getContextPath()%>/loginAction.jsp">
			<div>
				<table border="1">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="memberId"></td>
					</tr>

					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="memberPw"></td>
					</tr>
				</table>
			</div>
			<div>
				<button type="submit">로그인</button>
			</div>
		</form>
	</div>
</body>
</html>