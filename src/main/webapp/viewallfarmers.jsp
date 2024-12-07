<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Farmers - Admin Panel</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome for delete icon -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .background-img {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        body {
            min-height: 100vh;
            background-color: transparent;
            position: relative;
        }

        .main-content {
            position: relative;
            z-index: 1;
        }

        @keyframes slideIn {
            from {
                transform: translateX(-100%);
            }
            to {
                transform: translateX(0);
            }
        }

        .animate-slideIn {
            animation: slideIn 1s ease-out forwards;
        }
    </style>
</head>
<body class="bg-gray-300">

    <!-- Background Image -->
    <img src="bgimg1.jpg" alt="Background" class="background-img">

    <!-- Sidebar -->
    <aside class="fixed top-0 left-0 w-64 h-full bg-gray-800 text-white shadow-md flex flex-col justify-between">
        <div class="py-4 px-6">
            <h2 class="text-xl font-bold mb-6">Admin Menu</h2>
            <ul class="space-y-4">
                <li><a href="adminhome" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Home</a></li>
                <li><a href="addfarmer" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Add Farmers</a></li>
                <li><a href="viewallfarmers" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">View All Farmers</a></li>
                <li><a href="updatefarmerstatus" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Update Farmer Status</a></li>
                <li><a href="viewallcustomers" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">View All Customers</a></li>    
             <li><a href="allorders" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Customer Orders</a></li>
            </ul>
        </div>
    </aside>

    <!-- Main Content Area -->
    <div class="flex-1 ml-64">
        <!-- Navbar -->
        <nav class="bg-white w-full border-b p-4 fixed top-0 left-0 z-10">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="adminhome" class="text-2xl font-semibold text-blue-700">Admin Home</a>
                <ul class="flex items-center space-x-4">
                    <li><a href="adminlogout" class="text-gray-900 hover:text-blue-700">Logout</a></li>
                </ul>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="p-6 mt-16">
            <!-- Page Title Section -->
            <div class="mb-8 text-center">
                <h1 class="text-4xl font-extrabold text-blue-700 mb-4">View All Farmers</h1>
            </div>

            <!-- Total Farmers Box -->
            <div class="flex justify-center items-center mb-6">
                <div 
                    class="text-center p-6 bg-blue-100 text-blue-700 font-bold rounded-lg shadow-lg transform animate-slideIn">
                    <p class="text-xl">Total Farmers = <c:out value="${farmercount}"></c:out></p>
                </div>
            </div>

            <!-- Farmers Cards -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                <c:forEach items="${flist}" var="farmer" varStatus="status">
                    <div class="rounded-lg p-6 shadow-md"
                         style="background-color: ${status.index % 6 == 0 ? '#E0F7FA' : (status.index % 6 == 1 ? '#FFEBEE' : (status.index % 6 == 2 ? '#F1F8E9' : (status.index % 6 == 3 ? '#FFF3E0' : (status.index % 6 == 4 ? '#FFECB3' : '#F3E5F5'))))};">
                        
                        <!-- Farmer Details Section -->
                        <div class="mb-4">
                            <h3 class="text-xl font-semibold text-black mb-2">Farmer Information</h3>
                            <div class="space-y-2">
                                <div><strong class="text-gray-800">Farmer ID:</strong> <span class="text-black"><c:out value="${farmer.id}"/></span></div>
                                <div><strong class="text-gray-800">Name:</strong> <span class="text-black"><c:out value="${farmer.name}"/></span></div>
                                <div><strong class="text-gray-800">Email:</strong> <span class="text-black"><c:out value="${farmer.email}"/></span></div>
                                <div><strong class="text-gray-800">Address:</strong> <span class="text-black"><c:out value="${farmer.address}"/></span></div>
                            </div>
                        </div>

                        <!-- Farm Information Section -->
                        <div class="mb-4">
                            <h3 class="text-xl font-semibold text-black mb-2">Farm Information</h3>
                            <div class="space-y-2">
                                <div><strong class="text-gray-800">Farm Size:</strong> <span class="text-black"><c:out value="${farmer.farmsize}"/></span></div>
                                <div><strong class="text-gray-800">Type of Products:</strong> <span class="text-black"><c:out value="${farmer.productsProduced}"/></span></div>
                                <div><strong class="text-gray-800">Contact:</strong> <span class="text-black"><c:out value="${farmer.contact}"/></span></div>
                            </div>
                        </div>

                        <!-- Status Section -->
                        <div class="mb-4">
                            <h3 class="text-xl font-semibold text-black mb-2">Current Status</h3>
                            <div><strong class="text-gray-800">Status:</strong> <span class="text-black"><c:out value="${farmer.status}"/></span></div>
                        </div>

                        <!-- Delete Button -->
                        <a href='<c:url value="delete?id=${farmer.id}"></c:url>' 
                           class="mt-4 inline-block bg-red-500 text-white py-2 px-4 rounded-lg hover:bg-red-600">
                           <i class="fas fa-trash-alt mr-2"></i> Delete
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>
