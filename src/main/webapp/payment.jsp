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
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body { position: relative; }
        .payment-box {
            transition: background-color 0.3s ease, height 0.3s ease;
        }
        .payment-box.online {
            background-color: #e0f7fa;
        }
        .payment-box.cod {
            background-color: #e8f5e9;
        }
        #scannerBox {
            display: none;
        }
    </style>
</head>
<body class="bg-white">
    <div class="flex-1 p-6 mt-16">
        <nav class="bg-white shadow-md fixed top-0 left-0 w-full z-50">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between p-4">
                <a href="index.jsp" class="text-2xl font-bold text-green-700">AgroMart</a>
                <div class="flex items-center w-1/2">
                    <input type="text" placeholder="Search By Order ID" class="w-full px-4 py-2 border rounded-l-md focus:outline-none focus:ring-2 focus:ring-green-500">
                    <button class="bg-green-500 text-white px-4 py-2 rounded-r-md hover:bg-green-600">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <ul class="flex items-center space-x-6">
                    <li class="relative">
                        <button id="accountButton" class="flex items-center text-gray-700 font-semibold">
                            <i class="fas fa-user-circle mr-2"></i> My Account
                            <i class="fas fa-chevron-down ml-2"></i>
                        </button>
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
            <form id="orderForm">
                <div class="flex justify-between space-x-8 p-8 rounded-lg shadow-lg">
                    <div class="w-1/2 bg-b2c9ad p-6 shadow-md rounded-lg">
                        <h2 class="text-2xl font-semibold text-gray-700 mb-6">Fill Address</h2>
                        <div class="grid grid-cols-2 gap-4 mb-4">
                            <input type="text" id="name" name="fullname" placeholder="Enter Full Name" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                        <div class="grid grid-cols-2 gap-4 mb-4">
                            <input type="email" id="email" name="email" placeholder="Email" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                           <input type="text" id="phno" name="mobileno" placeholder="Mobile Number" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>

                        </div>
                        <div class="grid grid-cols-2 gap-4 mb-4">
                            <input type="text" id="address" name="address" placeholder="Address" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                            <input type="text" id="city" name="city" placeholder="City" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                        <div class="grid grid-cols-2 gap-4 mb-4">
                            <input type="text" id="state" name="state" placeholder="State" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                            <input type="text" id="pincode" name="pincode" placeholder="Pincode" class="p-3 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        </div>
                    </div>
                </div>
                <div class="mt-6">
                    <button type="button" id="rzp-button1" class="w-full bg-blue-500 text-white py-3 rounded-md hover:bg-blue-600 transition-all">Place Order</button>
                </div>
            </form>
        </div>
        
        <script src="https://checkout.razorpay.com/v1/checkout.js" ></script>

        <script>
        async function createOrder() {
            console.log("---- order creation started -----");
            
            const totalAmount = ${orderprice}
            
            const response = await fetch('/saveorder', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    fullname: document.getElementById('name').value,  // Full Name
                    email: document.getElementById('email').value,    // Email
                    phno: document.getElementById('phno').value,      // Mobile Number
                    address: document.getElementById('address').value, // Address
                    city: document.getElementById('city').value,       // City
                    state: document.getElementById('state').value,     // State
                    pincode: document.getElementById('pincode').value,
                    amount: totalAmount,
                    currency: 'INR'                                    // Currency (Assuming INR is constant)
                })
            });
            const order = await response.json();
            console.log("Order creation completed:");
            return order;
        }

        document.getElementById('rzp-button1').onclick = async function (e) {
            const order = await createOrder();
            console.log(order);

            if (!order || !order.razorpayOrderId || !order.amount) {
                console.error('Invalid order details:', order);
                return;
            }

            var options = {
                "key": "rzp_test_aFsYJfzVozWYwE",  
                "amount": order.amount,   
                "currency": "INR",
                "name": "PMPK",
                "description": "AgroMart Payments",
                "order_id": order.razorpayOrderId,     
                "receipt": order.email,
                "callback_url" : "handle-payment",
                "prefill": {
                    "name": order.fullname,
                    "email": order.email,
                    "contact": order.phno
                },
                "theme": {
                    "color": "#3399cc"
                }
            };

            const rzp = new Razorpay(options);
            rzp.open();
        };


        // Account Dropdown toggle
        document.getElementById("accountButton").addEventListener("click", function (event) {
            const accountDropdown = document.getElementById("accountDropdown");
            accountDropdown.classList.toggle("hidden");
            event.stopPropagation(); // Prevent the click from propagating to the document
        });

        document.addEventListener("click", function (event) {
            const accountButton = document.getElementById("accountButton");
            const accountDropdown = document.getElementById("accountDropdown");
            if (!accountButton.contains(event.target) && !accountDropdown.contains(event.target)) {
                accountDropdown.classList.add("hidden"); // Hide the dropdown if clicked outside
            }
        });
        </script>
    </body>
</html>
