<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Privacy Policy</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #333;
            background-color: #edf2f7;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        h1 {
            color: #2c3e50;
            text-align: center;
            margin: 20px 0;
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
        h2 {
            color: #1a202c; /* Bold black */
            font-weight: bold;
        }
        p {
            color: #718096; /* Gray-400 */
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
       <h1 class="text-bold" style="color: #1a202c; font-weight: bold;">Privacy Policy</h1>
       
        <!-- SECTION 1 -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2>SECTION 1 - WHAT DO WE DO WITH YOUR INFORMATION?</h2>
            <p class="text-black" >When you purchase something from our store, as part of the buying and selling process, we collect personal information like your name, address, and email address.</p>
           <p class="text-black" >We also receive your computer's IP address to help learn about your browser and operating system.</p>
           <p class="text-black" >Email marketing: With your permission, we may send you updates about new products and store news.</p>
        </div>

        <!-- SECTION 2 -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2>SECTION 2 - CONSENT</h2>
           <p class="text-black" >When you provide personal information to complete a transaction, we imply consent for us to use it for that purpose only. If we ask for information for other reasons (like marketing), we will seek your direct consent or allow you to opt out.</p>
           <p class="text-black" >To withdraw consent,</p> <p class="text-green-900 font-bold">contact us at [<a href="contactus" class="text-red-400">AgroMart</a>] or mail us at [<a class="text-red-400">pmpk28231618@gmail.com</a>] .</p>
        </div>

        <!-- SECTION 3 -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2>SECTION 3 - DISCLOSURE</h2>
           <p class="text-black" >We may disclose your personal information if required by law or if you violate our Terms of Service.</p>
        </div>

        <!-- SECTION 4 -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2>SECTION 4 - PAYMENT</h2>
            <p class="text-black" >We use Razorpay for payment processing. Your card data is encrypted and not stored on their servers. Payment transaction data is only used to complete your purchase.</p>
           <p class="text-black" >Razorpay adheres to PCI-DSS standards for secure credit card handling. For more, read Razorpay's <a href="https://razorpay.com" target="_blank" class="text-blue-500 font-bold">terms and conditions</a>.</p>
        </div>

        <!-- SECTION 5 -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2>SECTION 5 - THIRD-PARTY SERVICES</h2>
           <p class="text-black" >Third-party service providers (e.g., payment gateways) handle your information only to the extent necessary to perform their services. We recommend reading their privacy policies for details on how they manage your data.</p>
            <p class="text-black" >Links to external sites are not governed by this Privacy Policy, so we encourage you to review their policies.</p>
        </div>

        <!-- SECTION 6 -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2>SECTION 6 - SECURITY</h2>
            <p class="text-black" >We take reasonable precautions to protect your personal information from loss, misuse, unauthorized access, disclosure, alteration, or destruction.</p>
        </div>

        <!-- SECTION 7 -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2>SECTION 7 - COOKIES</h2>
           <p class="text-black" >We use cookies to maintain your session. These cookies are not used to identify you on other sites.</p>
        </div>

        <!-- SECTION 8 -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2>SECTION 8 - AGE OF CONSENT</h2>
           <p class="text-black" >By using this site, you confirm that you are at least of legal age in your state or province, or have obtained parental consent to use the site.</p>
        </div>

        <!-- SECTION 9 -->
        <div class="bg-white p-6 rounded-lg shadow-md mb-6">
            <h2>SECTION 9 - CHANGES TO THIS PRIVACY POLICY</h2>
           <p class="text-black" >We may update this Privacy Policy at any time. Changes will take effect immediately upon posting. If we make significant changes, we will notify you here.</p>
        </div>
    </main>
</body>
</html>
