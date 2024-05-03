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

// Fetch cart items for the logged-in customer
$customerID = $_SESSION['customerID']; 

$sql = "SELECT p.ProductName, p.Price, c.Quantity
        FROM shoppingcart c
        JOIN product p ON c.ProductID = p.ProductID
        WHERE c.CustomerID = $customerID";

$result = $conn->query($sql);

        // Loop through the result set and display the cart items
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row['ProductName'] . "</td>";
                echo "<td>" . $row['Price'] . "</td>";
                echo "<td>" . $row['Quantity'] . "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='3'>Your cart is empty.</td></tr>";
        }
        ?>

// Close the database connection
$conn->close();
?>