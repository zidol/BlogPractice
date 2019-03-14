<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 저장</title>
</head>
<body>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String ymd = (new java.util.Date()).toLocaleString();
	String sql = null;
	Connection con = null;
	//Statement st = null;
	PreparedStatement pst = null;
// 	int pos = 0;
	
// 	while ((pos = content.indexOf("\'", pos)) != -1) {
// 		String left = content.substring(0, pos);
// 		String right = content.substring(pos, content.length());
// 		content = left + "\'" + right;
// 		pos += 2;
// 	}

	int cnt = 0;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		out.print(e);
	}
	
	try {
		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gboard?useSSL=false", "multi", "1234");
			//st = con.createStatement();
			
			/* sql = "insert into guestboard(name, email, inputdate, subject, content)";
			sql += " values('" + name + "','" + email + "','" + ymd + "','";
			sql += subject + "','" + content +"')";
			 */
			/* cnt = st.executeUpdate(sql); */
			
			sql = "insert into guestboard values(?,?,?,?,?)";
			pst = con.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, ymd);
			pst.setString(4, subject);
			pst.setString(5, content);
			cnt = pst.executeUpdate();
			if(cnt > 0) {
				out.println("데이터가 성공적으로 입력되었습니다");
			} else {
				out.println("데이터가 입력되지 않았습니다");
			}
			
			pst.close();
			con.close();
	} catch (SQLException e) {
		out.print(e);
	}
%>
<p><!-- 
<a href="dbgb_show.jsp">[방명록보기]</a>
<a href="dbgb_write.html">[글 올리는 곳으로]</a> -->
<jsp:forward page="dbgb_show.jsp"/>

</body>
</html>