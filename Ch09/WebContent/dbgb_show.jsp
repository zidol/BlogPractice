<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 조회</title>
</head>
<body>

<%
	File board_file = new File("C:/jsp/chap6/write.txt");
	String s = null;

	try {
		FileReader in1 = new FileReader(board_file);
		BufferedReader in2 = new BufferedReader(in1);
		while ((s = in2.readLine()) != null) {
			out.println(s);
		}
		in2.close();
	} catch (IOException e) {
		out.println(e.getMessage());
	}
%>

<div align="center">
 <a href="filegb_write.html"><img src="image/write.gif" width="54" height="19" border=0></a>
</div>

</body>
</html>