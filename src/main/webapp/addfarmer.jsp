<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%
Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) 
{
    response.sendRedirect("adminsessionexpiry.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Farmer</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
    /* Updated form styles for larger size and new colors */
    .form-container {
        max-width: 600px; /* Increased size */
        margin: 50px auto;
        padding: 40px; /* Increased padding */
        background: linear-gradient(120deg, #d1c4e9, #b39ddb); /* Updated colors */
        border-radius: 20px;
        box-shadow: 0 12px 35px rgba(0, 0, 0, 0.2); /* Enhanced shadow */
        transition: transform 0.3s, background 0.3s;
    }
    .form-container:hover {
        transform: scale(1.03); /* Slightly increased hover effect */
        background: linear-gradient(120deg, #b39ddb, #9575cd); /* Change on hover */
    }
    h3 {
        text-align: center;
        margin-bottom: 25px; /* Increased spacing */
        color: #4a148c; /* Dark purple for text */
    }
    .btn-primary {
        background: linear-gradient(45deg, #1e90ff, #0073e6); /* New gradient for primary button */
        border: none;
        color: white;
    }
    .btn-secondary {
        background: linear-gradient(45deg, #ff5722, #e64a19); /* New gradient for secondary button */
        border: none;
        color: white;
    }
</style>

</head>
<body class="bg-yellow-100">
  <!-- Sidebar -->
    <aside class="fixed top-16 left-0 w-64 h-full bg-gray-800 text-white shadow-md flex flex-col justify-between transition-all duration-500 ease-in-out transform">
        <div class="py-6 px-6">
            <h2 class="text-xl font-bold mb-6">Admin Menu</h2>
            <ul class="space-y-4">
                <li><a href="adminhome" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Home</a></li>
                <li><a href="addfarmer" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Add Farmers</a></li>
                <li><a href="viewallfarmers" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">View All Farmers</a></li>
                <li><a href="updatefarmerstatus" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Update Farmer Status</a></li>
                <li><a href="viewallcustomers" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">View All Customers</a></li>
                <li><a href="allorders" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Customer Orders</a></li>
            </ul>
        </div>
    </aside>

    <!-- Main Content Area -->
    <div class="flex-1 flex flex-col ml-64">
        <!-- Navbar -->
        <nav class="bg-white w-full z-20 top-0 left-0 border-b border-gray-200 p-4 fixed">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="adminhome.jsp" class="text-2xl font-semibold text-blue-700">Admin Home</a>
                <ul class="flex items-center space-x-4">
                    <li><a href="adminlogout" class="text-gray-900 hover:text-blue-700">Logout</a></li>
                </ul>
            </div>
        </nav>

        <!-- Page Content with Form -->
        <div class="mt-20 p-6">
            <div class="form-container">
                <h3><u>Add Farmer</u></h3>

                <!-- Display error or success message -->
                <c:if test="${not empty message}">
                    <div class="alert alert-danger text-center">
                        ${message}
                    </div>
                </c:if>

                <form method="post" action="insertfarmer" onsubmit="return validatePassword();">
                    <div class="form-group">
                        <label for="fname">Enter Name</label>
                        <input type="text" class="form-control" id="fname" name="fname" required/>
                    </div>
                    <div class="form-group">
                        <label for="femail">Enter Email ID</label>
                        <input type="email" class="form-control" id="femail" name="femail" required/>
                    </div>
                    <div class="form-group">
                        <label for="fpwd">Enter Password</label>
                        <input type="password" class="form-control" id="fpwd" name="fpwd" required/>
                        <small class="form-text text-danger">
                            <i><b>Your password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one special character, and one number.</b></i>
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="fadd">Enter Address</label>
                        <input type="text" class="form-control" id="fadd" name="fadd" required/>
                    </div>
                    <div class="form-group">
                        <label for="ffarmsize">Enter Farm Size</label>
                        <input type="number" class="form-control" id="ffarmsize" name="ffarmsize" required/>
                    </div>
                    <div class="form-group">
                        <label for="fprod">Select Type of Products</label><br/>
                        <select class="form-control" id="fprod" name="fprod" required>
                            <option value="">-- Select Product Type --</option>
                            <option value="Processed Foods">Processed Foods</option>
                            <option value="Handmade Goods">Handmade Goods</option>
                            <option value="Organic Fertilizers">Organic Fertilizers</option>
                            <option value="Dairy and Animal Products">Dairy and Animal Products</option>
                            <option value="Packaging and Byproducts">Packaging and Byproducts</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="fcontact">Enter Contact</label>
                        <input type="number" class="form-control" id="fcontact" name="fcontact" required/>
                    </div>
                    <div class="form-group text-center">
                        <input type="submit" class="btn btn-primary" value="Register"/>
                        <input type="reset" class="btn btn-secondary" value="Clear"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function validatePassword() {
            const password = document.getElementById("fpwd").value;
            const regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$/;
            if (!regex.test(password)) {
                alert("Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one special character, and one number.");
                return false; 
            }
            return true; 
        }
    </script>
</body>
</html>
