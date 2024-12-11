<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
    <title>View Product Details</title>
    
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            background: linear-gradient(to bottom right, #f8fafc, #dbeafe);
        }
        .action-btn {
            transition: transform 0.2s, background-color 0.3s;
        }
        .action-btn:hover {
            transform: scale(1.05);
            background-color: #3b82f6; /* Slightly darker blue on hover */
        }
    </style>
</head>
<body class="bg-gray-100">

    <div class="container mx-auto py-8">
        <!-- Back to Products Button -->
        <div class="mb-6">
            <a href="${pageContext.request.contextPath}/viewallfarmerproducts" 
               class="action-btn bg-blue-500 text-white px-6 py-2 rounded-lg shadow hover:bg-blue-600 transition inline-flex items-center">
                <i class="fas fa-arrow-left mr-2"></i> Back to Products
            </a>
        </div>

        <div class="flex bg-white rounded-lg shadow-md overflow-hidden">
            
            <!-- Left Box: Product Details -->
            <div class="w-1/2 p-8">
                <h3 class="text-3xl font-bold text-gray-800 mb-4">
                    <c:out value="${product.name}" />
                </h3>
                
                <p class="text-lg text-gray-600 mb-2"><strong>Product Details:</strong></p>
                <p class="text-gray-700 mb-4">
                    <c:out value="${product.description}" />
                </p>

                <p class="text-lg text-gray-600 mb-2"><strong>Status:</strong></p>
                <button class="bg-green-500 text-white px-4 py-2 rounded-lg shadow-md">Available</button>

                <p class="text-lg text-gray-600 mt-4">
                    <strong>Category:</strong> 
                    <c:out value="${product.category}" />
                </p>
                <p class="text-lg text-gray-600 mt-2">
                    <strong>Cost:</strong> &#8377;
                    <c:out value="${product.cost}" />
                </p>

                <!-- Buttons: Add to Cart & Buy -->
                <div class="flex space-x-4 mt-6">
                    <a href="${pageContext.request.contextPath}/addtocart?pid=${product.id}&customerid=${customer.id}" 
                       class="px-6 py-2 bg-blue-500 text-white rounded-lg shadow hover:bg-blue-600 transition">
                        Add to Cart
                    </a>
                </div>
            </div>

            <!-- Right Box: Product Image -->
            <div class="w-1/2 h-80 bg-gray-200">
                <img src="${pageContext.request.contextPath}/displayfarmerproductimage?id=${product.id}" 
                     alt="${product.name}" 
                     class="w-full h-full object-cover rounded-lg">
            </div>
        </div>
    </div>

</body>
</html>
