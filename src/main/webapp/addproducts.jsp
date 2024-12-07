<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>

<%@page import="com.klef.jfsd.springboot.model.Farmer"%>
<%
Farmer farmer = (Farmer) session.getAttribute("farmer");
if(farmer==null)
{
	response.sendRedirect("farmersessionexpiry");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Products</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Framer Motion -->
    <script src="https://unpkg.com/framer-motion@6/dist/framer-motion.umd.js"></script>
</head>
<body class="bg-gray-300">
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
                        <a href="updateprofile" class="block px-4 py-2 hover:bg-blue-100 transition duration-300">
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

        <!-- Form Section -->
        <div class="pt-24 flex-grow flex items-start justify-center mt-16">
            <div id="login-card" class="w-full max-w-lg bg-white rounded-lg shadow-lg p-8 space-y-6 transition-all duration-500">
                <h3 class="text-center text-2xl font-semibold text-gray-700 underline">Add Products</h3>
                
                <form action="insertproducts" method="post" enctype="multipart/form-data" class="space-y-4">
                    <div>
                        <label for="category" class="block text-gray-600">Category</label>
                        <select name="category" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400">
                            <option value="">-- Select Product Type --</option>
                            <option value="Processed Foods">Processed Foods</option>
                            <option value="Handmade Goods">Handmade Goods</option>
                            <option value="Organic Fertilizers">Organic Fertilizers</option>
                            <option value="Dairy and Animal Products">Dairy and Animal Products</option>
                        </select>
                    </div>
                    
                    <div>
                        <label for="name" class="block text-gray-600">Name</label>
                        <input type="text" name="name" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
                    </div>

                    <div>
                        <label for="description" class="block text-gray-600">Description</label>
                        <textarea name="description" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400"></textarea>
                    </div>

                    <div>
                        <label for="cost" class="block text-gray-600">Cost</label>
                        <input type="number" name="cost" required step="0.01" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
                    </div>

                    <div>
                        <label for="productimage" class="block text-gray-600">Image</label>
                        <input type="file" name="productimage" required class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" />
                    </div>

                    <div class="flex justify-between items-center">
                        <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded-md focus:outline-none">Add</button>
                        <input type="reset" value="Clear" class="bg-red-500 hover:bg-red-600 text-white font-semibold py-2 px-4 rounded-md focus:outline-none"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        const { motion } = window["framer-motion"];

        const loginCard = document.getElementById("login-card");

        motion(loginCard, {
            initial: { opacity: 0, y: -50 },
            animate: { opacity: 1, y: 0 },
            transition: { duration: 0.7 }
        }).start();
    </script>
</body>
</html>
