<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@page import="com.klef.jfsd.springboot.model.Farmer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Farmer farmer = (Farmer)  session.getAttribute("farmer");
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Farmer</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex min-h-screen bg-gray-100">

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
 

        <!-- Main Content -->
        <main class="flex-grow pt-20 px-8">
            <h4 class="text-center text-red-500">
                <c:out value="${message}"></c:out>
            </h4>
            
            <h3 class="text-center text-lg font-semibold underline mb-6">Update Farmer</h3>
            <div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-lg">
                <form method="post" action="updatefarmerprofile" class="space-y-4">
                    <div>
                        <label for="fid" class="block font-medium">Farmer ID</label>
                        <input type="number" id="fid" name="fid" class="w-full px-4 py-2 border border-gray-300 rounded-md" value="<%= farmer.getId() %>" readonly required/>
                    </div>
                    <div>
                        <label for="fname" class="block font-medium">Enter Name</label>
                        <input type="text" id="fname" name="fname" value="<%= farmer.getName() %>" class="w-full px-4 py-2 border border-gray-300 rounded-md" required/>
                    </div>
                    <div>
                        <label for="fadd" class="block font-medium">Enter Address</label>
                        <input type="text" id="fadd" name="fadd" value="<%= farmer.getAddress() %>" class="w-full px-4 py-2 border border-gray-300 rounded-md" required/>
                    </div>
                    <div>
                        <label for="ffarmsize" class="block font-medium">Enter Farm Size</label>
                        <input type="text" id="ffarmsize" name="ffarmsize" value="<%= farmer.getFarmsize() %>" class="w-full px-4 py-2 border border-gray-300 rounded-md" required/>
                    </div>
                    <div>
                        <label for="fprod" class="block font-medium">Select Type of Products</label>
                        <select id="fprod" name="fprod" class="w-full px-4 py-2 border border-gray-300 rounded-md" required>
                            <option value="">-- Select Product Type --</option>
                            <option value="Processed Foods" <%= farmer.getProductsProduced().equals("Processed Foods") ? "selected" : "" %>>Processed Foods</option>
                            <option value="Handmade Goods" <%= farmer.getProductsProduced().equals("Handmade Goods") ? "selected" : "" %>>Handmade Goods</option>
                            <option value="Organic Fertilizers" <%= farmer.getProductsProduced().equals("Organic Fertilizers") ? "selected" : "" %>>Organic Fertilizers</option>
                            <option value="Dairy and Animal Products" <%= farmer.getProductsProduced().equals("Dairy and Animal Products") ? "selected" : "" %>>Dairy and Animal Products</option>
                            <option value="Packaging and Byproducts" <%= farmer.getProductsProduced().equals("Packaging and Byproducts") ? "selected" : "" %>>Packaging and Byproducts</option>
                        </select>
                    </div>
                    <div>
                        <label for="fcontact" class="block font-medium">Enter Contact</label>
                        <input type="number" id="fcontact" name="fcontact" value="<%= farmer.getContact() %>" class="w-full px-4 py-2 border border-gray-300 rounded-md" required/>
                    </div>
                     
                    <div class="flex space-x-4 pt-4">
                        <input type="submit" value="Update" class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded-md"/>
                        <input type="reset" value="Clear" class="bg-red-500 hover:bg-red-600 text-white font-semibold py-2 px-4 rounded-md"/>
                    </div>
                </form>
            </div>
        </main>
    </div>

</body>
</html>
