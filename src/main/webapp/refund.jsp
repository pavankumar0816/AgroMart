<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Refunds and Cancellation Policy</title>
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

    <!-- Content -->
    <div class="container mx-auto p-6 pt-32">
        <h1 class="text-3xl font-bold mb-4">Refunds and Cancellation Policy</h1>
        <p class="mb-4">At AgroMart, we value customer satisfaction. Our Refunds and Cancellation Policy is designed to provide clarity and support for our customers.</p>

        <!-- Refund and Cancellation Boxes -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
            <div class="bg-white p-6 rounded-lg shadow-lg border border-gray-200">
                <h2 class="text-xl font-semibold mt-4">1. Conditions for Refunds</h2>
                <ul class="list-disc pl-6 space-y-2">
                    <li>The product delivered is defective or damaged upon receipt.</li>
                    <li>An incorrect product was delivered.</li>
                    <li>Cancellation is requested before the product is shipped.</li>
                </ul>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-lg border border-gray-200">
                <h2 class="text-xl font-semibold mt-4">2. Refund Processing Timeline</h2>
                <p class="mb-4">Once a refund is approved, it will be processed within 5-7 working days. You will be notified via email regarding the status of your refund.</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-lg border border-gray-200">
                <h2 class="text-xl font-semibold mt-4">3. Refund Methods</h2>
                <p class="mb-4">Refunds will be issued using the original payment method or, if requested, as store credits that can be used for future purchases.</p>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-lg border border-gray-200">
                <h2 class="text-xl font-semibold mt-4">4. Conditions for Cancellation</h2>
                <ul class="list-disc pl-6 space-y-2">
                    <li>Orders can be canceled within 24 hours of placement.</li>
                    <li>Orders cannot be canceled once the product has been shipped.</li>
                </ul>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-lg border border-gray-200">
                <h2 class="text-xl font-semibold mt-4">5. How to Request a Refund or Cancellation</h2>
                <p class="mb-4">To request a refund or cancellation, please contact our support team at <a href="mailto:support@agromart.com" class="text-blue-500 underline">support@agromart.com</a> or call us at +91-XXXXXXXXXX. Ensure you provide your order ID and details of the issue.</p>
            </div>
        </div>

        <p class="mt-6">For any further queries, feel free to visit our <a href="contactus.jsp" class="text-blue-500 underline">Contact Us</a> page.</p>
    </div>
</div>
</body>
</html>
