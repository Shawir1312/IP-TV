<?php
$ip = '103.58.160.157';
echo "<pre>";
echo "Testing connection to $ip...\n";

for ($i=1; $i<=3; $i++) {
    $url = "http://$ip/720-ANTV/index.m3u8";
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 3);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) VLC/3.0.18');
    $res = curl_exec($ch);
    $err = curl_error($ch);
    echo "M3U8 Attempt $i: " . ($err ? "ERROR: $err" : "SUCCESS (" . strlen($res) . " bytes)") . "\n";
    curl_close($ch);
    sleep(1);
}

for ($i=1; $i<=3; $i++) {
    $url = "http://$ip/720-ANTV/115809_1779994661.ts"; // Just a test chunk
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 3);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) VLC/3.0.18');
    $res = curl_exec($ch);
    $err = curl_error($ch);
    echo "TS Attempt $i: " . ($err ? "ERROR: $err" : "SUCCESS (" . strlen($res) . " bytes)") . "\n";
    curl_close($ch);
    sleep(1);
}
echo "</pre>";
?>
