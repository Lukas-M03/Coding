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

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Prepare and execute the SQL query
    $stmt = $conn->prepare("SELECT CustomerID FROM customer WHERE Username = ? AND Password = ?");
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Login successful - current user and customer ID stored as sessions
        $row = $result->fetch_assoc();
        $customerID = $row['CustomerID'];
        $_SESSION['username'] = $username;
        $_SESSION['customerID'] = $customerID;
        header("Location: index.html"); // Redirect to the desired page
        exit();
    } else {
        // Login failed
        $error_message = "Invalid username or password";
    }
    $stmt->close();

}

// Close the database connection
$conn->close();
?>