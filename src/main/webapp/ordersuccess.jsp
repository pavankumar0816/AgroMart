<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.0/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <div class="bg-white p-12 shadow-2xl rounded-lg text-center max-w-2xl">
        <!-- Success Icon -->
        <div class="flex items-center justify-center w-32 h-32 bg-green-500 rounded-full mx-auto">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-20 h-20 text-white" fill="currentColor" viewBox="0 0 24 24">
                <path d="M9 16.2l-4.2-4.2-1.4 1.4 5.6 5.6 12-12-1.4-1.4z"></path>
            </svg>
        </div>
        
        <!-- Success Message -->
        <h1 class="text-4xl font-bold text-gray-700 mt-8">Product Ordered Successfully</h1>
        
        <!-- Delivery Message -->
        <p class="text-2xl font-bold text-red-700 mt-8">
            Product will be delivered within 5 days.
        </p>
        
        <!-- Contact Info -->
        <p class="mt-6 text-blue-700 font-medium">
            If you have any issues, contact us at <span class="underline">support@example.com</span>.
        </p>

        <!-- Buttons -->
        <div class="mt-10">
            <a href="myorders" class="w-full block text-center bg-blue-500 text-white py-4 rounded-md hover:bg-blue-600 transition-all">
             Go to My Orders To Track Your Status
            </a>
        </div>
    </div>

</body>
</html>
