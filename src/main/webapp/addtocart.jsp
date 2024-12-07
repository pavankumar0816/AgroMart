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
    <title>Cart Page</title>
    
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="bg-gray-100">

    <div class="container mx-auto py-8">
        
        <!-- Display Success/Failure Message -->
        <div class="mb-4">
            <c:if test="${not empty session.SuccMsg}">
                <div class="bg-green-500 text-white p-4 rounded-lg">
                    <c:out value="${session.SuccMsg}" />
                </div>
            </c:if>
            <c:if test="${not empty session.errorMsg}">
                <div class="bg-red-500 text-white p-4 rounded-lg">
                    <c:out value="${session.errorMsg}" />
                </div>
            </c:if>
        </div>

        <div class="flex bg-white rounded-lg shadow-md overflow-hidden">
            
            <!-- Left Box: Product Details -->
            <div class="w-1/2 p-8">
                <h3 class="text-3xl font-bold text-gray-800 mb-4"><c:out value="${product.name}" /></h3>
                
                <p class="text-lg text-gray-600 mb-2"><strong>Product Details:</strong></p>
                <p class="text-gray-700 mb-4"><c:out value="${product.description}" /></p>

                <p class="text-lg text-gray-600 mb-2"><strong>Status:</strong></p>
                <button class="bg-green-500 text-white px-4 py-2 rounded-lg shadow-md">Available</button>

                <p class="text-lg text-gray-600 mt-4"><strong>Category:</strong> <c:out value="${product.category}" /></p>
                <p class="text-lg text-gray-600 mt-2"><strong>Cost:</strong> &#8377;<c:out value="${product.cost}" /></p>

                <!-- Buttons: Add to Cart & Buy -->
                <div class="flex space-x-4 mt-6">
                    <a href="addtocart?pid=${product.id}&customerid=${customer.id}" 
                       class="px-6 py-2 bg-blue-500 text-white rounded-lg shadow hover:bg-blue-600 transition">
                        Add to Cart
                    </a>
                    <a href="buynow?pid=${product.id}" 
                       class="px-6 py-2 bg-green-500 text-white rounded-lg shadow hover:bg-green-600 transition">
                        Buy Now
                    </a>
                </div>
            </div>

            <!-- Right Box: Product Image -->
            <div class="w-1/2 h-80 bg-gray-200">
                <img src="displayfarmerproductimage?id=${product.id}" 
                     alt="${product.name}" 
                     class="w-full h-full object-cover rounded-lg">
            </div>
        </div>
    </div>

</body>
</html>