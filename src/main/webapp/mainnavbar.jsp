<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring Boot</title>
    <style>
        /* Internal CSS for navbar */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: lightblue; /* Updated cool mint background */
        }

        .navbar {
            background-color: #2C3E50; /* Cool, dark blue-gray color */
            padding: 20px 40px; /* Increased padding for taller navbar */
            display: flex;
            justify-content: space-between; /* Align items on both sides */
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Adds slight shadow for effect */
        }

        .navbar .logo {
            color: #ECF0F1; /* Light, soft white color */
            font-size: 24px; /* Increased font size for the logo */
            font-weight: bold;
        }

        .navbar a {
            color: #ECF0F1; /* Light, soft white color */
            text-decoration: none;
            padding: 12px 24px; /* Increased padding for links */
            margin: 0 12px; /* Increased margin between links */
            font-size: 18px; /* Increased font size for links */
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .navbar a:hover {
            background-color: #16A085; /* Cool teal hover color */
            color: white;
            border-radius: 50px; /* Fully rounded corners */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* Stronger hover effect */
        }

        /* Dropdown Menu */
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropbtn {
            color: black;
            text-decoration: none;
            padding: 12px 24px;
            font-size: 18px;
            font-weight: bold;
            background-color: #FFE4E1; /* Same color as navbar */
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .dropbtn:hover {
            background-color: #16A085; /* Cool teal hover color */
            color: white;
            border-radius: 50px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .dropdown-content {
            color: black;
            display: none;
            position: absolute;
            background-color: #B0E0E6; /* Changed dropdown background color to purple */
            min-width: 200px; /* Adjusted width */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 8px; /* Optional rounded corners for the dropdown */
            padding: 8px 0;
            right: 0; /* Align the dropdown to the right */
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 24px;
            text-decoration: none;
            display: block; /* Makes the items stack vertically */
            font-size: 18px;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .dropdown-content a:hover {
            background-color: #FFE4E1; /* Lighter purple hover color */
            color: black;
            border-radius: 50px; /* Fully rounded corners on hover */
        }

        h2 {
            text-align: center;
            color: #34495E; /* Dark gray-blue for the heading */
            margin: 100px 0 20px; /* Adjust margin for space below navbar */
            font-weight: 300;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">AgroMart</div>
        <div>
            <a href="/">Home</a>
          
            <!-- Dropdown for Login -->
            <div class="dropdown">
                <button class="dropbtn">Login</button>
                <div class="dropdown-content">
                    <a href="adminlogin">Admin</a>
                    <a href="farmerlogin">Farmer</a>
                    <a href="customerlogin">Customer</a>
                </div>
            </div>
        </div>
    </div>
    <br/>
    <br/>
</body>
</html>
