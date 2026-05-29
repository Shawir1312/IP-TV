<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

echo "<pre>Testing proxy_stream.php...\n";

$ch = curl_init('http://localhost:2043/proxy_stream.php');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HEADER, true);
$response = curl_exec($ch);
curl_close($ch);

echo htmlspecialchars($response);
echo "</pre>";
?>
