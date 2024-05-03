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
 
// Set a cookie named "user" with the value "John"
setcookie("user", "John", time() + 3600, "/"); 
?>
