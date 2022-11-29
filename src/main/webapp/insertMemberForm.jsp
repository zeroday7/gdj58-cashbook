<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginMember") != null){
		response.sendRedirect(request.getContextPath()+"/cash/cashList.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>insertMemberForm</title>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/insertMemberAction.jsp" method="post">
			<table border="1">
				<tr>
					<th colspan="2">회원가입</th>
				</tr>
				<tr>
					<th>회원 ID</th>
					<td>
						<input type="text" name="memberId">
					</td>
				</tr>
				<tr>
					<th>회원 PW</th>
					<td>
						<input type="password" name="memberPw">
					</td>
				</tr>
				<tr>
					<th>회원 이름</th>
					<td>
						<input type="text" name="memberName">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">가입</button>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>