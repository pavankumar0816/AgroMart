<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.springboot.model.Customer"%>
<%
Customer customer = (Customer) session.getAttribute("customer");
if (customer == null) {
    response.sendRedirect("customersessionexpiry.jsp");
    return;
}
 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Farmer Products</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script>
        // JavaScript to toggle the dropdown
        function toggleDropdown() {
            const dropdown = document.getElementById('account-dropdown');
            dropdown.classList.toggle('hidden');
        }
    </script>
</head>
<body class="bg-white">

     
    <!-- Main Content -->
    <div class="flex-1 flex flex-col ml-64">
        <!-- Navbar -->
        <nav class="bg-white w-full z-20 top-0 left-0 border-b border-gray-200 p-4 fixed shadow">
            <div class="max-w-screen-xl mx-auto font-bold flex items-center justify-between">
				 <a href="index.jsp" class="text-2xl font-bold text-green-700">AgroMart</a>

			     
                <ul class="flex items-center space-x-4">
                    <li class="relative">
                        <a href="mycart" class="flex items-center text-gray-700 hover:text-blue-700 bg-yellow-300 hover:bg-yellow-200 px-4 py-2 rounded-lg transition-all focus:outline-none">
                            <i class="fas fa-shopping-cart mr-2"></i> My Cart
                        </a>
                    </li>
                    <!-- Account Dropdown in Navbar -->
                    <li class="relative">
                        <button onclick="toggleDropdown()" class="flex items-center text-gray-700 hover:text-blue-700 bg-red-100 hover:bg-blue-200 px-4 py-2 rounded-lg transition-all focus:outline-none">
                            <i class="fas fa-user mr-2"></i> Account
                            <i class="fas fa-chevron-down ml-2"></i>
                        </button>
                        <ul class="hidden flex-col bg-gray-700 mt-2 rounded-md shadow-lg absolute top-full right-0 w-48 z-30" id="account-dropdown">
                            <li class="hover:bg-gray-600">
                                <a href="customerprofile" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-id-card mr-2"></i> Profile
                                </a>
                            </li>
                            <li class="hover:bg-gray-600">
                                <a href="updatecustomer" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-edit mr-2"></i> Edit Profile
                                </a>
                            </li>
                            
                            <li class="hover:bg-gray-600">
                                <a href="browsefaqs" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-question-circle mr-2"></i> Browse FAQs
                                </a>
                            </li>
                            <!-- Cart and Wishlist inside Account Dropdown -->
                            <li class="hover:bg-gray-600">
                                <a href="myorders" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-heart mr-2"></i> My Orders
                                </a>
                            </li>
                            <li class="hover:bg-gray-600">
                                <a href="mycart" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-shopping-cart mr-2"></i> Cart
                                </a>
                            </li>
                            <li class="border-t border-gray-600 hover:bg-gray-600">
                                <a href="customerlogout" class="flex items-center px-4 py-2 text-red-400 font-semibold">
                                    <i class="fas fa-sign-out-alt mr-2"></i> Signout
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Category and Cost Filter Navbar -->
        <nav class="bg-gray-200 p-4 shadow-md mt-16">
            <div class="max-w-screen-xl mx-auto flex justify-between items-center">
                <!-- Category Dropdown -->
                <div class="flex items-center w-1/2">
                    <select id="categorySelect" onchange="filterByCategory()" 
                        class="p-2 w-full bg-yellow-200 rounded-lg shadow-md text-gray-700 dark:text-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <option value="">Browse Categories</option>
                        <option value="All Categories">All Categories</option>
                        <option value="Processed Foods">Processed Foods</option>
                        <option value="Handmade Goods">Handmade Goods</option>
                        <option value="Organic Fertilizers">Organic Fertilizers</option>
                        <option value="Dairy and Animal Products">Dairy and Animal Products</option>
                    </select>
                </div>

                <!-- Cost Filter Dropdown -->
                <div class="flex items-center w-1/3">
                    <select id="costFilter" onchange="filterByCost()" 
                        class="p-2 w-full bg-yellow-200 rounded-lg shadow-md text-gray-700 dark:text-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500">
                        <option value="">Select By Cost Range</option>
                        <option value="low">Low Cost</option>
                        <option value="medium">Medium Cost</option>
                        <option value="high">High Cost</option>
                    </select>
                </div>
            </div>
        </nav>

        <!-- Products Grid -->
        <div id="productGrid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-6">
            <c:forEach items="${plist}" var="product">
                <div class="card bg-white rounded-lg shadow-md p-4 product-card" 
                     data-category="${product.category}" 
                     data-cost="${product.cost}">
                    <img src="displayproductimage?id=${product.id}" alt="${product.name}" class="w-full h-64 object-cover rounded-t-lg">
                    <h3 class="text-xl font-bold text-gray-800 mt-4">${product.name}</h3>
                    <p class="text-green-600 font-bold">&#8377;${product.cost}</p>
                    <p class="text-gray-600">${product.description}</p>
                    <!-- View Details Button -->
                    <a href="viewproductdetails?id=${product.id}" 
                       class="block mt-4 bg-blue-500 hover:bg-blue-600 text-white text-center py-2 px-4 rounded-lg shadow-md transition-all duration-300">
                        View Details
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
<script>
    function filterByCategory() {
        const category = document.getElementById("categorySelect").value;
        const grid = document.getElementById("productGrid");
        const cards = document.querySelectorAll(".product-card");

        grid.classList.remove("hidden");
        cards.forEach(card => {
            const cardCategory = card.getAttribute("data-category");
            card.style.display = (category === "All Categories" || cardCategory === category) ? "block" : "none";
        });
    }

    function filterByCost() {
        const costRange = document.getElementById("costFilter").value;
        const cards = document.querySelectorAll(".product-card");

        cards.forEach(card => {
            const cost = parseInt(card.getAttribute("data-cost"), 10); // Ensure the cost is a number
            let isVisible = false;

            if (costRange === "low" && cost > 0 && cost <= 200) isVisible = true;
            if (costRange === "medium" && cost > 200 && cost < 750) isVisible = true;
            if (costRange === "high" && cost >= 750) isVisible = true;

            card.style.display = isVisible ? "block" : "none";
        });
    }
</script>
</body>
</html>
