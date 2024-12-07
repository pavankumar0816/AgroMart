<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Failed</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.0/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <div class="bg-white p-10 shadow-lg rounded-lg text-center max-w-lg">
        <!-- Error Icon -->
        <div class="flex items-center justify-center w-28 h-28 bg-red-500 rounded-full mx-auto">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-16 h-16 text-white" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm5 13.59L15.59 17 12 13.41 8.41 17 7 15.59 10.59 12 7 8.41 8.41 7 12 10.59 15.59 7 17 8.41 13.41 12 17 15.59z"/>
            </svg>
        </div>

        <!-- Error Message -->
        <h1 class="text-3xl font-bold text-gray-700 mt-6">Order Failed</h1>
        <p class="text-red-700 text-lg mt-4">
            We encountered an issue while processing your order. <br>
             
        </p>
        
        <p class="text-red-700 text-lg mt-4">
            
            Please ensure you are logged in and try again. If the problem persists, contact our support team.
        </p>

        <!-- Back to Payment Button -->
        <div class="mt-8">
            <a href="paymentpage" class="w-full block text-center bg-blue-500 text-white py-3 rounded-md hover:bg-blue-600 transition-all">
                Back to Payment
            </a>
        </div>
    </div>

</body>
</html>
