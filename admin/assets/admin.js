/* admin.js - Frontend logic for Admin Panel */

function showAlert(message, type = 'success') {
    const container = document.getElementById('alert-container');
    if (!container) return;
    
    container.innerHTML = `<div class="alert alert-${type}">${message}</div>`;
    setTimeout(() => { container.innerHTML = ''; }, 5000);
}

// ==========================================
// Dashboard Functions
// ==========================================
function refreshDashboard() {
    if (!document.getElementById('active-count')) return;

    fetch('api.php?action=active_viewers')
        .then(res => res.json())
        .then(data => {
            if (data.status === 'ok') {
                document.getElementById('active-count').textContent = data.count;
                let tbody = document.getElementById('viewers-table-body');
                tbody.innerHTML = '';
                
                if (data.count === 0) {
                    tbody.innerHTML = '<tr><td colspan="4" style="text-align:center;">Tidak ada viewer aktif</td></tr>';
                } else {
                    data.viewers.forEach(v => {
                        let tr = document.createElement('tr');
                        tr.innerHTML = `
                            <td>${sanitize(v.ip)}</td>
                            <td>${sanitize(v.start_time)}</td>
                            <td>${sanitize(v.last_ping)}</td>
                            <td style="font-size:0.85em; color:#aaa;">${sanitize(v.user_agent)}</td>
                        `;
                        tbody.appendChild(tr);
                    });
                }
            }
        });

    fetch('api.php?action=stream_status')
        .then(res => res.json())
        .then(data => {
            const statusEl = document.getElementById('stream-status-text');
            if (data.status === 'ok') {
                if (data.stream_status === 'online') {
                    statusEl.innerHTML = '<span class="badge badge-online">✅ Online (HTTP ' + data.code + ')</span>';
                } else {
                    statusEl.innerHTML = '<span class="badge badge-offline">❌ Offline (HTTP ' + data.code + ')</span>';
                }
            }
        });

    fetch('api.php?action=get_channel')
        .then(res => res.json())
        .then(data => {
            if (data.status === 'ok' && document.getElementById('current-channel-name')) {
                document.getElementById('current-channel-name').textContent = data.data.channel_name;
            }
        });

    fetch('api.php?action=recent_logs')
        .then(res => res.json())
        .then(data => {
            if (data.status === 'ok' && document.getElementById('recent-logs')) {
                document.getElementById('recent-logs').textContent = data.logs.join('\n');
            }
        });
}


// ==========================================
// Channel Manager Functions
// ==========================================

function loadCurrentChannel() {
    fetch('api.php?action=get_channel')
        .then(res => res.json())
        .then(data => {
            if (data.status === 'ok' && data.data) {
                const nameEl = document.getElementById('channel_name');
                const urlEl = document.getElementById('stream_url');
                if (nameEl) nameEl.value = data.data.channel_name || '';
                if (urlEl) urlEl.value = data.data.stream_url || '';
            }
        });
}

function loadHistory() {
    const tbody = document.getElementById('history-table-body');
    if (!tbody) return;

    fetch('api.php?action=channel_history')
        .then(res => res.json())
        .then(data => {
            if (data.status === 'ok') {
                tbody.innerHTML = '';
                if (!data.history || data.history.length === 0) {
                    tbody.innerHTML = '<tr><td colspan="2" style="text-align:center;">Belum ada riwayat</td></tr>';
                } else {
                    data.history.forEach(h => {
                        let tr = document.createElement('tr');
                        let nameTd = document.createElement('td');
                        nameTd.innerHTML = `<strong>${sanitize(h.channel_name)}</strong><br><small style="color:#aaa;">${sanitize(h.stream_url)}</small>`;
                        
                        let actionTd = document.createElement('td');
                        let btn = document.createElement('button');
                        btn.className = 'btn btn-secondary';
                        btn.style.padding = '5px 10px';
                        btn.textContent = 'Pakai Lagi';
                        btn.onclick = () => fillForm(h.channel_name, h.stream_url);
                        
                        actionTd.appendChild(btn);
                        tr.appendChild(nameTd);
                        tr.appendChild(actionTd);
                        tbody.appendChild(tr);
                    });
                }
            }
        });
}

function sanitize(str) {
    if (!str) return '';
    let temp = document.createElement('div');
    temp.textContent = str;
    return temp.innerHTML;
}

