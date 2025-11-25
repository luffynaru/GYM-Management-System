<html>
<head>
    <title>Add Member</title>
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
            <h2 class="page-title">Add New Member</h2>
            <p class="page-subtitle">Fill the details to register a new gym member.</p>

            <form method="post" action="save_member.jsp">
                <div class="form-grid">

                    <div class="form-group">
                        <label>Full Name</label>
                        <input type="text" name="full_name" required>
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" name="email">
                    </div>

                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" name="phone">
                    </div>

                    <div class="form-group">
                        <label>Age</label>
                        <input type="number" name="age">
                    </div>

                    <div class="form-group">
                        <label>Gender</label>
                        <select name="gender">
                            <option value="">Select</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Membership Plan</label>
                        <select name="membership_plan">
                            <option value="Monthly">Monthly</option>
                            <option value="Quarterly">Quarterly</option>
                            <option value="Half-Yearly">Half-Yearly</option>
                            <option value="Yearly">Yearly</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Join Date</label>
                        <input type="date" name="join_date">
                    </div>

                    <div class="form-group">
                        <label>Expiry Date</label>
                        <input type="date" name="expiry_date">
                    </div>

                    <div class="form-group">
                        <label>Status</label>
                        <select name="status">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="reset" class="btn btn-outline">Clear</button>
                    <button type="submit" class="btn btn-primary">Save Member</button>
                </div>
            </form>
        </div>
    </div>

</div>
</body>
</html>

