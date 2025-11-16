import requests
from bs4 import BeautifulSoup
import json
import time

def scrape_anime_schedule(day: str, page: int = 2):
    url = f"https://v8.kuramanime.tel/schedule?scheduled_day={day}&page={page}"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
                      "AppleWebKit/537.36 (KHTML, like Gecko) "
                      "Chrome/122.0.0.0 Safari/537.36"
    }

    response = requests.get(url, headers=headers)
    response.raise_for_status()

    soup = BeautifulSoup(response.text, "html.parser")
    anime_items = soup.select("div.product__item")

    data = []
    for item in anime_items:
        link_tag = item.find("a", href=True)
        anime_url = link_tag["href"] if link_tag else None

        pic_div = item.select_one(".product__item__pic")
        image_url = pic_div.get("data-setbg") if pic_div else None

        title_tag = item.select_one(".product__item__text h5 a")
        title = title_tag.text.strip() if title_tag else None

        # Ambil hari & jam
        li_items = item.select("div.view-end ul li")

        hari = li_items[0].get_text(strip=True) if len(li_items) > 0 else None
        jam = li_items[1].get_text(strip=True) if len(li_items) > 1 else None

        if title and image_url and anime_url:
            data.append({
                "title": title,
                "image": image_url,
                "hari": hari,   # <--- Tambahkan
                "jam": jam      # <--- Tambahkan
            })

    return data



def scrape_all_days():
    days = [
        "monday", "tuesday", "wednesday", "thursday",
        "friday", "saturday", "sunday"
    ]

    all_data = {}
    for day in days:
        print(f"🔍 Mengambil jadwal anime hari {day}...")
        try:
            data = scrape_anime_schedule(day)
            all_data[day] = data
            print(f"✅ {len(data)} anime ditemukan untuk hari {day}")
        except Exception as e:
            print(f"❌ Gagal mengambil data {day}: {e}")
        time.sleep(1)  # jeda agar tidak terlalu cepat (anti ban)

    return all_data


def save_to_json(data, filename="anime_sunday_all_page_.json"):
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
    print(f"\n📁 Semua data berhasil disimpan ke {filename}")


if __name__ == "__main__":
    result = scrape_all_days()
    save_to_json(result)
