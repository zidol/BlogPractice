<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 저장</title>
</head>
<body>

<% request.setCharacterEncoding("utf-8"); %>
<%
String board_file = "C:/jsp/chap6/write.txt";
String email = null;
File check = new File(board_file);

if (!check.exists()) {
	FileWriter filew = new FileWriter(board_file);
	filew.write("");
	filew.close();
}

String old = null;
File infile = new File(board_file);
StringBuffer buf = new StringBuffer();
try {
	BufferedReader input = new BufferedReader(new FileReader(infile));
	while ((old = input.readLine()) != null) {
		buf.append(old + "\n");
	}
	input.close();
} catch (IOException e) {
	out.println(e);
}
old = buf.toString();
buf.setLength(0);

if (request.getParameter("email") != "") {
	email = "<A href=mailto:";
	email += request.getParameter("email");
	email += ">" + request.getParameter("email");
	email += "</A>";
}
try {
	PrintWriter pw = new PrintWriter(new FileWriter(board_file, false));
	pw.println("<div align='center'>");
	pw.println("<table border='0' width='600' cellspacing='0' cellpadding='2'>");
	pw.println("<tr align='right'>");
	pw.println("<td height='22'>&nbsp;</td></tr>");
	pw.println("<tr align='center'>");
	pw.println("<td height='1' bgcolor='#1F4F8F'></td>");
	pw.println("</tr>");
	pw.println("<tr align='center' bgcolor='#DFEDFF'>");
	pw.println("<td class='button' bgcolor='#DFEDFF'>");
	pw.println("<div align='left'><font size='2'>" + request.getParameter("subject"));
	pw.println("</div></td>");
	pw.println("</tr>");
	pw.println("<tr align='center' bgcolor='#FFFFFF'>");
	pw.println("<td align='center' bgcolor='#F4F4F4'>");
	pw.println("<table width='100%' border='0' cellpadding='0'cellspacing='4'>");
	pw.println("<tr bgcolor='#F4F4F4'>");
	pw.println("<td width='13%' height='7'></td>");
	pw.println("<td width='38%' height='7'>글쓴 이:" + request.getParameter("name") + "</td>");
	pw.println("<td width='38%' height='7'>E-mail: " + email + "</td>");
	pw.println("<td width='11%' height='7'></td>");
	pw.println("</tr>");
	pw.println("<tr bgcolor='#F4F4F4'>");
	pw.println("<td width='13%'></td>");
	pw.println("<td colspan=2>작성일:" + (new java.util.Date()).toLocaleString() + "</td>");
	pw.println("<td width='11%'></td>");
	pw.println("</tr></table>");
	pw.println("</td></tr>");
	pw.println("<tr align='center'>");
	pw.println("<td bgcolor='#1F4F8F' height='1'></td>");
	pw.println("</tr>");
	pw.println("<tr align='center'>");
	pw.println("<td style='padding:10 0 0 0'>");
	pw.println("<div align='left'><br>");
	pw.println("<font size='3' color='#333333'><PRE>" + request.getParameter("content"));
	pw.println("</PRE></div>");
	pw.println("<br>");
	pw.println("</td></tr>");
	pw.println("<tr align='center'>");
	pw.println("<td class='button' height='1'></td>");
	pw.println("</tr>");
	pw.println("<tr align='center'>");
	pw.println("<td bgcolor='#1F4F8F' height='1'></td>");
	pw.println("</tr>");
	pw.println("</table>");
	pw.println("</div>");
	pw.println(old);
	pw.close();
} catch (IOException e) {
	out.println(e.getMessage());
}
%>

<jsp:forward page="filegb_show.jsp"></jsp:forward>

</body>
</html>