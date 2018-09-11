<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%
  request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>게시글 내용</h3>
<%
String subject="", name="", memo="", time="", email="";
int id = Integer.parseInt(request.getParameter("id"));
String JDBC_DRIVER = "com.mysql.jdbc.Driver";
String DB_URL = "jdbc:mysql://localhost:3306/board?useUnicode=true&characterEncoding=UTF-8";
String USERNAME = "root";
String PASSWORD = "root";
Class.forName(JDBC_DRIVER);
Connection con = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
Statement stmt = con.createStatement();
String sql = "select * from message where id="+id; 
ResultSet rs = stmt.executeQuery(sql);

while(rs.next()) {
  subject = rs.getString("subject");
  name = rs.getString("name");
  memo = rs.getString("memo");
  time = rs.getString("time");
  email = rs.getString("email");
}
%>
<table border="2">
<tr>
  <td>제목</td>
  <td><%=subject %></td>
</tr>
<tr>
  <td>작성자</td>
  <td><%=name %></td>
</tr>
<tr>
  <td>내용</td>
  <td><%=memo %></td>
</tr>
<tr>
  <td>작성일</td>
  <td><%=time %></td>
</tr>
<tr>
  <td>email</td>
  <td><%=email %></td>
</tr>
</table>
<br>
<a href="list.jsp">게시글 리스트 보기</a>
</body>
</html>