function fillForm(name, url) {
    document.getElementById('channel_name').value = name;
    document.getElementById('stream_url').value = url;
    document.getElementById('test-result').innerHTML = '';
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

function testUrl() {
    const url = document.getElementById('stream_url').value;
    const resEl = document.getElementById('test-result');
    if (!url) {
        resEl.innerHTML = '<span style="color:#ff1744">Masukkan URL terlebih dahulu.</span>';
        return;
    }

    resEl.innerHTML = '<span style="color:#ff9100">Mengecek URL... ⏳</span>';
    
    fetch('api.php?action=test_url', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({ url: url, csrf_token: CSRF_TOKEN })
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === 'ok') {
            if (data.reachable) {
                resEl.innerHTML = `<span style="color:#00e676">✅ URL Bisa Diakses (HTTP ${data.code})</span>`;
            } else {
                resEl.innerHTML = `<span style="color:#ff1744">❌ URL Tidak Dapat Dijangkau (HTTP ${data.code})</span>`;
            }
        } else {
            resEl.innerHTML = `<span style="color:#ff1744">❌ Error: ${sanitize(data.message)}</span>`;
        }
    })
    .catch(err => {
        resEl.innerHTML = `<span style="color:#ff1744">❌ Terjadi kesalahan jaringan.</span>`;
    });
}

function saveChannel() {
    const name = document.getElementById('channel_name').value;
    const url = document.getElementById('stream_url').value;

    fetch('api.php?action=save_channel', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({ 
            channel_name: name, 
            stream_url: url,
            csrf_token: CSRF_TOKEN
        })
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === 'ok') {
            showAlert('✅ Channel berhasil disimpan dan diterapkan!', 'success');
            loadHistory();
            document.getElementById('test-result').innerHTML = '';
            loadPlaylist(); // Refresh highlight
        } else {
            showAlert('❌ Gagal menyimpan: ' + sanitize(data.message), 'danger');
        }
    })
    .catch(err => {
        showAlert('❌ Terjadi kesalahan server.', 'danger');
    });
}

// ==========================================
// Playlist Manager Functions
// ==========================================
let allChannels = [];
let previewPlayer = null;

function importPlaylist() {
    const url = document.getElementById('playlist_url').value;
    const btn = document.getElementById('btn-import');
    const status = document.getElementById('import-status');
    
    if (!url) return;

    btn.disabled = true;
    btn.textContent = 'Mengimpor...';
    status.textContent = 'Mendownload dan memparse playlist, mohon tunggu...';

    fetch('api.php?action=import_playlist', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({ playlist_url: url, csrf_token: CSRF_TOKEN })
    })
    .then(res => res.json())
    .then(data => {
        btn.disabled = false;
        btn.textContent = 'Import / Update Playlist';
        
        if (data.status === 'ok') {
            status.innerHTML = `<span style="color:#00e676">✅ ${sanitize(data.message)}</span>`;
            loadPlaylist();
        } else {
            status.innerHTML = `<span style="color:#ff1744">❌ ${sanitize(data.message)}</span>`;
        }
    })
    .catch(err => {
        btn.disabled = false;
        btn.textContent = 'Import / Update Playlist';
        status.innerHTML = `<span style="color:#ff1744">❌ Kesalahan jaringan saat import.</span>`;
    });
}

function loadPlaylist() {
    const container = document.getElementById('playlist-container');
    if (!container) return;

    fetch('api.php?action=list_playlist')
        .then(res => res.json())
        .then(data => {
            if (data.status === 'ok') {
                allChannels = data.channels || [];
                
                // Update stats
                document.getElementById('playlist-total-count').textContent = `${data.total} Channel`;
                
                // Populate Group Filter
                const groupSelect = document.getElementById('filter-group');
                groupSelect.innerHTML = '<option value="">Semua Kategori</option>';
                if (data.groups) {
                    data.groups.forEach(g => {
                        let opt = document.createElement('option');
                        opt.value = g;
                        opt.textContent = g || 'Tanpa Kategori';
                        groupSelect.appendChild(opt);
                    });
                }

                // If source exists, set in input
                if (data.source && data.source.playlist_url) {
                    document.getElementById('playlist_url').value = data.source.playlist_url;
                    document.getElementById('import-status').textContent = `Terakhir import: ${data.source.imported_at}`;
                }

                renderPlaylist(allChannels);
            }
        });
}

function filterPlaylist() {
    const search = document.getElementById('filter-search').value.toLowerCase();
    const group = document.getElementById('filter-group').value;

    const filtered = allChannels.filter(ch => {
        const matchSearch = ch.channel_name.toLowerCase().includes(search);
        const matchGroup = group === "" || ch.group_name === group;
        return matchSearch && matchGroup;
    });

    renderPlaylist(filtered);
}

