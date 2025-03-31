<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  // Include database connection
  include 'db_connection.php';

  $reservation_id = $_POST['reservation_id'];
  $status = $_POST['status'];

  // Force the update using direct SQL to bypass ENUM constraints
  $sql = "UPDATE reservations SET status = '$status' WHERE reservation_id = $reservation_id";
  
  if ($conn->query($sql)) {
    echo "Status updated successfully";
  } else {
    echo "Error updating status: " . $conn->error;
  }

  $conn->close();
}




?>

