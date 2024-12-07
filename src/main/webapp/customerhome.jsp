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
    <title>Customer Dashboard</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

    <!-- Sidebar -->
    <aside class="fixed top-0 left-0 w-64 h-full bg-gray-700 text-white shadow-lg flex flex-col justify-between">
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
    </aside>

    <!-- Main Content -->
    <div class="flex-1 flex flex-col ml-64">
        <!-- Navbar -->
        <nav class="bg-white w-full z-20 top-0 left-0 border-b border-gray-200 p-4 fixed shadow">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="customerhome" class="text-2xl font-bold text-blue-700">Agro Mart</a>
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
                                <a href="savedaddresses" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-map-marker-alt mr-2"></i> Saved Addresses
                                </a>
                            </li>
                            <li class="border-t border-gray-600 hover:bg-gray-600">
                                <a href="feedbackinfo" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-comment-dots mr-2"></i> Feedback & Information
                                </a>
                            </li>
                            <li class="hover:bg-gray-600">
                                <a href="terms" class="flex items-center px-4 py-2 text-white">
                                    <i class="fas fa-file-alt mr-2"></i> Terms & Policies
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
                                <a href="customerlogout" class="flex items-center px-4 py-2 text-red-400 font-semibold">
                                    <i class="fas fa-sign-out-alt mr-2"></i> Signout
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            let currentSlide = 0;
            const slides = document.querySelectorAll("#banner-carousel > div");
            const indicators = document.querySelectorAll(".indicator");

            function showSlide(index) {
                slides.forEach((slide, i) => {
                    slide.classList.toggle("hidden", i !== index);
                });
                indicators.forEach((indicator, i) => {
                    indicator.classList.toggle("bg-gray-800", i === index);
                    indicator.classList.toggle("bg-gray-300", i !== index);
                });
            }

            document.getElementById("prev").addEventListener("click", () => {
                currentSlide = (currentSlide - 1 + slides.length) % slides.length;
                showSlide(currentSlide);
            });

            document.getElementById("next").addEventListener("click", () => {
                currentSlide = (currentSlide + 1) % slides.length;
                showSlide(currentSlide);
            });

            indicators.forEach((indicator, i) => {
                indicator.addEventListener("click", () => {
                    currentSlide = i;
                    showSlide(currentSlide);
                });
            });

            // Initial Slide Display
            showSlide(currentSlide);
        });
        
        function toggleDropdown() {
            const dropdown = document.getElementById('account-dropdown');
            dropdown.classList.toggle('hidden');
        }
    </script>
</body>
</html>