function renderPlaylist(channels) {
    const container = document.getElementById('playlist-container');
    container.innerHTML = '';
    
    if (channels.length === 0) {
        container.innerHTML = '<div style="padding: 20px; text-align: center; color: #888;">Tidak ada channel yang cocok.</div>';
        return;
    }

    const currentActiveUrl = document.getElementById('stream_url').value;

    channels.forEach(ch => {
        const div = document.createElement('div');
        div.className = 'channel-item';
        if (ch.stream_url === currentActiveUrl) {
            div.classList.add('active');
        }

        const logo = ch.logo_url ? sanitize(ch.logo_url) : 'data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"><rect width="40" height="40" fill="%23333"/><text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle" fill="white" font-size="10">TV</text></svg>';
        
        div.innerHTML = `
            <div class="channel-info">
                <img src="${logo}" class="channel-logo" alt="Logo" onerror="this.style.display='none'">
                <div>
                    <div style="font-weight: bold;">${sanitize(ch.channel_name)}</div>
                    <div style="font-size: 0.8em; color: #aaa;">${sanitize(ch.group_name || 'Tanpa Kategori')}</div>
                </div>
            </div>
            <div>
                <button class="btn btn-secondary" onclick="previewChannel(${ch.id})">Preview</button>
                <button class="btn btn-primary" onclick="setPlaylistChannel(${ch.id})">Pakai</button>
            </div>
        `;
        container.appendChild(div);
    });
}

// ==========================================
// Preview Logic
// ==========================================

function previewChannel(id) {
    fetch('api.php?action=preview_channel&id=' + id)
        .then(res => res.json())
        .then(data => {
            if (data.status === 'ok') {
                const ch = data.data;
                document.getElementById('preview-title').textContent = 'Preview: ' + sanitize(ch.channel_name);
                document.getElementById('preview-url').textContent = sanitize(ch.stream_url);
                document.getElementById('preview-modal').style.display = 'flex';
                
                const btnApply = document.getElementById('btn-set-preview-active');
                btnApply.onclick = () => {
                    closePreview();
                    setPlaylistChannel(id);
                };

                startPreviewPlayer(ch.stream_url);
            }
        });
}

function closePreview() {
    document.getElementById('preview-modal').style.display = 'none';
    if (previewPlayer) {
        if (typeof previewPlayer.destroy === 'function') {
            previewPlayer.destroy();
        }
        previewPlayer = null;
    }
    const video = document.getElementById('preview-video');
    video.pause();
    video.src = '';
    video.removeAttribute('src');
    video.load();
}

function startPreviewPlayer(url) {
    const video = document.getElementById('preview-video');
    
    // Cleanup previous instance if any
    if (previewPlayer) {
        if (typeof previewPlayer.destroy === 'function') previewPlayer.destroy();
        previewPlayer = null;
    }

    if (Hls.isSupported() && url.includes('.m3u8')) {
        const hls = new Hls();
        hls.loadSource(url);
        hls.attachMedia(video);
        hls.on(Hls.Events.MANIFEST_PARSED, function() {
            video.play().catch(e => console.log('Autoplay prevented', e));
        });
        previewPlayer = hls;
    } else if (video.canPlayType('application/vnd.apple.mpegurl') && url.includes('.m3u8')) {
        video.src = url;
        video.play().catch(e => console.log('Autoplay prevented', e));
    } else if (mpegts.getFeatureList().mseLivePlayback && !url.includes('.m3u8')) {
        const player = mpegts.createPlayer({
            type: 'mse',
            isLive: true,
            url: url
        });
        player.attachMediaElement(video);
        player.load();
        player.play().catch(e => console.log('Autoplay prevented', e));
        previewPlayer = player;
    } else {
        video.src = url;
        video.play().catch(e => console.log('Autoplay prevented', e));
    }
}

function setPlaylistChannel(id) {
    fetch('api.php?action=select_playlist_channel', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({ channel_id: id, csrf_token: CSRF_TOKEN })
    })
    .then(res => res.json())
    .then(data => {
        if (data.status === 'ok') {
            showAlert(sanitize(data.message), 'success');
            loadCurrentChannel();
            loadHistory();
            setTimeout(loadPlaylist, 500); // refresh highlight
        } else {
            showAlert('❌ Gagal: ' + sanitize(data.message), 'danger');
        }
    })
    .catch(err => {
        showAlert('❌ Terjadi kesalahan jaringan.', 'danger');
    });
}
