<?php
  $ssn = filter_input(INPUT_POST,'ssn');
  $host = "localhost";
  $username = "root";
  $password = "";
  $dbname = "company";
  $conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

if (!empty($ssn)) {
  $sql = "SELECT * FROM employee WHERE ssn = $ssn";
  if(($conn->query($sql)) > 0)){
    while($row = ()$conn->query($sql))->fetch_assoc()) {
        echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
    }
  }
  else {
    echo "Error : ".$sql."".$conn->error;
  }
  $conn->close();
  die();
}

?>
