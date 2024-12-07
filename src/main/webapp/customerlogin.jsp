<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration & Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-blue-400 font-sans min-h-screen">

    <%@ include file="mainnavbar.jsp" %> <!-- Navbar Include -->

    <div class="container mx-auto mt-12">
        <div class="w-full max-w-lg p-8 bg-white rounded-lg shadow-xl mx-auto">
            <!-- Tabs for Switching -->
            <div class="tabs flex justify-center space-x-4 mb-8">
                <button id="registerTab" 
                        class="w-1/2 py-3 text-lg font-semibold text-gray-700 focus:outline-none bg-blue-100 hover:bg-blue-200 active:bg-blue-300 rounded-tl-lg">
                    Registration
                </button>
                <button id="loginTab" 
                        class="w-1/2 py-3 text-lg font-semibold text-gray-700 focus:outline-none bg-blue-100 hover:bg-blue-200 active:bg-blue-300 rounded-tr-lg">
                    Login
                </button>
            </div>

            <!-- Registration Form -->
            <div id="registerBox" class="tab-content mt-4">
                <h3 class="text-center text-2xl font-semibold text-gray-800 mb-6">Customer Registration</h3>
                <form method="post" action="insertcustomer" onsubmit="return validatePassword()">
                    <div class="mb-4">
                        <label for="cname" class="block text-sm font-medium text-gray-700">Full Name</label>
                        <input type="text" id="cname" name="cname" 
                               class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500" required />
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700">Gender</label>
                        <div class="flex space-x-4 mt-2">
                            <label>
                                <input type="radio" id="male" name="cgender" value="MALE" class="mr-2" required /> Male
                            </label>
                            <label>
                                <input type="radio" id="female" name="cgender" value="FEMALE" class="mr-2" required /> Female
                            </label>
                            <label>
                                <input type="radio" id="others" name="cgender" value="OTHERS" class="mr-2" required /> Others
                            </label>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label for="cdob" class="block text-sm font-medium text-gray-700">Date of Birth</label>
                        <input type="date" id="cdob" name="cdob" 
                               class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500" required />
                    </div>
                    <div class="mb-4">
                        <label for="cemail" class="block text-sm font-medium text-gray-700">Email Address</label>
                        <input type="email" id="cemail" name="cemail" 
                               class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500" required />
                    </div>
                    <div class="mb-4">
                        <label for="cpwd" class="block text-sm font-medium text-gray-700">Password</label>
                        <input type="password" id="cpwd" name="cpwd" 
                               class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500" required />
                        <small class="text-red-600 block mt-1">Must contain at least 8 characters, uppercase, lowercase, number, and symbol.</small>
                    </div>
                    <div class="mb-4">
                        <label for="clocation" class="block text-sm font-medium text-gray-700">Location</label>
                        <input type="text" id="clocation" name="clocation" 
                               class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500" required />
                    </div>
                    <div class="mb-4">
                        <label for="ccontact" class="block text-sm font-medium text-gray-700">Contact Number</label>
                        <input type="number" id="ccontact" name="ccontact" 
                               class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-indigo-500" required />
                    </div>
                    <div class="flex justify-center space-x-4 mt-6">
                        <input type="submit" value="Register" 
                               class="px-6 py-2 bg-green-500 text-white font-semibold rounded-lg hover:bg-green-600 focus:ring-2 focus:ring-indigo-500" />
                        <input type="reset" value="Clear" 
                               class="px-6 py-2 bg-red-500 text-white font-semibold rounded-lg hover:bg-red-600 focus:ring-2 focus:ring-indigo-500" />
                    </div>
                </form>
            </div>

            <!-- Login Form -->
            <div id="loginBox" class="tab-content hidden">
                <h3 class="text-center text-2xl font-semibold text-gray-800 mb-6">Customer Login</h3>
                <form method="post" action="checkcustomerlogin">
                    <div class="mb-4">
                        <label for="cemail" class="block text-sm font-medium text-gray-700">Email Address</label>
                        <input type="email" id="cemail" name="cemail" 
                               class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-blue-500" required />
                    </div>
                    <div class="mb-4">
                        <label for="cpwd" class="block text-sm font-medium text-gray-700">Password</label>
                        <input type="password" id="cpwd" name="cpwd" 
                               class="w-full px-4 py-2 mt-1 border rounded-lg text-gray-800 focus:ring-2 focus:ring-blue-500" required />
                    </div>
                    <div class="flex justify-center space-x-4 mt-6">
                        <button type="submit" 
                                class="px-6 py-2 bg-blue-500 text-white font-semibold rounded-lg hover:bg-blue-600 focus:ring-2 focus:ring-indigo-500">
                            Login
                        </button>
                        <input type="reset" value="Clear" 
                               class="px-6 py-2 bg-red-500 text-white font-semibold rounded-lg hover:bg-red-600 focus:ring-2 focus:ring-indigo-500" />
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        const registerTab = document.getElementById('registerTab');
        const loginTab = document.getElementById('loginTab');
        const registerBox = document.getElementById('registerBox');
        const loginBox = document.getElementById('loginBox');

        registerTab.addEventListener('click', () => {
            loginBox.classList.add('hidden');
            registerBox.classList.remove('hidden');
        });

        loginTab.addEventListener('click', () => {
            registerBox.classList.add('hidden');
            loginBox.classList.remove('hidden');
        });

        function validatePassword() {
            const password = document.getElementById("cpwd").value;
            const regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$/;
            if (!regex.test(password)) {
                alert("Password must contain at least 8 characters, including uppercase, lowercase, number, and symbol.");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
