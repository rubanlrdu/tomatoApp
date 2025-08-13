<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - TomatoApp</title>
    <!-- Link to the CSS file -->
    <link rel="stylesheet" href="LoginStyles.css">
    <!-- Optional: Link to Google Fonts for a modern look -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

    <div class="login-container">
        <h1>Login</h1>
        <p class="subtitle">Welcome back! Please enter your details.</p>
        
        <form action="loginServlet" method="post">
            
            <!-- Username Field -->
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            
            <!-- Password Field -->
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <!-- Role Selection -->
            <div class="form-group">
                <label>Select Your Role</label>
                <div class="radio-group">
                    <div class="radio-option">
                        <input type="radio" id="role-customer" name="role" value="customer" checked>
                        <label for="role-customer">Customer</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="role-admin" name="role" value="admin">
                        <label for="role-admin">Admin</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="role-restaurant" name="role" value="restaurant">
                        <label for="role-restaurant">Restaurant</label>
                    </div>
                </div>
            </div>
            
            <!-- Submit Button -->
            <button type="submit" class="submit-btn">Login</button>
            
        </form>
    </div>

</body>
</html>