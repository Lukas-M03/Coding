<?php

// Create a connection

session_start();
$conn = mysqli_connect("database-1.c8u95fwv8l0l.us-east-1.rds.amazonaws.com", "Admin", "clothingshop",
"clothingshop");

// Check connection

 if (!$conn) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    exit();
 }

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $customerId = $_POST['customer_id'];
    $productId = $_POST['product_id'];
    $quantity = $_POST['quantity'];

    // Check if product is available in stock
    $sql = "SELECT ProductStock FROM product WHERE ProductID='$productId' AND ProductStock >= '$quantity'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        // Product is available, proceed with order placement
        $row = $result->fetch_assoc();
        $currentStock = $row['ProductStock'];

        // Insert order details into orderproduct table
        $orderTotal = $quantity * $row['Price']; // Calculate order total based on product price and quantity
        $dateOfPurchase = date('Y-m-d'); // Get current date
        $shippingInfo = ""; // You can add shipping information here or retrieve it from the form

        $sql = "INSERT INTO orderproduct (CustomerID, ProductID, DateOfPurchase, OrderTotal, ShippingInfo) 
                VALUES ('$customerId', '$productId', '$dateOfPurchase', '$orderTotal', '$shippingInfo')";

        if ($conn->query($sql) === TRUE) {
            // Update product stock
            $newStock = $currentStock - $quantity;
            $sql = "UPDATE product SET ProductStock = '$newStock' WHERE ProductID='$productId'";
            $conn->query($sql);
            echo "Order placed successfully";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } else {
        echo "Product out of stock";
    }
}

// Close database connection
$conn->close();
?>