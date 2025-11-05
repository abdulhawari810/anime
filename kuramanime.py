from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import time

# ========== KONFIGURASI ==========
base_url = "https://v8.kuramanime.tel/anime/1007/overlord/episode/"
start_ep = 1
end_ep = 13
delay = 6  # detik untuk tunggu halaman render
# =================================

# Opsi Chrome
chrome_options = Options()
chrome_options.add_argument("--headless")  # hapus ini kalau mau lihat browser terbuka
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")

# Inisialisasi driver Chrome
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)

for ep in range(start_ep, end_ep + 1):
    url = f"{base_url}{ep}"
    print(f"\n🎬 Episode {ep}")
    print(f"URL: {url}")

    try:
        driver.get(url)
        time.sleep(delay)

        # Cari tag video
        video = driver.find_element(By.ID, "player")

        # Ambil semua <source> di dalam <video>
        sources = video.find_elements(By.TAG_NAME, "source")

        if not sources:
            print("⚠️ Tidak ditemukan source video.")
        else:
            print("✅ Source video ditemukan:")
            for s in sources:
                size = s.get_attribute("size")
                src = s.get_attribute("src")
                print(f"   - {size}p → {src}")

    except Exception as e:
        print(f"❌ Gagal ambil data episode {ep}")
        print("Error:", e)

# Tutup browser
driver.quit()

print("\n🎉 Selesai scraping semua episode!")
