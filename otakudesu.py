# scraper_otakudesu_simple.py
import json
import re
import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager

# ========== KONFIGURASI ==========
base_urls = [
    f"https://otakudesu.cloud/episode/wpoiec-episode-{i}-sub-indo/"
    for i in range(1, 10)  # episode 17..24 (sesuaikan jika perlu)
]
HEADLESS = False          # True = headless, False = buka browser visible (jawaban: non-headless lebih stabil)
PAGE_WAIT = 8             # waktu tunggu halaman load (detik)
IFRAME_WAIT = 8           # tunggu iframe muncul setelah klik mirror (detik)
RETRY_ON_FAIL = 2         # berapa kali coba ulang klik mirror bila gagal
OUTPUT_FILE = "one-piece-episodes.json"
# =================================

def extract_episode_number(url):
    m = re.search(r"episode-(\d+)", url)
    return int(m.group(1)) if m else None

def make_driver():
    chrome_options = Options()
    if HEADLESS:
        chrome_options.add_argument("--headless=new")  # coba headless terbaru
    # stability flags
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    chrome_options.add_argument("--disable-gpu")
    chrome_options.add_argument("--window-size=1400,900")
    # custom user agent (biar lebih 'browser-like')
    chrome_options.add_argument(
        "user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
        "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36"
    )

    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)
    return driver

def safe_click(driver, elem):
    try:
        driver.execute_script("arguments[0].scrollIntoView({block:'center'});", elem)
        driver.execute_script("arguments[0].click();", elem)
        return True
    except Exception:
        try:
            elem.click()
            return True
        except Exception:
            return False

def scrape():
    driver = make_driver()
    wait_page = WebDriverWait(driver, PAGE_WAIT)
    results = []

    for url in base_urls:
        print(f"\n--- Scraping {url}")
        ep_num = extract_episode_number(url)
        ep = {
            "title": None,
            "episode": ep_num,
            "url": url,
            "mirrors": {
                "720p": [],
                "480p": [],
                "360p": [],
                "other": []
            }
        }

        try:
            driver.get(url)
        except Exception as e:
            print("❌ driver.get failed:", e)
            results.append(ep)
            continue

        # tunggu minimal body atau judul muncul
        try:
            # beberapa halaman menggunakan .posttl (h1) atau .venutama .posttl etc
            wait_page.until(EC.presence_of_element_located((By.TAG_NAME, "body")))
            time.sleep(1)
        except Exception:
            print("⚠️ timeout waiting page; continuing anyway")

        # ambil judul jika ada
        try:
            title_elem = None
            candidates = driver.find_elements(By.CSS_SELECTOR, ".posttl, .posttl h1, .entry-title, .venutama .posttl")
            if candidates:
                title_elem = candidates[0]
            else:
                # fallback: title tag
                title_text = driver.title
                if title_text:
                    ep["title"] = title_text
            if title_elem:
                ep["title"] = title_elem.text.strip()
            print("Title:", ep["title"])
        except Exception as e:
            print("⚠️ gagal ambil title:", e)

        # cari mirrors (selector sesuai struktur: ul.mirrorstream > li > a  OR .mirrorstream a)
        try:
            mirrors = driver.find_elements(By.CSS_SELECTOR, "ul.mirrorstream li a, .mirrorstream a")
            print(f"Found {len(mirrors)} mirror elements")
        except Exception as e:
            print("⚠️ gagal mencari mirror:", e)
            mirrors = []

        # iterasi per mirror: klik, tunggu iframe, ambil src
        for idx, mirror in enumerate(mirrors):
            mirror_name = (mirror.text or "").strip() or f"mirror-{idx+1}"
            print(f"\n▶ Mirror {idx+1}: {mirror_name}")

            success = False
            for attempt in range(RETRY_ON_FAIL + 1):
                ok = safe_click(driver, mirror)
                if not ok:
                    print(f"  - klik gagal (attempt {attempt+1})")
                    time.sleep(1)
                    continue

                # setelah klik, tunggu iframe muncul
                try:
                    w = WebDriverWait(driver, IFRAME_WAIT)
                    w.until(EC.presence_of_element_located((By.TAG_NAME, "iframe")))
                    time.sleep(0.5)
                    # ambil semua iframe yang ada sekarang
                    iframes = driver.find_elements(By.TAG_NAME, "iframe")
                    srcs = []
                    for f in iframes:
                        src = f.get_attribute("src")
                        if src:
                            srcs.append(src)
                    if srcs:
                        print(f"  - found {len(srcs)} iframe(s)")
                        # kategorikan berdasarkan label mirror_name
                        if "720" in mirror_name:
                            ep["mirrors"]["720p"].extend(srcs)
                        elif "480" in mirror_name:
                            ep["mirrors"]["480p"].extend(srcs)
                        elif "360" in mirror_name:
                            ep["mirrors"]["360p"].extend(srcs)
                        else:
                            ep["mirrors"]["other"].extend(srcs)
                        for s in srcs:
                            print("    •", s)
                        success = True
                        break
                    else:
                        print("  - tidak ada iframe src setelah klik (attempt {})".format(attempt+1))
                except Exception as ex:
                    print(f"  - timeout/no-iframe (attempt {attempt+1}):", ex)

                time.sleep(1)

            if not success:
                print(f"  ⚠️ gagal ambil iframe untuk mirror {mirror_name}")

            # opsional: setelah selesai satu mirror, collapse atau refresh small area
            time.sleep(0.6)

        results.append(ep)

    # tutup driver
    driver.quit()

    # simpan ke file JSON
    with open(OUTPUT_FILE, "w", encoding="utf-8") as fw:
        json.dump(results, fw, indent=2, ensure_ascii=False)

    print(f"\nDone — hasil disimpan ke {OUTPUT_FILE}")

if __name__ == "__main__":
    scrape()
