<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Product</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">

    <!-- Heading -->
    <div class="text-center py-8">
        <h3 class="text-3xl font-semibold text-gray-800 underline">Product Details</h3>
    </div>

    <!-- Card -->
    <div class="max-w-sm mx-auto bg-white p-6 rounded-lg shadow-lg">
        <!-- Display Product Image -->
        <img src="displayproductimage?id=${product.id}" alt="${product.name} Image" class="w-1/2 mx-auto rounded-lg mb-6"/>

        <!-- Display Product Details -->
        <h1 class="text-xl font-bold text-gray-800 mb-2">${product.category}</h1>
        <h2 class="text-2xl font-semibold text-gray-700 mb-4">${product.name}</h2>
        <p class="text-lg text-gray-600 mb-2">Cost: ${product.cost}</p>
        <p class="text-base text-gray-600 mb-4">${product.description}</p>
        <p>
            <a href="${product.url}" target="_new" class="text-green-500 font-semibold hover:underline">Click Here</a>
        </p>
    </div>

</body>
</html>
