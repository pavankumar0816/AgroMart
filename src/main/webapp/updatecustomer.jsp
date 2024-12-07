<%@ page import="com.klef.jfsd.springboot.model.Customer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <title>Update Customer</title>
    
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
  <script>
        // JavaScript to toggle the dropdown
        function toggleDropdown() {
            const dropdown = document.getElementById('account-dropdown');
            dropdown.classList.toggle('hidden');
        }
    </script>
    <style>
        /* Animation styles */
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
<body class="bg-gray-100 h-screen flex">

     <!-- Sidebar -->
    <!-- <aside class="fixed top-0 left-0 w-64 h-full bg-gray-700 text-white shadow-lg flex flex-col justify-between">
        Sidebar Menu
        <div class="py-6 px-6">
            <h2 class="text-2xl font-bold mb-6">Customer Menu</h2>
            <ul class="space-y-4">
                <li>
                    <a href="customerhome" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition-all">
                        Home
                    </a>
                </li>
                <li>
                    <a href="viewallfarmerproducts" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition-all">
                        View All Products
                    </a>
                </li>
            </ul>
        </div>
    </aside> -->
   <!-- Main Content -->
    <div class="flex-1 flex flex-col ml-64">
        <!-- Navbar -->
        <nav class="bg-white w-full z-20 top-0 left-0 border-b border-gray-200 p-4 fixed shadow">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
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
        <!-- Update Customer Form -->
        <main class="flex-grow pt-20 px-8">
            <h3 class="text-center text-lg font-semibold underline mb-6">Update Customer</h3>
            <div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-lg">
                <form method="post" action="updatecustomerprofile" class="space-y-4">
                    <div>
                        <label for="cid" class="block font-medium">Customer ID</label>
                        <input type="number" id="cid" name="cid" class="w-full px-4 py-2 border rounded-md" value="<%= customer.getId() %>" readonly required />
                    </div>
                    <div>
                        <label for="cname" class="block font-medium">Name</label>
                        <input type="text" id="cname" name="cname" class="w-full px-4 py-2 border rounded-md" value="<%= customer.getName() %>" required />
                    </div>
                    <div class="mb-4">
                <label class="block text-lg font-medium text-gray-700">Select Gender</label>
                <div class="flex space-x-4 mt-2">
                    <div>
                        <input class="form-radio text-indigo-600" type="radio" id="male" name="cgender" value="MALE"   />
                        <label class="ml-2 text-gray-700" for="male">Male</label>
                    </div>
                    <div>
                        <input class="form-radio text-indigo-600" type="radio" id="female" name="cgender" value="FEMALE"   />
                        <label class="ml-2 text-gray-700" for="female">Female</label>
                    </div>
                    <div>
                        <input class="form-radio text-indigo-600" type="radio" id="others" name="cgender" value="OTHERS"  	 />
                        <label class="ml-2 text-gray-700" for="others">Others</label>
                    </div>
                </div>
            </div>
                    <div>
                        <label for="cdob" class="block font-medium">Date of Birth</label>
                        <input type="text" id="cdob" name="cdob" class="w-full px-4 py-2 border rounded-md" value="<%= customer.getDob() %>" required />
                    </div>
                    <div>
                        <label for="cemail" class="block font-medium">Email</label>
                        <input type="email" id="cemail" name="cemail" class="w-full px-4 py-2 border rounded-md" value="<%= customer.getEmail() %>" required />
                    </div>
                    <div>
                        <label for="clocation" class="block font-medium">Location</label>
                        <input type="text" id="clocation" name="clocation" class="w-full px-4 py-2 border rounded-md" value="<%= customer.getLocation() %>" required />
                    </div>
                    <div>
                        <label for="ccontact" class="block font-medium">Contact</label>
                        <input type="text" id="ccontact" name="ccontact" class="w-full px-4 py-2 border rounded-md" value="<%= customer.getContact() %>" required />
                    </div>
                    <div class="flex space-x-4">
                        <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded">Update</button>
                        <button type="reset" class="bg-red-500 text-white px-4 py-2 rounded">Clear</button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
