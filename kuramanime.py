import time
import json
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import os

# ========== KONFIGURASI SCRAPING ==========
base_url = "https://v8.kuramanime.tel/anime/50/one-piece-OreGjicNb0Fh/episode/"
start_ep = 1132
end_ep = 1140
delay = 6 # detik untuk tunggu halaman render
OUTPUT_FILE = f"one_piece_{start_ep}-{end_ep}.json"
# ==========================================

# Opsi Chrome
chrome_options = Options()
chrome_options.add_argument("--headless") # Hapus tanda # jika ingin browser tidak terlihat
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# Inisialisasi driver Chrome
print("⚙️ Memulai driver Chrome...")
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)

# List untuk menyimpan semua data hasil scraping
data_results = []


for ep in range(start_ep, end_ep + 1):
    url = f"{base_url}{ep}"
    print(f"\n🎬 Memproses Episode {ep} | URL: {url}")

    # 1. UBAH DARI LIST MENJADI DICTIONARY
    episode_data = {
        "title": "",
        "episodeNumber": ep,
        "videoURL": {}  # <-- DIUBAH MENJADI DICTIONARY KOSONG
    }

    try:
        driver.get(url)
        time.sleep(delay)

        # Cari tag video
        video = driver.find_element(By.ID, "player")

        # Ambil semua <source> di dalam elemen video/player
        sources = video.find_elements(By.TAG_NAME, "source")

        if not sources:
            print("⚠️ Tidak ditemukan source video.")
        else:
            print("✅ Source video ditemukan:")
            for s in sources:
                size = s.get_attribute("size")
                src = s.get_attribute("src")

                # 2. UBAH CARA PENYIMPANAN
                # Kunci (key) adalah kualitas (misalnya "720p")
                # Nilai (value) adalah URL sumber
                
                # Pastikan size memiliki nilai sebelum menambahkannya
                if size:
                    # Kunci menjadi '720p', '480p', dll.
                    key = f"{size}p" 
                    # Nilai adalah URL
                    value = src 
                    
                    # Tambahkan langsung ke dictionary episode_data["videoURL"]
                    episode_data["videoURL"][key] = value
                    
                    print(f"   - {key} → {value}")
                else:
                    print("   - Kualitas tidak terdeteksi, dilewati.")
            
        # Tambahkan data episode yang berhasil ke list utama
        data_results.append(episode_data)

    except Exception as e:
        print(f"❌ Gagal ambil data episode {ep}")
        episode_data["error"] = str(e)
        data_results.append(episode_data)
# Tutup browser setelah loop selesai
print("\n🔌 Menutup driver Chrome...")
driver.quit()

# ========== FUNGSI SIMPAN KE JSON ==========
try:
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        # Gunakan indent=4 agar file JSON mudah dibaca
        json.dump(data_results, f, ensure_ascii=False, indent=4)
    
    print(f"\n✨ Selesai! Data berhasil disimpan ke file: **{OUTPUT_FILE}**")
    print(f"Total episode yang diproses: {len(data_results)}")

except Exception as e:
    print(f"\n❌ Gagal menyimpan data ke JSON: {e}")
# ============================================