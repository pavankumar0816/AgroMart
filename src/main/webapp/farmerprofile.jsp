<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.klef.jfsd.springboot.model.Farmer"%>
<%
Farmer farmer = (Farmer) session.getAttribute("farmer");
if(farmer==null)
{
	response.sendRedirect("farmersessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Farmer Profile</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Animation styles for card */
        .animated-card {
            opacity: 0;
            transform: translateY(50px);
            animation: fadeInUp 1s ease forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body class="bg-gray-100 h-screen flex flex-col">

  <!-- Sidebar -->
<aside class="fixed top-0 left-0 w-64 h-full bg-gray-800 text-white shadow-lg flex flex-col justify-between transform transition-all duration-500 ease-in-out">
    <div class="py-6 px-6">
        <h2 class="text-2xl font-bold mb-6 text-center">Farmer Menu</h2>
        <ul class="space-y-4">
            <li>
                <a href="farmerhome" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition duration-300">
                    Home
                </a>
            </li>
            <li>
                <a href="addproducts" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition duration-300">
                    Add Products
                </a>
            </li>
            <li>
                <a href="viewallproducts" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition duration-300">
                    View All Products
                </a>
            </li>
            
				 <li>
                    <a href="displayfarmersbyproducts" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition-all duration-300 ease-in-out">
                        View Farmers by Products
                    </a>
                </li>
            
            <!-- Dropdown for Farmer Profile -->
            <li class="relative">
                <button
                    class="flex items-center justify-between w-full bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition-all duration-300 ease-in-out focus:outline-none"
                    onclick="toggleDropdown('profileDropdown')">
                    <span>Farmer Profile</span>
                    <svg class="w-4 h-4 ml-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                    </svg>
                </button>
                <ul id="profileDropdown" class="hidden bg-white text-gray-800 shadow-lg rounded-lg mt-1 absolute left-0 w-full z-10">
                    <li>
                        <a href="farmerprofile" class="block px-4 py-2 hover:bg-blue-100 transition duration-300">
                            Profile
                        </a>
                    </li>
                    <li>
                        <a href="updatefarmer" class="block px-4 py-2 hover:bg-blue-100 transition duration-300">
                            Update Profile
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>

    <!-- Logout Button -->
    <div class="py-4 px-6 mb-4">
        <a href="farmerlogout" class="block bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded-lg text-center transition-all duration-300 ease-in-out">
            Logout
        </a>
    </div>
</aside>

<script>
    function toggleDropdown(id) {
        const dropdown = document.getElementById(id);
        dropdown.classList.toggle('hidden');
    }
</script>

    <!-- Main Content Area -->
    <div class="flex-1 flex flex-col ml-64">
        <!-- Navbar -->
        <nav class="bg-white dark:bg-gray-900 w-full z-20 top-0 left-0 border-b border-gray-200 dark:border-gray-600 p-4 fixed">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="farmerhome.jsp" class="text-2xl font-semibold text-blue-700">Farmer Home</a>
                <ul class="flex items-center space-x-4">
                    <li>
                        <a href="farmerlogout" class="text-gray-900 hover:text-blue-700">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
 

    <!-- Main Content Area -->
    <div class="flex-1 flex items-center justify-center mt-8"> <!-- Reduced margin -->
        <!-- Card Container with Animation -->
        <div class="bg-blue-100 shadow-xl rounded-lg p-6 w-full max-w-md mx-auto text-center animated-card"> <!-- Reduced padding -->
            <h3 class="text-2xl font-bold text-blue-900 mb-6"><u>My Profile</u></h3>
            <div class="space-y-4 text-gray-800 text-left">
                <div class="flex justify-between">
                    <span class="font-semibold">ID:</span>
                    <span><%= farmer.getId() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold">NAME:</span>
                    <span><%= farmer.getName() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold">Email:</span>
                    <span><%= farmer.getEmail() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold">Password:</span>
                    <span><%= farmer.getPassword() %></span>
                </div>
                 <div class="flex justify-between">
                    <span class="font-semibold">Address:</span>
                    <span><%= farmer.getAddress() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold">Farm Size:</span>
                    <span><%=farmer.getFarmsize() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold">Type Of Products:</span>
                    <span><%=  farmer.getProductsProduced() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold">Contact:</span>
                    <span><%= farmer.getContact() %></span>
                </div>
                 
            </div>
        </div>
    </div>
</body>
</html>
