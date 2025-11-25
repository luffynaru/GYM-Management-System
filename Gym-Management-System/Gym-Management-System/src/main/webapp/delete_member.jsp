<%@ page import="java.sql.*" %>

<%
    String idStr = request.getParameter("id");
    int id = Integer.parseInt(idStr);

    String jdbcURL = "jdbc:mysql://localhost:3306/gym_db";
    String dbUser = "root";
    String dbPassword = "4772";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String sql = "DELETE FROM members WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);

        ps.executeUpdate();
        conn.close();

        response.sendRedirect("list_members.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
