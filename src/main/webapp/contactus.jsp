<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        function toggleDropdown() {
            const dropdown = document.getElementById('account-dropdown');
            dropdown.classList.toggle('hidden');
        }

        function validateMobile() {
            const mobileInput = document.getElementById('mobile');
            const errorMessage = document.getElementById('mobile-error');
        
            // Check if the mobile number length is exactly 10 and it is a number
            if (mobileInput.value.length !== 10 || isNaN(mobileInput.value)) {
                errorMessage.classList.remove('hidden');
                mobileInput.classList.add('border-red-500');
                return false; // Mobile number is invalid
            } else {
                errorMessage.classList.add('hidden');
                mobileInput.classList.remove('border-red-500');
                return true; // Mobile number is valid
            }
        }

        function validateForm() {
            // Validate the mobile number
            if (validateMobile()) {
                return true; // Proceed with form submission
            } else {
                return false; // Prevent form submission if validation fails
            }
        }
    </script>
</head>
<body class="bg-blue-50">
<div class="flex-1 flex flex-col ml-64 pt-16">
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
                <li class="relative">
                    <button onclick="toggleDropdown()" class="flex items-center text-gray-700 hover:text-blue-700 bg-red-100 hover:bg-blue-200 px-4 py-2 rounded-lg transition-all focus:outline-none">
                        <i class="fas fa-user mr-2"></i> Account
                        <i class="fas fa-chevron-down ml-2"></i>
                    </button>
                    <ul class="hidden flex-col bg-gray-700 mt-2 rounded-md shadow-lg absolute top-full right-0 w-48 z-30" id="account-dropdown">
    <li class="hover:bg-gray-600"><a href="customerprofile" class="flex items-center px-4 py-2 text-white"><i class="fas fa-id-card mr-2"></i> Profile</a></li>
    <li class="hover:bg-gray-600"><a href="updatecustomer" class="flex items-center px-4 py-2 text-white"><i class="fas fa-edit mr-2"></i> Edit Profile</a></li>
    <li class="hover:bg-gray-600"><a href="term" class="flex items-center px-4 py-2 text-white"><i class="fas fa-file-alt mr-2"></i> Terms & Conditions</a></li>
    <li class="hover:bg-gray-600"><a href="privacy" class="flex items-center px-4 py-2 text-white"><i class="fas fa-lock mr-2"></i> Privacy Policy</a></li>
    <li class="hover:bg-gray-600"><a href="refund" class="flex items-center px-4 py-2 text-white"><i class="fas fa-undo-alt mr-2"></i> Refunds & Cancellation</a></li>
    <li class="border-t border-gray-600 hover:bg-gray-600"><a href="shippingpolicy" class="flex items-center px-4 py-2 text-white	"><i class="fas fa-shipping-fast mr-2"></i> Shipping Policy</a></li>
    <li class="hover:bg-gray-600"><a href="contactus" class="flex items-center px-4 py-2 text-white"><i class="fas fa-envelope mr-2"></i> Contact Us</a></li>
    <li class="hover:bg-gray-600"><a href="myorders" class="flex items-center px-4 py-2 text-white"><i class="fas fa-shopping-bag mr-2"></i> My Orders</a></li>
    <li class="hover:bg-gray-600"><a href="mycart" class="flex items-center px-4 py-2 text-white"><i class="fas fa-shopping-cart mr-2"></i> Cart</a></li>
    <li class="border-t border-gray-600 hover:bg-gray-600"><a href="customerlogout" class="flex items-center px-4 py-2 text-red-400 font-semibold"><i class="fas fa-sign-out-alt mr-2"></i> Sign Out</a></li>
</ul>
                </li>
            </ul>
        </div>
    </nav>

    <div class="bg-white shadow-lg rounded-lg p-8 max-w-lg w-full mt-16">
        <h1 class="text-2xl font-bold text-gray-800 mb-4">Contact Us</h1>
        <p class="text-gray-600 mb-6">We’d love to hear from you! Reach out to us using the details below, or fill out the contact form for assistance.</p>
        
        <!-- Contact Information -->
        <div class="space-y-4">
            <div class="flex items-center space-x-4">
                <span class="bg-blue-500 text-white rounded-full p-3">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a5 5 0 005.11 0L21 8m-9 8l7.89-5.26M3 16l7.89 5.26a5 5 0 005.11 0L21 16M3 8l7.89-5.26a5 5 0 015.11 0L21 8"></path>
                    </svg>
                </span>
                <span class="text-gray-800">+91-XXXXXXXXXX</span>
            </div>
            <div class="flex items-center space-x-4">
                <span class="bg-green-500 text-white rounded-full p-3">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12c0 4.418-3.582 8-8 8s-8-3.582-8-8m16-6v12m-4-8H4m12 4h-8m0-4h6"></path>
                    </svg>
                </span>
                <span class="text-gray-800">support@agromart.com</span>
            </div>
            <div class="flex items-center space-x-4">
                <span class="bg-yellow-500 text-white rounded-full p-3">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v8m-4-4h8"></path>
                    </svg>
                </span>
                <span class="text-gray-800">Vijayawada, Andhra Pradesh, India</span>
            </div>
        </div>
        
        <!-- Contact Form -->
        <form method="post" action="sendemail" onsubmit="return validateForm()">
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                <input type="text" id="name" name="name"   required class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" id="email" name="email" required class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
            </div>
            <div>
                <label for="mobile" class="block text-sm font-medium text-gray-700">Mobile</label>
                <input type="text" id="mobile" name="mobile" required oninput="validateMobile()" class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                <p id="mobile-error" class="text-red-500 text-sm hidden">Mobile number must be exactly 10 digits.</p>
            </div>
            <div>
                <label for="subject" class="block text-sm font-medium text-gray-700">Subject</label>
                <textarea id="subject" name="subject" required rows="1" class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"></textarea>
            </div>
            <div>
                <label for="message" class="block text-sm font-medium text-gray-700">Message</label>
                <textarea id="message" name="message" required rows="4" class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500"></textarea>
            </div>
            <div>
                <button type="submit" class="w-full bg-blue-600 text-white py-2 px-4 rounded-md mt-4 hover:bg-blue-700">Submit</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
