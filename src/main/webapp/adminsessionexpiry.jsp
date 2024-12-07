<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Session Expired</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/framer-motion/7.2.1/framer-motion.umd.js" integrity="sha384-NNVxZjysK7Np5Y5IhvYxK+SpE7ULcdmF7pCrSOV5oI8uE9MhJQXcWBz0ZWbg6NYc" crossorigin="anonymous"></script>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex items-center justify-center min-h-screen bg-gray-100">
  <div id="card" class="w-full max-w-md p-6 bg-white rounded-lg shadow-lg">
    <h2 class="text-2xl font-bold text-gray-800 mb-4">OOPS... Session Expired...</h2>
    <p class="text-gray-600 mb-6">Your session has timed out. Please log in again to continue.</p>
    <a href="adminlogin" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition">Login Again</a>
  </div>

  <script>
    // Import Framer Motion
    const { motion } = window["framer-motion"];

    // Add motion to the card
    motion('#card', {
      initial: { x: '-100%' },
      animate: { x: '50%' },
      transition: { type: 'spring', stiffness: 100, damping: 20 }
    });
  </script>
</body>
</html>
