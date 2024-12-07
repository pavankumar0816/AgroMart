<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.klef.jfsd.springboot.model.Customer"%>
<%
Customer customer = (Customer) session.getAttribute("customer");
if (customer == null) 
{
    response.sendRedirect("customersessionexpiry.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Cart</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Ensures dropdown closes when clicking outside */
        body { position: relative; }
    </style>
</head>
<body class="bg-gray-100">

    <!-- Navbar -->
    <nav class="bg-white shadow-md fixed top-0 left-0 w-full z-50">
        <div class="max-w-screen-xl mx-auto flex items-center justify-between p-4">
            <!-- Logo -->
            <a href="index.jsp" class="text-2xl font-bold text-green-700">AgroMart</a>

            <!-- Search Bar -->
            <div class="flex items-center w-1/2">
                <input 
                    type="text" 
                    placeholder="Search for products..." 
                    class="w-full px-4 py-2 border rounded-l-md focus:outline-none focus:ring-2 focus:ring-green-500"
                >
                <button class="bg-green-500 text-white px-4 py-2 rounded-r-md hover:bg-green-600">
                    <i class="fas fa-search"></i>
                </button>
            </div>

            <!-- Account Dropdown -->
            <ul class="flex items-center space-x-6">
                <li class="relative">
                    <button id="accountButton" class="flex items-center text-gray-700 font-semibold">
                        <i class="fas fa-user-circle mr-2"></i> My Account
                        <i class="fas fa-chevron-down ml-2"></i>
                    </button>
                    <!-- Dropdown Menu -->
                    <ul id="accountDropdown" class="absolute right-0 mt-2 bg-white shadow-lg rounded-md p-2 hidden">
                        <li><a href="customerprofile" class="block px-4 py-2 hover:bg-gray-100"><i class="fas fa-user mr-2"></i> Profile</a></li>
                        <li><a href="payment" class="block px-4 py-2 hover:bg-gray-100"><i class="fas fa-shopping-bag mr-2"></i>Orde Summary</a></li>
                         <li><a href="myorders" class="block px-4 py-2 hover:bg-gray-100"><i class="fas fa-shopping-bag mr-2"></i>My Orders</a></li>
                        <li><a href="notifications" class="block px-4 py-2 hover:bg-gray-100"><i class="fas fa-bell mr-2"></i> Notifications</a></li>
                        <li><a href="customerlogout" class="block px-4 py-2 hover:bg-gray-100"><i class="fas fa-sign-out-alt mr-2"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mx-auto mt-24 flex gap-8">
        <!-- Cart Items Section -->
        <div class="w-2/3">
            <h1 class="text-2xl font-bold text-gray-800 mb-6">My Cart</h1>
            <div class="space-y-6">
                <c:forEach var="cart" items="${carts}">
                    <div class="bg-white rounded-lg shadow-md p-4 flex items-center">
                        <!-- Product Image -->
                        <div class="w-1/4">
                            <img src="${pageContext.request.contextPath}/displayfarmerproductimage?id=${cart.productid.id}" 
                                 alt="${cart.productid.name}" 
                                 class="rounded-lg w-full h-full object-cover">
                        </div>
                        <!-- Product Details -->
                        <div class="ml-6 flex-1">
                            <h2 class="text-lg font-semibold text-gray-700">${cart.productid.name}</h2>
                            <p class="text-gray-500 text-sm">${cart.productid.description}</p>
                            <p class="text-gray-500 text-sm">Category: ${cart.productid.category}</p>
                            <div class="mt-4 flex items-center">
                                <!-- Decrease Button -->
                                <form method="get" action="/cartquantity" class="inline">
                                    <input type="hidden" name="symbol" value="de" />
                                    <input type="hidden" name="cid" value="${cart.cid}" />
                                    <button type="submit" class="bg-red-500 text-white px-3 py-1 rounded-md hover:bg-red-600">
                                        -
                                    </button>
                                </form>
                                <!-- Quantity Display -->
                                <div class="mx-4 bg-gray-200 text-gray-800 px-3 py-1 rounded-md">${cart.quantity}</div>
                                <!-- Increase Button -->
                                <form method="get" action="/cartquantity" class="inline">
                                    <input type="hidden" name="symbol" value="in" />
                                    <input type="hidden" name="cid" value="${cart.cid}" />
                                    <button type="submit" class="bg-green-500 text-white px-3 py-1 rounded-md hover:bg-green-600">
                                        +
                                    </button>
                                </form>
                            </div>
                        </div>
                        <!-- Total Price -->
                        <div class="text-right">
                            <p class="text-xl font-bold text-gray-700">₹ ${cart.totalprice}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Price Details Section -->
        <div class="w-1/3 bg-white rounded-lg shadow-md p-6">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Price Details</h2>
            <div class="space-y-4">
                <div class="flex justify-between">
                    <p>Total Price</p>
                    <p>₹ ${totalorderprice}</p>
                </div>
                <div class="flex justify-between">
                    <p>Discount</p>
                    <p>- ₹500 </p>
                </div>
                <div class="flex justify-between">
                    <p>Delivery Charges</p>
                    <p>₹ 50</p>
                </div>
                <hr>
                <div class="flex justify-between text-lg font-semibold">
                    <p>Total Order Price</p>
                    <p>₹ ${totalorderprice}</p>
                </div>
                <br><br>
                <hr>
                <br>
                <a href="payment">
                    <button class="bg-green-600 text-white px-8 py-3 rounded-lg hover:bg-green-700 transition">
                        Proceed to Payment &nbsp; ->
                    </button>
                </a>
                
                <hr>
                <br>
                
                 <a href="viewallfarmerproducts">
                    <button class="bg-red-600 text-white px-8 py-3 rounded-lg hover:bg-red-900 transition">
                    <-  &nbsp; Back to Products
                    </button>
                </a>
            </div>
        </div>
    </div>

    
    <!-- JavaScript -->
    <script>
        const accountButton = document.getElementById("accountButton");
        const accountDropdown = document.getElementById("accountDropdown");

        // Toggle the dropdown on button click
        accountButton.addEventListener("click", () => {
            accountDropdown.classList.toggle("hidden");
        });

        // Close dropdown when clicking outside
        document.addEventListener("click", (event) => {
            if (!accountButton.contains(event.target) && !accountDropdown.contains(event.target)) {
                accountDropdown.classList.add("hidden");
            }
        });
    </script>
</body>
</html>
