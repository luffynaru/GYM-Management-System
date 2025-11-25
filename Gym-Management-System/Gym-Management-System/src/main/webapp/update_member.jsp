<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String fullName = request.getParameter("full_name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String ageStr = request.getParameter("age");
    String gender = request.getParameter("gender");
    String membershipPlan = request.getParameter("membership_plan");
    String joinDate = request.getParameter("join_date");
    String expiryDate = request.getParameter("expiry_date");
    String status = request.getParameter("status");

    int age = 0;
    if (ageStr != null && !ageStr.isEmpty()) {
        age = Integer.parseInt(ageStr);
    }

    String jdbcURL = "jdbc:mysql://localhost:3306/gym_db";
    String dbUser = "root";
    String dbPassword = "4772";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String sql = "UPDATE members SET full_name=?, email=?, phone=?, age=?, gender=?, membership_plan=?, join_date=?, expiry_date=?, status=? WHERE id=?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, fullName);
        ps.setString(2, email);
        ps.setString(3, phone);
        ps.setInt(4, age);
        ps.setString(5, gender);
        ps.setString(6, membershipPlan);
        ps.setString(7, joinDate);
        ps.setString(8, expiryDate);
        ps.setString(9, status);
        ps.setInt(10, id);

        int updated = ps.executeUpdate();
        conn.close();

        if (updated > 0) {
            response.sendRedirect("list_members.jsp");
        } else {
            out.println("Failed to update member.");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>
