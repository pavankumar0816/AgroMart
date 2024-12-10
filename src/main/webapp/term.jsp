<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms and Conditions</title>
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script>
        function toggleDropdown() {
            const dropdown = document.getElementById('account-dropdown');
            dropdown.classList.toggle('hidden');
        }
    </script>
</head>
<body class="bg-blue-50">
<div class="flex-1 flex flex-col ml-64">
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
                                <a href="term" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-question-circle mr-2"></i> Terms & Conditions
                                </a>
                            </li>
                            <li class="hover:bg-gray-600">
                                <a href="privacy" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-question-circle mr-2"></i> Privacy Policy
                                </a>
                            </li>
                            <li class="hover:bg-gray-600">
                                <a href="refund" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-question-circle mr-2"></i> Refunds and Cancellation
                                </a>
                            </li>
                            <li class="hover:bg-gray-600">
                                <a href="contactus" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-question-circle mr-2"></i> Contact US
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
                                <a href="customerlogout" class="flex items-center px-4 py-2 text-red-400 font-semibold">
                                    <i class="fas fa-sign-out-alt mr-2"></i> Signout
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

    <!-- Main Content -->
    <div class="pt-20 px-4 sm:px-8 lg:px-16 max-w-screen-lg mx-auto">
        <!-- Individual Sections in Boxes -->
        <div class="bg-white shadow-lg rounded-lg p-6 mb-6">
            <h1 class="text-2xl font-bold text-black mb-4">Terms and Conditions</h1>
            <p class="text-gray-600 mb-4">
                Welcome to AgroMart! Please read these terms and conditions carefully before using our services.
            </p>
        </div>

        <div class="bg-white shadow-lg rounded-lg p-6 mb-6">
            <h2 class="text-lg font-semibold text-gray-700">1. Scope of Service</h2>
            <p class="text-gray-600">We provide an online platform connecting farmers and buyers for agricultural products and services.</p>
        </div>

        <div class="bg-white shadow-lg rounded-lg p-6 mb-6">
            <h2 class="text-lg font-semibold text-gray-700">2. User Guidelines</h2>
            <ul class="list-disc list-inside text-gray-600 space-y-2">
                <li>Use our platform for lawful purposes only.</li>
                <li>Avoid uploading harmful or inappropriate content.</li>
                <li>We may suspend accounts violating our policies.</li>
            </ul>
        </div>

        <div class="bg-white shadow-lg rounded-lg p-6 mb-6">
            <h2 class="text-lg font-semibold text-gray-700">3. Liability Limitations</h2>
            <p class="text-gray-600">We are not responsible for damages arising from using our platform. Transactions are at your own risk.</p>
        </div>

        <div class="bg-white shadow-lg rounded-lg p-6 mb-6">
            <h2 class="text-lg font-semibold text-gray-700">4. Governing Law</h2>
            <p class="text-gray-600">These terms are governed by Indian law, and disputes are resolved in the courts of your city.</p>
        </div>

        <p class="mt-6 text-xl text-sm text-red-500 font-bold">For any questions, visit our <a href="contactus.jsp" class="text-blue-500 underline">Contact Us</a> page.</p>
    </div>
</body>
</html>
