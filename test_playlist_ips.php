<?php
$m3u = file_get_contents('https://mgi24.github.io/tvdigital/idwork.m3u');
preg_match_all('/(http[^\s]+)/', $m3u, $matches);
$urls = array_slice($matches[1], 0, 10);
echo "<pre>Testing random channels from playlist...\n";
foreach ($urls as $url) {
    $ip = parse_url($url, PHP_URL_HOST);
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 3);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) VLC/3.0.18');
    $res = curl_exec($ch);
    $err = curl_error($ch);
    echo "$ip -> " . ($err ? "ERROR: $err" : "SUCCESS") . "\n";
    curl_close($ch);
}
echo "</pre>";
?>
