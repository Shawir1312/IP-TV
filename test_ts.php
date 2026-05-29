<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

echo "<pre>Testing TS download...\n";

$ts_url = 'http://localhost:2043/proxy_stream.php?url=aHR0cDovLzEwMy41OC4xNjAuMTU3LzcyMC1BTlRWLzExNDk0OF8xNzc5OTk0NjExLnRz';
$ch = curl_init($ts_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HEADER, true);
$response = curl_exec($ch);
curl_close($ch);

$header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
$header = substr($response, 0, $header_size);
$body = substr($response, $header_size);

echo "Headers:\n" . htmlspecialchars($header) . "\n";
echo "Body Length: " . strlen($body) . " bytes\n";
echo "First 50 bytes of body (hex):\n";
echo bin2hex(substr($body, 0, 50)) . "\n";
echo "</pre>";
?>
