<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
    <title>Admin Home</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .background-img {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        body {
            min-height: 100vh;
            background-color: transparent;
            position: relative;
        }

        .main-content {
            position: relative;
            z-index: 1;
        }

        @keyframes slideIn {
            from {
                transform: translateX(-100%);
            }
            to {
                transform: translateX(0);
            }
        }

        .animate-slideIn {
            animation: slideIn 1s ease-out forwards;
        }
    </style>
</head>
<body class="bg-gray-100 h-screen flex">
    <!-- Background Image -->
    <img src="bgimg2.jpg" alt="Background" class="background-img">

    <!-- Sidebar -->
    <aside class="fixed top-0 left-0 w-64 h-full bg-gray-800 text-white shadow-md flex flex-col justify-between">
        <div class="py-4 px-6">
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
        <nav class="bg-white dark:bg-gray-900 w-full z-20 top-0 left-0 border-b border-gray-200 dark:border-gray-600 p-4 fixed">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="adminhome" class="text-2xl font-semibold text-blue-700">Admin Home</a>
                <ul class="flex items-center space-x-4">
                    <li><a href="adminlogout" class="text-gray-900 hover:text-blue-700">Logout</a></li>
                </ul>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="flex flex-col items-center justify-center h-full mt-20">
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-8">
                <!-- Farmers Box -->
                <div class="bg-blue-100 rounded-lg shadow-md p-8 text-center cursor-pointer hover:bg-blue-200 transition"
                     onclick="showDetails('farmers')">
                    <h2 class="text-2xl font-bold text-blue-800">Farmers</h2>
                </div>
                <!-- Customers Box -->
                <div class="bg-green-100 rounded-lg shadow-md p-8 text-center cursor-pointer hover:bg-green-200 transition"
                     onclick="showDetails('customers')">
                    <h2 class="text-2xl font-bold text-green-800">Customers</h2>
                </div>
            </div>

            <!-- Details Box (Hidden by Default) -->
            <div id="detailsBox" class="hidden mt-8 bg-gray-100 rounded-lg shadow-lg p-6 w-1/2">
                <h3 id="detailsTitle" class="text-2xl font-bold text-center mb-4"></h3>
                <p id="detailsContent" class="text-lg text-center"></p>
                <button onclick="closeDetails()" class="mt-4 bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600">
                    Close
                </button>
            </div>
        </div>
    </div>

    <script>
        function showDetails(type) {
            const detailsBox = document.getElementById('detailsBox');
            const detailsTitle = document.getElementById('detailsTitle');
            const detailsContent = document.getElementById('detailsContent');

            if (type === 'farmers') {
                detailsTitle.textContent = 'Farmers Details';
                detailsContent.innerHTML = `Total Farmers = <c:out value="${farmercount}"></c:out>`;
            } else if (type === 'customers') {
                detailsTitle.textContent = 'Customers Details';
                detailsContent.innerHTML = `Total Customers = <c:out value="${customercount}"></c:out>`;
            }

            detailsBox.classList.remove('hidden');
        }

        function closeDetails() {
            const detailsBox = document.getElementById('detailsBox');
            detailsBox.classList.add('hidden');
        }
    </script>
</body>
</html>
