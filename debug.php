<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

require_once __DIR__ . '/config.php';
require_once __DIR__ . '/config_writer.php';
require_once __DIR__ . '/m3u_parser.php';

echo "<pre>";
echo "Testing update_channel...\n";
try {
    $res = update_channel('Test Channel', 'http://test.com/stream.m3u8', 'admin');
    echo "update_channel Result: " . ($res ? "Success" : "Failed") . "\n";
} catch (Exception $e) {
    echo "update_channel Exception: " . $e->getMessage() . "\n";
}

echo "\nTesting import_playlist...\n";
try {
    $res = import_playlist_to_db('https://mgi24.github.io/tvdigital/idwork.m3u');
    print_r($res);
} catch (Exception $e) {
    echo "import_playlist Exception: " . $e->getMessage() . "\n";
}
echo "</pre>";
?>
