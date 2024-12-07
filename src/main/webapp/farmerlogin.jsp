<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farmer Login</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Framer Motion -->
    <script src="https://unpkg.com/framer-motion@6/dist/framer-motion.umd.js"></script>
</head>
<body class="bg-blue-400  font-sans min-h-screen flex flex-col">
   
  <%@ include file="mainnavbar.jsp" %>
 
   <div class="flex-grow flex items-start justify-center mt-16">  
    <div id="login-card" class="w-full max-w-sm bg-white rounded-lg shadow-lg p-6 space-y-4 transform transition-all duration-500">
        <h3 class="text-center text-xl font-semibold text-gray-700 underline">Farmer Login</h3>

        <% 
            // Fetch the status and login message from the model
            String statusMessage = (String) request.getAttribute("statusMessage");
            String loginMessage = (String) request.getAttribute("loginMessage");
            
            if (statusMessage != null) { 
        %>
            <div class="bg-yellow-200 border-l-4 border-yellow-500 text-yellow-700 p-4 mb-4 rounded-md" role="alert">
                <p><%= statusMessage %></p>
            </div>
        <% 
            } 
            if (loginMessage != null) { 
        %>
            <div class="bg-red-200 border-l-4 border-red-500 text-red-700 p-4 mb-4 rounded-md" role="alert">
                <p><%= loginMessage %></p>
            </div>
        <% } %>
        
        <form method="post" action="checkfarmerlogin" class="space-y-4">
            <div>
                <label for="femail" class="block text-gray-600">Enter Username</label>
                <input type="text" id="femail" name="femail" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" required />
            </div>
            <div>
                <label for="fpassword" class="block text-gray-600">Enter Password</label>
                <input type="password" id="fpassword" name="fpassword" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400" required />
            </div>
            <div class="flex justify-between items-center">
                <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded-md focus:outline-none">Login</button>
                <input type="reset" value="Clear" class="bg-gray-300 hover:bg-gray-400 text-gray-700 py-2 px-4 rounded-md focus:outline-none" />
            </div>
        </form>
    </div>
   </div>

   

</body>
</html>
