<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>View All Orders</title>
    <!-- Tailwind CSS CDN -->
   <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Ensures dropdown closes when clicking outside */
        body { position: relative; }
    </style>
</head>
<body class="bg-gray-300">

    <!-- Page Content -->
    <div class="flex-1 p-6 mt-16">
    <!-- Navbar -->
    <nav class="bg-white shadow-md fixed top-0 left-0 w-full z-50">
        <div class="max-w-screen-xl mx-auto flex items-center justify-between p-4">
            <!-- Logo -->
            <a href="index.jsp" class="text-2xl font-bold text-green-700">AgroMart</a>

            <!-- Search Bar -->
            <div class="flex items-center w-1/2">
                <input 
                    type="text" 
                    placeholder="Search By Order ID" 
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
    
        <div class="w-full max-w-6xl mx-auto bg-yellow-100 rounded-lg shadow-lg p-6">
            <h3 class="text-center text-2xl font-bold mb-4">My Orders</h3>

            <!-- Check if orders list is empty -->
            <c:if test="${empty orders}">
                <p class="text-center text-red-500">No orders found.</p>
            </c:if>

            <div class="overflow-x-auto bg-gray-200 p-4 rounded-lg"> <!-- Background color for table -->
                <table class="min-w-full border-collapse bg-pink-100">
                    <thead class="bg-black text-white">
                        <tr>
                            <th class="border border-black p-2">Order ID</th>
                            <th class="border border-black p-2">Date</th>
                            <th class="border border-black p-2">Product Details</th>
                            <th class="border border-black p-2">Price</th>
                             <th class="border border-black p-2">Status</th>
                            <th class="border border-black p-2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Loop through orders -->
                        <c:forEach items="${orders}" var="order">
                            <tr class="border-b border-gray-300">
                                <td class="border border-black p-2"><c:out value="${order.orderId}"/></td>
                                <td class="border border-black p-2"><c:out value="${order.orderDate}"/></td>
                                <td class="border border-black p-2"><c:out value="${order.product.name}"/></td>
                                <td class="border border-black p-2 bg-yellow-100 text-gray-800 dark:bg-gray-700 dark:text-white">
                                    <c:out value="Quantity: ${order.quantity}"/><br>
                                    <c:out value="Price: ${order.product.cost}"/><br>
                                    <span class="font-bold text-black">Total Price:</span>
                                    <span class="font-bold text-green-500">${order.quantity * order.product.cost}</span>
                                </td>
                                <td class="border border-black p-2"><c:out value="${order.status}"/></td>
                                
								<!-- Table Row for Order Actions -->
								<td class="border border-black p-2">
								    <c:choose>
								        <c:when test="${order.status == 'Cancelled'}">
								            <!-- Disabled button for already cancelled orders -->
								            <button 
										    class="bg-gray-300 text-gray-700 font-semibold py-2 px-4 rounded cursor-not-allowed opacity-50 filter " 
										    disabled>
										    Cancel
										</button>

								        </c:when>
								        <c:otherwise>
								            <!-- Active Cancel button -->
								            <form action="<c:url value='/updateorderstatus' />" method="GET" class="inline-block">
								                <input type="hidden" name="id" value="${order.id}" />
								                <input type="hidden" name="status" value="6" />
								                <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-semibold py-2 px-4 rounded">
								                    Cancel
								                </button>
								            </form>
								        </c:otherwise>
								    </c:choose>
								</td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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
