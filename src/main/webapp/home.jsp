<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<!-- Include Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* Custom styles */
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        width: 100%;
        overflow: hidden; /* Prevent scrollbars */
    }

    /* Full-page background image */
    .background-image {
        position: fixed; /* Make the background fixed to the viewport */
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-image: url('farm.jpg'); /* Your image source */
        background-size: cover; /* Ensure the image covers the full page */
        background-position: center center; /* Keep the image centered */
        object-fit: cover; /* Ensure the image maintains aspect ratio */
        z-index: -1; /* Send the background image behind content */
    }

    .container {
        display: flex;
        justify-content: flex-end;  /* Align content box to the right */
        align-items: center;
        min-height: 100vh; /* Make the container at least 100% height of the viewport */
        position: relative;
        padding-left: 25%; /* Padding to the right for better spacing */
    }

    .content-box {
        background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        margin: 20px 0;
        transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth scaling and shadow effect */
        max-width: 400px; /* Optional: Limit the width of the content box */
        width: 100%; /* Make it responsive */
    }

    /* Hover effect for inward movement */
    .content-box:hover {
        transform: scale(0.95); /* Shrink slightly on hover */
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); /* Stronger shadow on hover */
    }

    ol li {
        margin-bottom: 10px;
        font-size: 18px;
        color: black; /* White text for better contrast */
    }
</style>
</head>
<body>

<%@include file="mainnavbar.jsp" %>

<!-- Full-page background image -->
<div class="background-image"></div>

<div class="container">
    <div class="content-box">
        <h2>Welcome to the Page</h2>
        <p>Login And Buy Products</p>
        <ol>
            <li>Processes Food</li>
            <li>Organic Fertilizers</li>
            <li>Dairy and Animal Products ...</li>
        </ol>
    </div>
</div>

</body>
</html>
