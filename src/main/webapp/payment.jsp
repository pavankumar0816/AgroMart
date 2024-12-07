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
    <title>Order Form</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.0/dist/tailwind.min.css" rel="stylesheet">
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Ensures dropdown closes when clicking outside */
        body { position: relative; }
        .payment-box {
            transition: background-color 0.3s ease, height 0.3s ease;
        }
        .payment-box.online {
            background-color: #e0f7fa; /* Light cyan for online payment */
        }
        .payment-box.cod {
            background-color: #e8f5e9; /* Light green for COD */
        }
        #scannerBox {
            display: none;
        }
    </style>
</head>
<body class="bg-white">
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
                            <li><a href="payment" class="block px-4 py-2 hover:bg-gray-100"><i class="fas fa-shopping-bag mr-2"></i>Order Summary</a></li>
                            <li><a href="myorders" class="block px-4 py-2 hover:bg-gray-100"><i class="fas fa-shopping-bag mr-2"></i>My Orders</a></li>
                            <li><a href="notifications" class="block px-4 py-2 hover:bg-gray-100"><i class="fas fa-bell mr-2"></i> Notifications</a></li>
                            <li><a href="customerlogout" class="block px-4 py-2 hover:bg-gray-100"><i class="fas fa-sign-out-alt mr-2"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        
        <div class="max-w-7xl mx-auto p-8">
            <form action="saveorder" method="POST">
                <div class="flex justify-between space-x-8 p-8 rounded-lg shadow-lg">
                    <!-- Address Form -->
                    <div class="w-1/2 bg-b2c9ad p-6 shadow-md rounded-lg">
                        <h2 class="text-2xl font-semibold text-gray-700 mb-6">Fill Address</h2>
                        <div class="grid grid-cols-2 gap-4 mb-4">
                            <input type="text" name="fullname" placeholder="Enter Full Name" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                        <div class="grid grid-cols-2 gap-4 mb-4">
                            <input type="email" name="email" placeholder="Email" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                            <input type="text" name="mobileno" placeholder="Mobile Number" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                        <div class="grid grid-cols-2 gap-4 mb-4">
                            <input type="text" name="address" placeholder="Address" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                            <input type="text" name="city" placeholder="City" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                        <div class="grid grid-cols-2 gap-4 mb-4">
                            <input type="text" name="state" placeholder="State" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                            <input type="text" name="pincode" placeholder="Pincode" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                    </div>

                    <!-- Payment Info Form -->
                    <div id="paymentBox" class="w-1/2 bg-white p-6 shadow-md rounded-lg payment-box">
                        <h2 class="text-2xl font-semibold text-gray-700 mb-6">Payment Details</h2>
                        <div class="space-y-4">
                            <div class="flex justify-between">
                                <p>Total Price</p>
                                <p>₹ ${orderprice}</p>
                            </div>
                            <div class="flex justify-between">
                                <span class="font-medium text-gray-600">Delivery Fee:</span>
                                <span class="text-gray-700 text-lg">₹ 250</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="font-medium text-gray-600">Tax:</span>
                                <span class="text-gray-700 text-lg">₹ 100</span>
                            </div>
                            <div class="flex justify-between text-lg font-semibold">
                                <p>Total Order Price</p>
                                <p>₹ ${totalorderprice}</p>
                            </div>

                            <!-- Payment Type Dropdown -->
                            <div class="mt-6">
                                <label for="paymentType" class="block text-gray-600 mb-2">Select Payment Type</label>
                                <select id="paymentType" name="paymentType" class="w-full p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                                    <option value="">--select--</option>
                                    <option value="COD">Cash On Delivery</option>
                                    <option value="ONLINE">Online Payment</option>
                                </select>
                            </div>

                            <!-- Scanner Image -->
                            <div id="scannerBox" class="hidden mt-6 p-6 border border-blue-300 rounded-md bg-white shadow-lg">
                                <div class="flex flex-col items-center">
                                    <img src="Scanner.jpg" alt="Scanner" class="w-64 h-64 object-cover rounded-md border border-gray-200 shadow-md">
                                    <p class="text-center text-gray-600 mt-4 text-lg font-medium">Scan to Pay</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Place Order Button -->
                <div class="mt-6">
                    <button type="submit" class="w-full bg-blue-500 text-white py-3 rounded-md hover:bg-blue-600 transition-all">Place Order</button>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/qrcode/build/qrcode.min.js"></script>
        <script>
            const paymentType = document.getElementById('paymentType');
            const paymentBox = document.getElementById('paymentBox');
            const scannerBox = document.getElementById('scannerBox');

            paymentType.addEventListener('change', function () {
                if (this.value === 'ONLINE') {
                    paymentBox.classList.add('online');
                    paymentBox.classList.remove('cod');
                    scannerBox.style.display = 'block';
                } else {
                    paymentBox.classList.add('cod');
                    paymentBox.classList.remove('online');
                    scannerBox.style.display = 'none';
                }
            });
            
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
