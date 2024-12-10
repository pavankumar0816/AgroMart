<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Privacy Policy</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
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

    <!-- Privacy Policy Content -->
    <div class="mt-20 px-6 max-w-6xl mx-auto">
        <div class="bg-white p-6 rounded-lg shadow-lg mb-6">
            <h1 class="text-4xl font-bold text-gray-800 mb-6 border-b-2 pb-2">Privacy Policy</h1>
            <p class="mb-4 text-lg">At <span class="font-bold text-green-600">AgroMart</span>, your privacy is paramount. This Privacy Policy explains how we collect, use, and safeguard your information.</p>
        </div>

        <div class="flex space-x-6">
            <div class="w-1/2 bg-white p-6 rounded-lg shadow-lg mb-6">
                <h2 class="text-2xl font-semibold mt-6 text-gray-700">1. How We Collect Data</h2>
                <p class="mt-2 text-gray-600">We collect information through:</p>
                <ul class="list-disc pl-8 mt-2 text-gray-600">
                    <li>Forms on our platform (e.g., registration, checkout).</li>
                    <li>Cookies to improve your browsing experience.</li>
                    <li>Analytics tools for user insights.</li>
                </ul>
            </div>

            <div class="w-1/2 bg-white p-6 rounded-lg shadow-lg mb-6">
                <h2 class="text-2xl font-semibold mt-6 text-gray-700">2. Why We Collect Data</h2>
                <p class="mt-2 text-gray-600">Your data helps us:</p>
                <ul class="list-disc pl-8 mt-2 text-gray-600">
                    <li>Deliver seamless order processing.</li>
                    <li>Improve website features and user interaction.</li>
                    <li>Send promotional updates (with your consent).</li>
                </ul>
            </div>
        </div>

        <div class="flex space-x-6">
            <div class="w-1/2 bg-white p-6 rounded-lg shadow-lg mb-6">
                <h2 class="text-2xl font-semibold mt-6 text-gray-700">3. How We Store & Protect Your Data</h2>
                <p class="mt-2 text-gray-600">We use the latest security measures, including:</p>
                <ul class="list-disc pl-8 mt-2 text-gray-600">
                    <li>Data encryption during transactions.</li>
                    <li>Secure servers with restricted access.</li>
                    <li>Regular audits to identify vulnerabilities.</li>
                </ul>
            </div>

            <div class="w-1/2 bg-white p-6 rounded-lg shadow-lg mb-6">
                <h2 class="text-2xl font-semibold mt-6 text-gray-700">4. Data-Sharing Practices</h2>
                <p class="mt-2 text-gray-600">We value your trust and do not sell your data. Data sharing is limited to:</p>
                <ul class="list-disc pl-8 mt-2 text-gray-600">
                    <li>Legal requirements and compliance.</li>
                    <li>Trusted service providers (e.g., payment processing).</li>
                </ul>
            </div>
        </div>

        <div class="bg-white p-6 rounded-lg shadow-lg mb-6">
            <h2 class="text-2xl font-semibold mt-6 text-gray-700">5. Your Rights</h2>
            <p class="mt-2 text-gray-600">You have full control over your data. You can:</p>
            <ul class="list-disc pl-8 mt-2 text-gray-600">
                <li>Access your data anytime.</li>
                <li>Request corrections to your information.</li>
                <li>Request data deletion (in accordance with applicable laws).</li>
            </ul>
        </div>

        <div class="bg-white p-6 rounded-lg shadow-lg mb-6">
            <p class="mt-6 text-xl text-sm text-red-500 font-bold">For any queries or concerns, contact us at: 
                <a href="mailto:support@agromart.com" class="text-blue-600 font-semibold underline">support@agromart.com</a>.
            </p>
        </div>
    </div>
</body>
</html>
