<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

echo "<pre>Testing new TS proxy...\n";

// Fetch the main playlist to get a FRESH chunk URL
$m3u8_url = 'http://localhost:2043/proxy_stream.php';
$content = file_get_contents($m3u8_url);

$lines = explode("\n", $content);
$chunk_url = '';
$original_url = '';

foreach ($lines as $line) {
    if (strpos($line, 'proxy_stream.php?url=') !== false) {
        $chunk_url = 'http://localhost:2043/' . trim($line);
        // decode original URL
        $b64 = str_replace('proxy_stream.php?url=', '', trim($line));
        $original_url = base64_decode(urldecode($b64));
        break;
    }
}

echo "Original URL: $original_url\n";
echo "Chunk URL: $chunk_url\n\n";

echo "Fetching original...\n";
$ch = curl_init($original_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HEADER, true);
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) VLC/3.0.18');
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_TIMEOUT, 10);
$res_orig = curl_exec($ch);
$http_orig = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$err = curl_error($ch);
curl_close($ch);
echo "Original HTTP: $http_orig, Error: $err\n\n";

echo "</pre>";
?>
