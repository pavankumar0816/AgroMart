<%@page import="com.klef.jfsd.springboot.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   Customer customer = (Customer) session.getAttribute("customer");
   if(customer==null)
   {
	   response.sendRedirect("customersessionexpiry.jsp");
	   return;
   }
%>    
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Profile</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <script>
 
    function toggleDropdown() {
        const dropdown = document.getElementById('account-dropdown');
        dropdown.classList.toggle('hidden');

        function toggleDropdown(id) { // This redefines the function!
            const dropdown = document.getElementById(id);
            dropdown.classList.toggle('hidden');
        }
    }

</script>

    <style>
        /* Animation styles for card */
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
                                <a href="customerlogout.jsp" class="flex items-center px-4 py-2 text-red-400 font-semibold">
                                    <i class="fas fa-sign-out-alt mr-2"></i> Signout
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

        
          <!-- Main Content Area -->
    <div class="flex-1 flex items-center justify-center mt-8"> <!-- Reduced margin -->
        <!-- Card Container with Animation -->
        <div class="bg-blue-100 shadow-xl rounded-lg p-6 w-full max-w-md mx-auto text-center animated-card"> <!-- Reduced padding -->
            <h3 class="text-2xl font-bold text-blue-900 mb-6"><u>My Profile</u></h3>
            <div class="space-y-4 text-gray-800 text-left">
                <div class="flex justify-between">
                    <span class="font-semibold">ID:</span>
                    <span><%= customer.getId() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold">NAME:</span>
                    <span><%= customer.getName() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold">Gender:</span>
                    <span><%=customer.getGender() %></span>
                </div>
                 <div class="flex justify-between">
                    <span class="font-semibold">DOB:</span>
                    <span><%= customer.getDob() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold">Email:</span>
                    <span><%= customer.getEmail() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold">Location:</span>
                    <span><%= customer.getLocation() %></span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold">Contact:</span>
                    <span><%= customer.getContact() %></span>
                </div>
               
            </div>
        </div>
    </div>

</body>
</html>