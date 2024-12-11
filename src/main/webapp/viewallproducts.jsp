<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.klef.jfsd.springboot.model.Farmer" %>
<%
Farmer farmer = (Farmer) session.getAttribute("farmer");
if (farmer == null) {
    response.sendRedirect("farmersessionexpiry");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Products</title>
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-300">



<!-- Sidebar -->
<aside class="fixed top-0 left-0 w-64 h-full bg-gray-800 text-white shadow-lg flex flex-col justify-between">
    <div class="py-6 px-6">
        <h2 class="text-2xl font-bold mb-6 text-center">Farmer Menu</h2>
        <ul class="space-y-4">
            <li><a href="farmerhome" class="block px-4 py-2 rounded-lg bg-blue-100 text-gray-800 hover:bg-blue-200">Home</a></li>
            <li><a href="addproducts" class="block px-4 py-2 rounded-lg bg-blue-100 text-gray-800 hover:bg-blue-200">Add Products</a></li>
            <li><a href="viewallproducts" class="block px-4 py-2 rounded-lg bg-blue-100 text-gray-800 hover:bg-blue-200">View All Products</a></li>
            <li><a href="displayfarmersbyproducts" class="block px-4 py-2 rounded-lg bg-blue-100 text-gray-800 hover:bg-blue-200">View Farmers by Products</a></li>
            <li><a href="farmerprofile" class="block px-4 py-2 rounded-lg bg-blue-100 text-gray-800 hover:bg-blue-200">Farmer Profile</a></li>
        </ul>
    </div>
    <div class="py-4 px-6 mb-4">
        <a href="emplogout" class="block text-center bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded-lg">Logout</a>
    </div>
</aside>

<    <div class="flex-1 flex flex-col ml-64">
        <!-- Navbar -->
        <nav class="bg-white dark:bg-gray-900 w-full z-20 top-0 left-0 border-b border-gray-200 dark:border-gray-600 p-4 fixed">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="farmerhome.jsp" class="text-2xl font-semibold text-blue-700">Farmer  </a>
                <ul class="flex items-center space-x-4">
                    <li>
                        <a href="farmerlogout" class="text-gray-900 hover:text-blue-700">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

    <!-- Content -->
    <div class="container mx-auto mt-24 px-4 py-6">
        <!-- Filters -->
<div class="flex flex-col mb-6">
    <nav class="bg-white dark:bg-gray-900 p-4 shadow-md">
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

        <!-- Conditional Search Bar Display -->
        <div id="searchBarContainer" class="max-w-screen-xl mx-auto mt-4 hidden flex items-center space-x-4">
            <!-- Search Input with Custom Gradient and Search Icon -->
            <div class="relative w-1/3">
                  <input type="text" id="searchBar" onkeyup="searchProducts()" placeholder="Search for products..." 
        class="p-3 pl-12 w-full bg-gray-200 rounded-lg shadow-lg text-gray-800 focus:outline-none focus:ring-4 focus:ring-gray-400 focus:border-transparent placeholder-gray-500 font-semibold">
    <!-- Search Icon -->
                <span class="absolute left-4 top-1/2 transform -translate-y-1/2 text-gray-700 dark:text-gray-200">
                    <i class="fas fa-search"></i>
                </span>
            </div>
        </div>
    </nav>
</div>

        <!-- Products Grid -->
<div id="productGrid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <c:forEach items="${plist}" var="product">
        <div class="card bg-white rounded-lg shadow-md p-4 product-card" data-category="${product.category}">
            <img src="displayproductimage?id=${product.id}" alt="${product.name}" class="w-full h-64 object-cover rounded-t-lg">
            <h3 class="text-xl font-bold text-gray-800 mt-4">${product.name}</h3>
            <p class="text-green-600 font-bold">&#8377;${product.cost}</p>
            <p class="text-gray-600">${product.description}</p>
        </div>
    </c:forEach>
</div>

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


    function searchProducts() {
        const query = document.getElementById("searchBar").value.toLowerCase();
        const cards = document.querySelectorAll(".product-card");

        cards.forEach(card => {
            const name = card.querySelector("h3").textContent.toLowerCase();
            card.style.display = name.includes(query) ? "block" : "none";
        });
    }
    
    function updateSearchPlaceholder() {
        const searchFilter = document.getElementById('searchFilter').value;
        const searchBar = document.getElementById('searchBar');

        if (searchFilter === 'name') {
            searchBar.placeholder = "Search by product name...";
        } else if (searchFilter === 'cost') {
            searchBar.placeholder = "Search by product cost...";
        }
    }

 // Toggle visibility of the search bar based on the search filter selection
    function toggleSearchBar() {
        const searchFilter = document.getElementById('searchFilter').value;
        const searchBarContainer = document.getElementById('searchBarContainer');
        
        if (searchFilter) {
            // Show the search bar when a filter option is selected
            searchBarContainer.classList.remove('hidden');
        } else {
            // Hide the search bar if no filter is selected
            searchBarContainer.classList.add('hidden');
        }
    }

    // Function for searching products based on the selected filter
    function searchProducts() {
        const searchTerm = document.getElementById('searchBar').value;
        const searchFilter = document.getElementById('searchFilter').value;

        // Implement the search functionality based on the selected filter
        console.log(`Searching for ${searchTerm} by ${searchFilter}`);
    }


 
</script>

</body>
</html>
