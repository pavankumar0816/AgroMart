<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@3.0.18/dist/tailwind.min.css">
</head>
<body class="bg-gray-100 flex justify-center items-center h-screen">
    <div class="w-full max-w-md bg-white p-8 rounded-lg shadow-xl border border-gray-200">
        <h1 class="text-3xl font-bold text-green-600 mb-4 text-center">Payment Successful</h1>
        <p class="text-gray-700 text-lg mb-2 text-center">
            Thank you! Your payment has been processed successfully.
        </p>
        <p class="text-gray-700 text-lg font-semibold mb-4 text-center">
            Order Status: <span class="text-green-600">Confirmed</span>
        </p>
        <p class="text-gray-500 mb-6 text-center">
            You will receive a confirmation email shortly.
        </p>
        <div class="flex justify-center mt-6">
            <form action="orders.jsp">
                <button type="submit" class="bg-blue-500 text-white px-6 py-2 rounded-lg hover:bg-blue-600">
                    Go to Orders Page
                </button>
            </form>
        </div>
    </div>
</body>
</html>
