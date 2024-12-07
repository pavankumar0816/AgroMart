<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
    <title>Customer Orders</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-300 font-sans min-h-screen flex flex-col">
    <!-- Sidebar -->
    <aside class="fixed top-16 left-0 w-72 h-full bg-gray-800 text-white shadow-md flex flex-col justify-between transition-all duration-500 ease-in-out transform">
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
    <div class="flex-1 flex flex-col ml-72"> <!-- Adjusted for wider sidebar -->
        <!-- Navbar -->
        <nav class="bg-white w-full z-20 top-0 left-0 border-b border-gray-200 p-4 fixed">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="adminhome.jsp" class="text-2xl font-semibold text-blue-700">Admin</a>
                <ul class="flex items-center space-x-4">
                    <li><a href="adminlogout" class="text-gray-900 hover:text-blue-700">Logout</a></li>
                </ul>
            </div>
        </nav>
 
<!-- Page Content -->
<div class="flex-1 p-6 mt-16">
    <div class="w-full max-w-7xl mx-auto bg-white rounded-lg shadow-lg p-6">
        <h3 class="text-center text-2xl font-bold mb-4">Customer Orders</h3>
<c:choose>
    <c:when test="${empty allorders}">
        <div class="w-full bg-yellow-100 text-gray-800 text-center p-4 rounded-lg">
            <p class="text-xl font-semibold">No orders are received.</p>
        </div>
    </c:when>
    <c:otherwise>
        <table class="w-full border-collapse">
            <thead class="bg-black text-white">
                <tr>
                    <th class="border border-black px-4 py-2">Order ID</th>
                    <th class="border border-black px-4 py-2">Delivery Details</th>
                    <th class="border border-black px-4 py-2">Date</th>
                    <th class="border border-black px-4 py-2">Product Details</th>
                    <th class="border border-black px-4 py-2">Price</th>
                    <th class="border border-black px-4 py-2">Status</th>
                    <th class="border border-black px-4 py-2">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${allorders}" var="order">
                    <tr class="border-b border-gray-300">
                        <td class="border border-black px-4 py-2 text-center"><c:out value="${order.orderId}" /></td>
                        <td class="border border-black px-4 py-2 bg-orange-200 text-gray-800 dark:bg-gray-700 dark:text-white">
                            <div><span class="font-bold">Name:</span> <c:out value="${order.orderAddress.fullname}" /></div>
                            <div><span class="font-bold">Email:</span> <c:out value="${order.orderAddress.email}" /></div>
                            <div><span class="font-bold">Mobile No:</span> <c:out value="${order.orderAddress.mobileNo}" /></div>
                            <div><span class="font-bold">Address:</span> <c:out value="${order.orderAddress.address}" /></div>
                        </td>
                        <td class="border border-black px-4 py-2 text-center">
                            <c:out value="${order.orderDate}" />
                        </td>
                        <td class="border border-black px-4 py-2 text-center"><c:out value="${order.product.name}" /></td>
                        <td class="border border-black px-4 py-2 bg-yellow-100 text-gray-800 dark:bg-gray-700 dark:text-white text-center">
                            Quantity: <c:out value="${order.quantity}" />, 
                            Price: <c:out value="${order.product.cost}" />, 
                            <span class="font-bold">Total:</span> <span class="text-green-500"><c:out value="${order.quantity * order.product.cost}" /></span>
                        </td>
                        <td class="border border-black px-4 py-2 text-center"><c:out value="${order.status}" /></td>
                        <td class="border border-black px-4 py-2 text-center">
                            <form action="<c:url value='update-orderstatus' />" method="POST" class="flex items-center space-x-2">
                                <input type="hidden" name="id" value="${order.id}" />
                                <select name="status" class="p-2 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-400">
                                    <option value="Select" selected>---Select---</option>
                                    <option value="1">In Progress</option>
                                    <option value="2">Order Received</option>
                                    <option value="3">Product Packed</option>
                                    <option value="4">Out for Delivery</option>
                                    <option value="5">Delivered</option>
                                    <option value="6">Cancelled</option>
                                </select>
                                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded">
                                    Update
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>


        </div>
    </div>
</div>



    </div>
</body>

</html>
