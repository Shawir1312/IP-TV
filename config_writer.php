<?php
// config_writer.php - Update channel in MySQL database
require_once __DIR__ . '/config.php';

function update_channel($channel_name, $stream_url, $updated_by) {
    $pdo = get_db();

    // Get current active channel to save to history
    $stmt = $pdo->prepare("SELECT channel_name, stream_url FROM channels WHERE is_active = 1 LIMIT 1");
    $stmt->execute();
    $current = $stmt->fetch();

    if ($current && !empty($current['stream_url'])) {
        // Save current to history
        $stmt = $pdo->prepare("INSERT INTO channel_history (channel_name, stream_url, used_at) VALUES (?, ?, NOW())");
        $stmt->execute([$current['channel_name'], $current['stream_url']]);

        // Keep only last 5 history entries (Avoid MySQL LIMIT in subquery error)
        $stmt = $pdo->query("SELECT id FROM channel_history ORDER BY used_at DESC LIMIT 5");
        $keep_ids = $stmt->fetchAll(PDO::FETCH_COLUMN);
        
        if (count($keep_ids) > 0) {
            $ids_str = implode(',', array_map('intval', $keep_ids));
            $pdo->exec("DELETE FROM channel_history WHERE id NOT IN ($ids_str)");
        }
    }

    // Check if active channel exists
    $stmt = $pdo->prepare("SELECT id FROM channels WHERE is_active = 1 LIMIT 1");
    $stmt->execute();
    $exists = $stmt->fetch();

    if ($exists) {
        // Update existing
        $stmt = $pdo->prepare("UPDATE channels SET channel_name = ?, stream_url = ?, stream_changed = 1, updated_by = ?, updated_at = NOW() WHERE id = ?");
        $stmt->execute([$channel_name, $stream_url, $updated_by, $exists['id']]);
    } else {
        // Insert new
        $stmt = $pdo->prepare("INSERT INTO channels (channel_name, stream_url, is_active, stream_changed, updated_by) VALUES (?, ?, 1, 1, ?)");
        $stmt->execute([$channel_name, $stream_url, $updated_by]);
    }

    return true;
}
?>
