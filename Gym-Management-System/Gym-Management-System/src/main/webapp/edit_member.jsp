<%@ page import="java.sql.*" %>

<%
    String idStr = request.getParameter("id");
    int id = Integer.parseInt(idStr);

    String jdbcURL = "jdbc:mysql://localhost:3306/gym_db";
    String dbUser = "root";
    String dbPassword = "4772";

    String fullName = "", email = "", phone = "", gender = "", membershipPlan = "", status = "";
    int age = 0;
    String joinDate = "", expiryDate = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String sql = "SELECT * FROM members WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            fullName = rs.getString("full_name");
            email = rs.getString("email");
            phone = rs.getString("phone");
            age = rs.getInt("age");
            gender = rs.getString("gender");
            membershipPlan = rs.getString("membership_plan");
            joinDate = String.valueOf(rs.getDate("join_date"));
            expiryDate = String.valueOf(rs.getDate("expiry_date"));
            status = rs.getString("status");
        } else {
            out.println("Member not found");
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>

<html>
<head>
    <title>Edit Member</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="app-shell">

    <div class="topbar">
        <div class="topbar-title">GYM <span>MANAGER</span></div>
        <div class="topbar-actions">
            <a href="index.jsp">Home</a>
            <a href="list_members.jsp">View Members</a>
        </div>
    </div>

    <div class="main">
        <div class="card">
            <h2 class="page-title">Edit Member (#<%= id %>)</h2>

            <form method="post" action="update_member.jsp">
                <input type="hidden" name="id" value="<%= id %>">

                <div class="form-grid">

                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" name="full_name" value="<%= fullName %>" required>
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" name="email" value="<%= email %>">
                    </div>

                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" name="phone" value="<%= phone %>">
                    </div>

                    <div class="form-group">
                        <label>Age</label>
                        <input type="number" name="age" value="<%= age %>">
                    </div>

                    <div class="form-group">
                        <label>Gender</label>
                        <select name="gender">
                            <option value="">Select</option>
                            <option value="Male" <%= "Male".equalsIgnoreCase(gender) ? "selected" : "" %>>Male</option>
                            <option value="Female" <%= "Female".equalsIgnoreCase(gender) ? "selected" : "" %>>Female</option>
                            <option value="Other" <%= "Other".equalsIgnoreCase(gender) ? "selected" : "" %>>Other</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Membership Plan</label>
                        <select name="membership_plan">
                            <option value="Monthly" <%= "Monthly".equalsIgnoreCase(membershipPlan) ? "selected" : "" %>>Monthly</option>
                            <option value="Quarterly" <%= "Quarterly".equalsIgnoreCase(membershipPlan) ? "selected" : "" %>>Quarterly</option>
                            <option value="Half-Yearly" <%= "Half-Yearly".equalsIgnoreCase(membershipPlan) ? "selected" : "" %>>Half-Yearly</option>
                            <option value="Yearly" <%= "Yearly".equalsIgnoreCase(membershipPlan) ? "selected" : "" %>>Yearly</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Join Date</label>
                        <input type="date" name="join_date" value="<%= joinDate %>">
                    </div>

                    <div class="form-group">
                        <label>Expiry Date</label>
                        <input type="date" name="expiry_date" value="<%= expiryDate %>">
                    </div>

                    <div class="form-group">
                        <label>Status</label>
                        <select name="status">
                            <option value="Active" <%= "Active".equalsIgnoreCase(status) ? "selected" : "" %>>Active</option>
                            <option value="Inactive" <%= "Inactive".equalsIgnoreCase(status) ? "selected" : "" %>>Inactive</option>
                        </select>
                    </div>
                </div>

                <div class="form-actions">
                    <a href="list_members.jsp" class="btn btn-outline">Cancel</a>
                    <button type="submit" class="btn btn-primary">Update Member</button>
                </div>
            </form>
        </div>
    </div>

</div>
</body>
</html>
