<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

echo "<pre>Testing new TS proxy...\n";

// Fetch the main playlist to get a FRESH chunk URL
$m3u8_url = 'http://localhost:2043/proxy_stream.php';
$content = file_get_contents($m3u8_url);
if (!$content) {
    die("Failed to fetch m3u8\n");
}

$lines = explode("\n", $content);
$chunk_url = '';
foreach ($lines as $line) {
    if (strpos($line, 'proxy_stream.php?url=') !== false) {
        // The URL might be absolute or relative, but let's assume it's relative as generated
        $chunk_url = 'http://localhost:2043/' . trim($line);
        break;
    }
}

if (!$chunk_url) {
    die("No chunk URL found in m3u8:\n" . htmlspecialchars($content));
}

echo "Found chunk URL: $chunk_url\n";

$ch = curl_init($chunk_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HEADER, true);
$response = curl_exec($ch);
$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

$header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
$header = substr($response, 0, $header_size);
$body = substr($response, $header_size);

echo "HTTP Code: $http_code\n";
echo "Headers:\n" . htmlspecialchars($header) . "\n";
echo "Body Length: " . strlen($body) . " bytes\n";
if (strlen($body) > 0) {
    echo "First 50 bytes of body (hex):\n";
    echo bin2hex(substr($body, 0, 50)) . "\n";
}
echo "</pre>";
?>
