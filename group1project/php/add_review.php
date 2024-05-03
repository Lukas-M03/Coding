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
    $customerId = $SESSION['customerID'];
    $productId = $_POST['product_id'];
    $rating = $_POST['rating'];
    $comment = $_POST['comment'];

    // SQL to insert review into database
    $sql = "INSERT INTO reviews (CustomerID, ProductID, Rating, Comment) VALUES ('$customerId', '$productId', '$rating', '$comment')";
    if ($conn->query($sql) === TRUE) {
        echo "Review added successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close database connection
$conn->close();
?>