<%@ page import="java.sql.*" %>
<html>
<head>
    <title>All Members</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="app-shell">

    <div class="topbar">
        <div class="topbar-title">GYM <span>MANAGER</span></div>
        <div class="topbar-actions">
            <a href="index.jsp">Home</a>
            <a href="add_member.jsp">Add Member</a>
        </div>
    </div>

    <div class="main">
        <div class="card">
            <h2 class="page-title">All Members</h2>
            <p class="page-subtitle">View and manage all registered gym members.</p>

            <div class="table-wrapper">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Full Name</th>
                        <th>Phone</th>
                        <th>Plan</th>
                        <th>Join Date</th>
                        <th>Expiry Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        String jdbcURL = "jdbc:mysql://localhost:3306/gym_db";
                        String dbUser = "root";
                        String dbPassword = "4772";

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                            String sql = "SELECT * FROM members";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(sql);

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String fullName = rs.getString("full_name");
                                String phone = rs.getString("phone");
                                String plan = rs.getString("membership_plan");
                                String jDate = String.valueOf(rs.getDate("join_date"));
                                String eDate = String.valueOf(rs.getDate("expiry_date"));
                                String status = rs.getString("status");
                    %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= fullName %></td>
                        <td><%= phone %></td>
                        <td><%= plan %></td>
                        <td><%= jDate %></td>
                        <td><%= eDate %></td>
                        <td><%= status %></td>
                        <td class="action-links">
                            <a class="edit" href="edit_member.jsp?id=<%= id %>">Edit</a>
                            <a class="delete" href="delete_member.jsp?id=<%= id %>"
                               onclick="return confirm('Delete this member?');">
                                Delete
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("Error: " + e.getMessage());
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
</body>
</html>
