<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms of Service</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #333;
            background-color: #edf2f7; /* Light grey-blue background for attractiveness */
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        h1 {
            color: #2c3e50; /* Dark slate color for header */
            text-align: center;
            margin: 20px 0;
            font-weight: bold;
        }
        h2 {
            color: #2c3e50; /* Dark slate color for sub-headers */
            font-weight: bold;
        }
        section {
            margin-bottom: 20px;
            padding: 0 20px;
        }
        footer {
            text-align: center;
            font-size: 0.9em;
            color: #777;
            background-color: #2c3e50;
            color: #fff;
            padding: 10px 0;
            margin-top: auto;
        }
        nav {
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
    <script>
        // JavaScript to toggle the dropdown
        function toggleDropdown() {
            const dropdown = document.getElementById('account-dropdown');
            dropdown.classList.toggle('hidden');
        }
    </script>
</head>
<body>
    <!-- Navbar -->
    <nav class="bg-white w-full z-20 top-0 left-0 border-b border-gray-200 p-4 fixed shadow">
        <div class="max-w-screen-xl mx-auto font-bold flex items-center justify-between">
            <a href="index.jsp" class="text-2xl font-bold text-green-700">AgroMart</a>
            <ul class="flex items-center space-x-4">
                <li>
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

    <!-- Main Content -->
    <main class="flex-grow pt-20">
        <h1>Terms of Service</h1>
        
        <!-- Introduction Section -->
        <section class="bg-white p-6 rounded-lg shadow-lg">
            <h2>Introduction</h2>
            <p>Welcome to our website. By accessing or using our services, you agree to comply with these Terms of Service.</p>
            <p>This website is operated by <strong>[P. Manikanta Pavan Kumar]</strong>. Throughout the site, the terms “I”, “me”, and “my” refer to <strong>[P. Manikanta Pavan Kumar]</strong>. I offer this website, including all information, tools, and services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies, and notices stated here.</p>
        </section>
        
        <!-- Use of Services Section -->
        <section class="bg-white p-6 rounded-lg shadow-lg">
            <h2>Use of Services</h2>
            <p>You are responsible for your activities on our platform and must use our services in compliance with applicable laws and regulations.</p>
        </section>
        
        <!-- Content and Ownership Section -->
        <section class="bg-white p-6 rounded-lg shadow-lg">
            <h2>Content and Ownership</h2>
            <p>All content provided on this site is owned by us or our licensors. You may not copy, modify, or distribute any materials without prior consent.</p>
        </section>
        
        <!-- Privacy Section -->
        <section class="bg-white p-6 rounded-lg shadow-lg">
            <h2>Privacy</h2>
            <p>Your privacy is important to us. Please review our Privacy Policy to understand how we handle your information.</p>
        </section>
        
        <!-- Termination Section -->
        <section class="bg-white p-6 rounded-lg shadow-lg">
            <h2>Termination</h2>
            <p>We reserve the right to suspend or terminate your access to our services if you violate these terms.</p>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        &copy; 2024 [PMPK] &nbsp;&nbsp; All rights reserved.
    </footer>
</body>
</html>
