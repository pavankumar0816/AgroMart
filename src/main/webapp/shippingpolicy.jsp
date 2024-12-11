<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shipping Policy | AgroMart</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <script>
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
                        <li class="border-t border-gray-600 hover:bg-gray-600"><a href="shippingpolicy" class="flex items-center px-4 py-2 text-white"><i class="fas fa-shipping-fast mr-2"></i> Shipping Policy</a></li>
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
    <div class="container mx-auto mt-12 pt-16 p-4">
        <h1 class="text-3xl font-bold text-gray-800 mb-4">Shipping Policy</h1>

        <p class="mb-4">Orders are processed within 1 to 3 business days (excluding weekends and holidays) after receiving your order confirmation email. You will receive another notification when your order has shipped.</p>
        <p class="mb-4">Any potential delays due to high volume or postal service issues will be communicated.</p>

        <h2 class="text-2xl font-semibold text-gray-700 mt-6">Domestic Shipping Rates and Estimates</h2>
        <p class="mb-4">Shipping charges for your order will be calculated and displayed at checkout.</p>
        <p class="mb-4">Flat rate shipping: $5 for orders within [list countries].</p>
        <p class="mb-4">Free shipping for orders over $50.</p>

        <table class="min-w-full bg-white shadow-md rounded-lg">
            <thead>
                <tr>
                    <th class="border-b py-2 px-4 text-left text-gray-700">Shipping Option</th>
                    <th class="border-b py-2 px-4 text-left text-gray-700">Estimated Delivery Time</th>
                    <th class="border-b py-2 px-4 text-left text-gray-700">Price</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="border-b py-2 px-4">Standard</td>
                    <td class="border-b py-2 px-4">3 to 5 business days</td>
                    <td class="border-b py-2 px-4">$5</td>
                </tr>
                <tr>
                    <td class="border-b py-2 px-4">Expedited</td>
                    <td class="border-b py-2 px-4">2 to 3 business days</td>
                    <td class="border-b py-2 px-4">$10</td>
                </tr>
                <tr>
                    <td class="border-b py-2 px-4">Overnight</td>
                    <td class="border-b py-2 px-4">1 to 2 business days</td>
                    <td class="border-b py-2 px-4">$20</td>
                </tr>
            </tbody>
        </table>

        <h2 class="text-2xl font-semibold text-gray-700 mt-6">Local Delivery</h2>
        <p class="mb-4">Free local delivery for orders over $30 within [area of coverage]. $5 for orders under $30.</p>
        <p class="mb-4">Deliveries are made on weekdays from 9 AM to 5 PM. We will contact you via text message to confirm delivery.</p>

        <h2 class="text-2xl font-semibold text-gray-700 mt-6">In-store Pickup</h2>
        <p class="mb-4">Free in-store pickup at [store location]. Orders ready within 1 to 3 business days.</p>
        <p class="mb-4">Pickup available from [store hours]. Bring your order confirmation email when you come.</p>

        <h2 class="text-2xl font-semibold text-gray-700 mt-6">International Shipping</h2>
        <p class="mb-4">We offer international shipping to select countries: [list of countries].</p>
        <p class="mb-4">We do not ship to [list of countries].</p>

        <table class="min-w-full bg-white shadow-md rounded-lg">
            <thead>
                <tr>
                    <th class="border-b py-2 px-4 text-left text-gray-700">Shipping Option</th>
                    <th class="border-b py-2 px-4 text-left text-gray-700">Estimated Delivery Time</th>
                    <th class="border-b py-2 px-4 text-left text-gray-700">Price</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="border-b py-2 px-4">Standard International</td>
                    <td class="border-b py-2 px-4">7 to 14 business days</td>
                    <td class="border-b py-2 px-4">$20</td>
                </tr>
                <tr>
                    <td class="border-b py-2 px-4">Expedited International</td>
                    <td class="border-b py-2 px-4">3 to 7 business days</td>
                    <td class="border-b py-2 px-4">$40</td>
                </tr>
                <tr>
                    <td class="border-b py-2 px-4">Priority International</td>
                    <td class="border-b py-2 px-4">1 to 3 business days</td>
                    <td class="border-b py-2 px-4">$60</td>
                </tr>
            </tbody>
        </table>

        <p class="mt-6">Please note that your order may be subject to import duties and taxes (including VAT) upon arrival, which are your responsibility.</p>
    </div>
</body>
</html>
