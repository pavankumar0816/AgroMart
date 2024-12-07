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
    <title>Agri Connect</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        /* Add some basic CSS animation */
        .fade-in {
            opacity: 0;
            transform: translateX(-200px);
            transition: opacity 1s ease-in-out, transform 1s ease-in-out;
        }

        .fade-in-visible {
            opacity: 1;
            transform: translateX(0);
        }

        /* Adjust the image positioning to make them appear slightly higher */
        .image-container {
            margin-top: -20px; /* Move the image box up */
        }
    </style>
</head>
<body class="bg-gray-300">

   <!-- Navbar Section -->
<nav class="bg-gray-600 p-4">
    <div class="container mx-auto flex justify-between items-center">
        <!-- Logo or brand name -->
        <div class="text-white text-2xl font-bold">
            <a href="index.jsp">AgroMart</a>
        </div>
        <!-- Navigation links -->
        <div class="flex items-center space-x-4">
            <!-- Explore Button -->
            <a href="viewallfarmerproducts" class="inline-block px-6 py-3 bg-blue-500 text-white rounded-full hover:bg-blue-700 transition duration-300 text-center">
                Explore For More Products
            </a>
            <!-- Logout Icon -->
            <a href="customerlogout" class="text-white text-xl hover:text-red-500 transition duration-300">
                <i class="fas fa-sign-out-alt"></i>
            </a>
        </div>
    </div>
</nav>


    <!-- Rectangle Banner Section -->
    <div class="relative mt-12 mx-auto w-4/5">
        <!-- Left Arrow (<) -->
        <div class="absolute top-1/2 left-4 transform -translate-y-1/2 bg-black bg-opacity-50 text-white p-2 cursor-pointer z-10" id="left-arrow">
            <span class="text-2xl">&lt;</span>  <!-- Left arrow symbol -->
        </div>

        <!-- Banner Image -->
        <div class="w-full overflow-hidden relative">
            <img id="banner-image" src="plant.jpg" alt="Banner Image" class="object-cover w-full h-96"> <!-- Increased height (h-80) -->
        </div>

        <!-- Right Arrow (>) -->
        <div class="absolute top-1/2 right-4 transform -translate-y-1/2 bg-black bg-opacity-50 text-white p-2 cursor-pointer" id="right-arrow">
            <span class="text-2xl">&gt;</span>  <!-- Right arrow symbol -->
        </div>
    </div>

    <!-- Image Section Below the Banner -->
    <div class="mt-8 mx-auto w-4/5">  
        <section class="pt-12 pb-20 container mx-auto">
            <h1 id="featured-header" class="text-2xl font-bold text-left pb-10 uppercase fade-in">
                Explore Our Featured Categories
            </h1>
        </section>  
        <!-- Flexbox container for images without horizontal scrolling -->
        <div class="flex gap-20 py-2 justify-center">  <!-- Removed 'overflow-x-auto' and added 'justify-center' for centering images -->
            <!-- Circular Image Styling with the 'image-container' class -->
            
            <div class="flex-none relative w-50 h-48 transform transition duration-300 hover:scale-105 hover:shadow-lg image-container">
                <img src="vegetables.jpg" alt="Image 1" class="object-cover w-full h-full rounded-full shadow-xl border-4 border-white">
                <div class="absolute bottom-0 left-0 right-0 bg-black bg-opacity-50 text-white p-2 text-center rounded-b-full">
                    <h3 class="text-lg font-semibold">Image 1</h3>
                    <p class="text-sm">$100</p>
                </div>
            </div>
            <div class="flex-none relative w-50 h-48 transform transition duration-300 hover:scale-105 hover:shadow-lg image-container">
                <img src="fruit.jpg" alt="Image 2" class="object-cover w-full h-full rounded-full shadow-xl border-4 border-white">
                <div class="absolute bottom-0 left-0 right-0 bg-black bg-opacity-50 text-white p-2 text-center rounded-b-full">
                    <h3 class="text-lg font-semibold">Image 2</h3>
                    <p class="text-sm">$150</p>
                </div>
            </div>

            <div class="flex-none relative w-50 h-48 transform transition duration-300 hover:scale-105 hover:shadow-lg image-container">
                <img src="banner1.jpg" alt="Image 3" class="object-cover w-full h-full rounded-full shadow-xl border-4 border-white">
                <div class="absolute bottom-0 left-0 right-0 bg-black bg-opacity-50 text-white p-2 text-center rounded-b-full">
                    <h3 class="text-lg font-semibold">Image 3</h3>
                    <p class="text-sm">$200</p>
                </div>
            </div>

            <div class="flex-none relative w-50 h-48 transform transition duration-300 hover:scale-105 hover:shadow-lg image-container">
                <img src="banner2.jpg" alt="Image 4" class="object-cover w-full h-full rounded-full shadow-xl border-4 border-white">
                <div class="absolute bottom-0 left-0 right-0 bg-black bg-opacity-50 text-white p-2 text-center rounded-b-full">
                    <h3 class="text-lg font-semibold">Image 4</h3>
                    <p class="text-sm">$250</p>
                </div>
            </div>
        </div>
    </div>
    
    <br><br>
    <br><br>
    <br><br>
