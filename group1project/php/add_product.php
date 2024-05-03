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


// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if the product ID is provided
if (isset($_POST['product_id'])) {
    $productID = $_POST['product_id'];

    // Get the customer ID from the session
    session_start();
    $customerID = $_SESSION['customerID'];

    // Check if the product already exists in the shopping cart for the customer
    $stmt = $conn->prepare("SELECT Quantity FROM shoppingcart WHERE CustomerID = ? AND ProductID = ?");
    $stmt->bind_param("ii", $customerID, $productID);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Product already exists, update the quantity
        $row = $result->fetch_assoc();
        $newQuantity = $row['Quantity'] + 1;
        $updateStmt = $conn->prepare("UPDATE shoppingcart SET Quantity = ? WHERE CustomerID = ? AND ProductID = ?");
        $updateStmt->bind_param("iii", $newQuantity, $customerID, $productID);
        $updateStmt->execute();
        $updateStmt->close();
    } else {
        // Product doesn't exist, insert a new record
        $insertStmt = $conn->prepare("INSERT INTO shoppingcart (CustomerID, ProductID, Quantity) VALUES (?, ?, 1)");
        $insertStmt->bind_param("ii", $customerID, $productID);
        $insertStmt->execute();
        $insertStmt->close();
    }

    $stmt->close();
    $conn->close();

    // Optionally, you can return a success message or redirect to another page
    echo "Product added to cart successfully.";
} else {
    // Handle the case when the product ID is not provided
    echo "Error: Product ID not provided.";
}
?>