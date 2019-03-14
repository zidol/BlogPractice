
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 조회</title>
</head>
<body>

<%	
	request.setCharacterEncoding("utf-8");
	String  email = null;
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		out.print(e);
	}
	
	try {
		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gboard?useSSL=false", "multi", "1234");
			st = con.createStatement();
			rs = st.executeQuery("select * from guestboard order by inputdate desc");
			if(!rs.next()) {
				out.println("블로그에 올린 글이 없습니다");
			} else {
				do {
					out.println("<div align='center'>");
					out.println("<table border='0' width='600' cellspacing='0' cellpadding='2'>");
					out.println("<tr align='right'>");
					out.println("<td height='22'>&nbsp;</td></tr>");
					out.println("<tr align='center'>");
					out.println("<td height='1' bgcolor='#1F4F8F'></td>");
					out.println("</tr>");
					out.println("<tr align='center' bgcolor='#DFEDFF'>");
					out.println("<td class='button' bgcolor='#DFEDFF'>");
					out.println("<div align='left'><font size='2'>" + rs.getString("subject"));
					out.println("</div></td>");
					out.println("</tr>");
					out.println("<tr align='center' bgcolor='#FFFFFF'>");
					out.println("<td align='center' bgcolor='#F4F4F4'>");
					out.println("<table width='100%' border='0' cellpadding='0'cellspacing='4'>");
					out.println("<tr bgcolor='#F4F4F4'>");
					out.println("<td width='13%' height='7'></td>");
					out.println("<td width='38%' height='7'>글쓴 이:" + rs.getString("name") + "</td>");
					String temp = rs.getString("email");
					if((temp != null) && (!(temp.equals(""))))
						email = "<a href=mailto:" + temp + ">" + temp + "</a>";
					out.println("<td width='38%' height='7'>E-mail: " + email + "</td>");
					out.println("<td width='11%' height='7'></td>");
					out.println("</tr>");
					out.println("<tr bgcolor='#F4F4F4'>");
					out.println("<td width='13%'></td>");
					out.println("<td colspan=2>작성일:" + rs.getString("inputdate")+ "</td>");
					out.println("<td width='11%'></td>");
					out.println("</tr></table>");
					out.println("</td></tr>");
					out.println("<tr align='center'>");
					out.println("<td bgcolor='#1F4F8F' height='1'></td>");
					out.println("</tr>");
					out.println("<tr align='center'>");
					out.println("<td style='padding:10 0 0 0'>");
					out.println("<div align='left'><br>");
					out.println("<font size='3' color='#333333'><PRE>" + rs.getString("content"));
					out.println("</PRE></div>");
					out.println("<br>");
					out.println("</td></tr>");
					out.println("<tr align='center'>");
					out.println("<td class='button' height='1'></td>");
					out.println("</tr>");
					out.println("<tr align='center'>");
					out.println("<td bgcolor='#1F4F8F' height='1'></td>");
					out.println("</tr>");
					out.println("</table>");
					out.println("</div>");
				} while (rs.next());
			}

			rs.close();
			st.close();
			con.close();
	} catch(SQLException e) {
		out.print(e);
	} 	
%>
<div align="center">
 <a href="dbgb_write.html"><img src="image/write.gif" width="54" height="19" border=0></a>
</div>

</body>
</html>