<!-- About AgriConnect Section -->
<div class="bg-green-100 py-12 px-8">
    <div class="container mx-auto text-center">
        <h2 class="text-4xl font-bold text-green-700 mb-6">About AgriConnect</h2>
        <p class="text-gray-700 text-lg leading-relaxed mb-4">
            AgriConnect is a platform designed to empower farmers by helping them transform their crops into value-added products, such as processed foods and handmade goods. By doing so, we aim to promote rural entrepreneurship and foster economic growth in farming communities.
        </p>
        <p class="text-gray-700 text-lg leading-relaxed mb-4">
            The web application connects farmers with global buyers, enabling them to showcase and sell their innovative products. AgriConnect also emphasizes the use of modern technology in farming practices, bridging the gap between traditional agriculture and the digital economy.
        </p>
        <p class="text-gray-700 text-lg leading-relaxed mb-4">
            Additionally, our initiative focuses on the effective utilization of farm waste, turning it into sustainable products that contribute to environmental conservation. Through AgriConnect, we strive to build a future where technology and agriculture work hand-in-hand.
        </p>
    </div>
</div>
 
    <br><br>
<!-- Contact Us Form Section -->
<div class="py-12 px-8 bg-gray-300">
    <div class="container mx-auto">
        <div class="max-w-lg mx-auto bg-gray-400 shadow-lg rounded-lg p-6">
            <h2 class="text-2xl font-bold text-center text-gray-800 mb-6">Contact Us</h2>
 			<form method="post" action="sendemail">
                <div class="mb-4">
                    <label for="name" class="block text-gray-600 font-medium mb-2">Name</label>
                    <input type="text" id="name" name="name" required class="w-full border border-gray-300 rounded-lg p-3 focus:ring focus:ring-green-200">
                </div>
                <div class="mb-4">
                    <label for="email" class="block text-gray-600 font-medium mb-2">Email ID</label>
                    <input type="email" id="email" name="email" required class="w-full border border-gray-300 rounded-lg p-3 focus:ring focus:ring-green-200">
                </div>
                <div class="mb-4">
			    <label for="mobile" class="block text-gray-600 font-medium mb-2">Mobile Number</label>
			    <input 
			        type="tel" 
			        id="mobile" 
			        name="mobile" 
			        required 
			        pattern="\d{10}" 
			        title="Please enter a valid 10-digit mobile number." 
			        class="w-full border border-gray-300 rounded-lg p-3 focus:ring focus:ring-green-200">
			    <p id="mobile-error" class="text-red-500 text-sm hidden">Please enter a valid 10-digit mobile number.</p>
			</div>

<script>
    const mobileInput = document.getElementById('mobile');
    const errorText = document.getElementById('mobile-error');

    mobileInput.addEventListener('input', () => {
        if (/^\d{10}$/.test(mobileInput.value)) {
            errorText.classList.add('hidden');
        } else {
            errorText.classList.remove('hidden');
        }
    });
</script>

                <div class="mb-4">
                    <label for="subject" class="block text-gray-600 font-medium mb-2">Subject</label>
                    <input type="text" id="subject" name="subject" required class="w-full border border-gray-300 rounded-lg p-3 focus:ring focus:ring-green-200">
                </div>
                <div class="mb-4">
                    <label for="message" class="block text-gray-600 font-medium mb-2">Message</label>
                    <textarea id="message" name="message" required rows="4" class="w-full border border-gray-300 rounded-lg p-3 focus:ring focus:ring-green-200"></textarea>
                </div>
                <div class="text-center">
                    <button type="submit" class="bg-green-600 text-white font-medium py-2 px-4 rounded-lg hover:bg-green-700 transition duration-300">
                        Submit
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>



    <script>
        // Array of images for the banner
        const images = [       
            'vegetables.jpg',     
            'fruit.jpg',  
            'farmbg.jpg',
            'banner1.jpg',
            'banner2.jpg',
            'banner3.jpg',
              
            // Add more images if needed
        ];

        let currentIndex = 0; // To track the current image

        // Function to update the image based on the index
        function updateImage() {
            const bannerImage = document.getElementById('banner-image'); // Get the banner image element
            bannerImage.src = images[currentIndex]; // Update the image source
        }

        // Left Arrow Click Event (previous image)
        document.getElementById('left-arrow').addEventListener('click', () => {
            // If currentIndex is 0, go to the last image
            currentIndex = (currentIndex === 0) ? images.length - 1 : currentIndex - 1;
            updateImage(); // Change the image
        });

        // Right Arrow Click Event (next image)
        document.getElementById('right-arrow').addEventListener('click', () => {
            // If currentIndex is the last image, go to the first image
            currentIndex = (currentIndex === images.length - 1) ? 0 : currentIndex + 1;
            updateImage(); // Change the image
        });

        // Function to automatically change the image every 3 seconds
        setInterval(() => {
            currentIndex = (currentIndex === images.length - 1) ? 0 : currentIndex + 1;
            updateImage(); // Change the image
        }, 2000); // Change image every 3 seconds
        
     // JavaScript to add the fade-in effect when the header comes into view
        const header = document.getElementById('featured-header');
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    // Add class when the element comes into view
                    entry.target.classList.add('fade-in-visible');
                }
            });
        }, { threshold: 0.5 }); // Trigger when 50% of the element is in view

        observer.observe(header);
    </script>

</body>
</html>
