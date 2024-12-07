<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
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
    <title>Wishlist</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

    <div class="container mx-auto py-8">
        <h3 class="text-2xl font-semibold text-center mb-6 underline">My Wishlist</h3>

        <!-- Display wishlist items -->
        <c:if test="${not empty wishlistItems}">
            <div class="grid gap-6 lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1">
                <c:forEach items="${wishlistItems}" var="product">
                    <div class="card bg-white rounded-lg shadow-md overflow-hidden p-4">
                        <div class="w-full h-48 bg-gray-200 rounded-t-lg overflow-hidden">
                            <img src="displayproductimage?id=${product.id}" alt="${product.name}" class="w-full h-full object-cover object-center">
                        </div>
                        <div class="p-4 text-center">
                            <h4 class="text-lg font-semibold mb-2 text-gray-800">${product.name}</h4>
                            <p class="text-green-600 font-bold text-xl mb-2">&#8377;${product.cost}</p>
                            <p class="text-gray-600 mb-4">${product.description}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${empty wishlistItems}">
            <p class="text-center">Your wishlist is empty.</p>
        </c:if>
    </div>

</body>
</html>
