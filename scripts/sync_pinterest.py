#!/usr/bin/env python3
"""
Fetches the latest pins from https://www.pinterest.com/adevictorolu/feed.rss,
downloads the high-resolution media files into assets/portfolio/pinterest/,
applies the AVO Media Smart Caption & Categorization Engine, and writes
assets/data/pinterest_pins.json so every build has the latest Pinterest uploads and media.
"""

import html
import json
import os
import re
import urllib.request
import xml.etree.ElementTree as ET
from datetime import datetime

PINTEREST_USERNAME = "adevictorolu"
PINTEREST_URL = f"https://www.pinterest.com/{PINTEREST_USERNAME}/"
RSS_URL = f"https://www.pinterest.com/{PINTEREST_USERNAME}/feed.rss"
OUTPUT_JSON = "assets/data/pinterest_pins.json"
MEDIA_DIR = "assets/portfolio/pinterest"

# Curated visual metadata for known pins on @adevictorolu (keyed by image MD5 hash in URL)
CURATED_BY_HASH = {
    "f85ae3cd0bac09a68b8fed444d23594d": {
        "title": "Oil Resources — Energy & Logistics Banner",
        "category": "Corporate",
        "caption": "Web hero visual for an international fuel logistics, tank storage, and maritime energy firm.",
    },
    "dbae13d58abfa5a4ba8481d69149bbd7": {
        "title": "Bimps Delights — Event Catering Flyer",
        "category": "Corporate",
        "caption": "Vibrant culinary promotional flyer showcasing event catering, cakes, and small chops in Ibadan.",
    },
    "879cde61fbdb6690b3ce4b51d2065c6f": {
        "title": "Ascension Army — Brand Logotype",
        "category": "Branding",
        "caption": "Authoritative navy and gold winged wordmark identity designed for Ascension Army.",
    },
    "5b086e22008452d94b1a5c78d9e9090c": {
        "title": "Ascension Army — Winged Crest Emblem",
        "category": "Branding",
        "caption": "Symbolic 'A' monogram integrating golden wings, halo, and cross negative space.",
    },
    "41ffc42ff05e5fd67440c9dab7afb6ad": {
        "title": "Welcome to September — AVO Media",
        "category": "Event Flyers",
        "caption": "3D paper-plane typographic poster crafted for AVO Media's monthly creative series.",
    },
    "71a21dc80fc2959bbe999a932d5de882": {
        "title": "Archbishop Francis Wale Oke @ 70",
        "category": "Celebrations",
        "caption": "Monochrome editorial birthday tribute celebrating Archbishop Francis Wale Oke's 70th milestone.",
    },
    "7bcd6577a4c0d53cff45535427dfc588": {
        "title": "Ascension Army — Call for Support",
        "category": "Church & Ministry",
        "caption": "3D royal scroll partnership graphic structured for seamless ministry support.",
    },
    "71501b4f9044354df421b23885d998fd": {
        "title": "Atmosphere of Ascension — Parlor Worship",
        "category": "Church & Ministry",
        "caption": "Radiant gold and cobalt worship encounter poster featuring minister portraits.",
    },
    "b6ee2ce5c352fb93f603ea91f80ca270": {
        "title": "Fred Relics — Luxury Brand Mark",
        "category": "Branding",
        "caption": "Minimalist gold monogram icon and classic serif logotype for Fred Relics.",
    },
    "357d75b7fd6151db964b72bfdebf4125": {
        "title": "The Rebirth — Dominion University Carol Night",
        "category": "Church & Ministry",
        "caption": "Symbolic botanical emergence and custom cross typography for Dominion University Carol Night.",
    },
    "adc6a3de4aa4807347e62996e0d656ad": {
        "title": "Stand Out Campaign — Jenios Agency",
        "category": "Social Media",
        "caption": "Chess-king visual metaphor crafted for Jenios Agency's media management campaign.",
    },
    "b667462fc4f9c7cdbdaeb3185e3ffa53": {
        "title": "Cybersecurity Suite — Jenios Agency",
        "category": "Corporate",
        "caption": "3D metallic shield and lock composition for enterprise cybersecurity marketing.",
    },
    "a2b7415c424ba83ca1a88a7a5ba6aadb": {
        "title": "UI/UX Studio Showcase — Jenios Agency",
        "category": "Social Media",
        "caption": "Multi-device 3D mockup ad highlighting intuitive UI/UX product design.",
    },
    "1ed61016275cf6964c280719e59220bb": {
        "title": "Web & App Development — Jenios Agency",
        "category": "Corporate",
        "caption": "Frosted 3D code brackets visual promoting full-stack web and mobile development.",
    },
    "cbcdb6350e1af9d126f8b7f40ab67c52": {
        "title": "Fred Daniel — Convocation Portrait",
        "category": "Celebrations",
        "caption": "Prismatic convocation portrait celebrating Dominion University Software Engineering graduate Fred Daniel.",
    },
    "8da929030e54314cedd1e5bf29ca4753": {
        "title": "Avotek App — Official Launch Creative",
        "category": "Social Media",
        "caption": "Dual-phone fintech app showcase announcing instant wallet funding and bill payments.",
    },
    "baa61e902bf384c0f8baf2c7add5c52b": {
        "title": "Avotek Is Back — Fintech Campaign",
        "category": "Social Media",
        "caption": "High-energy product relaunch poster for Avotek's bill payment and e-pin platform.",
    },
    "e104cdfaab0ee5efbfc47fb440444e8d": {
        "title": "Nigeria @ 66 Independence Tribute",
        "category": "Social Media",
        "caption": "Rock-cave silhouette of Nigeria's map paired with emerald flag drapery and stadium backdrop.",
    },
    "8e4c7938c97b836083621d7c5a61079b": {
        "title": "Olits Enterprise — Beverage Distributors",
        "category": "Corporate",
        "caption": "Clean retail product display flyer for soft drinks, bottled water, and yogurt distribution.",
    },
    "671b006c124156776935f0b3028fd93f": {
        "title": "Eva Heavenly Collection & Store",
        "category": "Corporate",
        "caption": "Structured multi-grid retail flyer showcasing footwear, bags, and cosmetics in Festac Town.",
    },
    "61a8fb9e9d6a45fdeb2e4e6bd295bd62": {
        "title": "The Grinding Continues — AVO Media",
        "category": "Social Media",
        "caption": "3D character tug-of-war artwork spotlighting AVO Media's relentless creative delivery.",
    },
    "bfd5b028ff564e15baafab3416f9c20c": {
        "title": "Thank You Messi 2006–2026 (Gold Edition)",
        "category": "Social Media",
        "caption": "Warm stadium gold sports poster celebrating Lionel Messi's international legacy.",
    },
    "5c3acd202db078d4f0db576b4654bc19": {
        "title": "Thank You Messi 2006–2026 (Noir Edition)",
        "category": "Social Media",
        "caption": "High-contrast monochrome and Argentina blue tribute graphic honoring Lionel Messi.",
    },
}

FALLBACK_POOL = [
    ("Editorial Key Visual", "Social Media", "Bold typographic composition and high-contrast lighting crafted for instant feed authority."),
    ("Brand Campaign Artwork", "Corporate", "Strategic commercial layout designed to elevate brand perception and audience trust."),
    ("Visual Identity Showcase", "Branding", "Distilled mark and visual system built for clarity across digital and print platforms."),
    ("Event Spotlight Poster", "Event Flyers", "Dynamic promotional artwork structured for rapid mobile readability and engagement."),
    ("Ministry Encounter Graphic", "Church & Ministry", "Atmospheric key art combining expressive typography with balanced visual hierarchy."),
    ("Milestone Tribute Design", "Celebrations", "Commemorative portrait composition finished with refined color grading and custom type."),
]


def clean_text(raw: str) -> str:
    text = re.sub(r"<[^>]*>", " ", raw or "")
    text = html.unescape(text)
    text = re.sub(r"https?://\S+", "", text)
    text = re.sub(r"#\S+", "", text)
    text = re.sub(r"\s+", " ", text).strip()
    return text


def infer_category(text: str) -> str:
    lower = text.lower()
    if re.search(
        r"church|ministry|sermon|worship|sunday|pastor|apostolic|bible|revival|prayer|gospel|bishop|tarry|fellowship|carol",
        lower,
    ):
        return "Church & Ministry"
    if re.search(r"logo|brand|identity|monogram|wordmark|guideline|rebrand|emblem|crest", lower):
        return "Branding"
    if re.search(r"book|cover|ebook|author|publishing|novel|manual", lower):
        return "Book Covers"
    if re.search(
        r"birthday|anniversary|jubilee|wedding|celebration|congrat|tribute|milestone|convocation|graduation",
        lower,
    ):
        return "Celebrations"
    if re.search(
        r"corporate|business|menu|catering|food|kitchen|company|training|masterclass|academy|enterprise|logistics|store",
        lower,
    ):
        return "Corporate"
    if re.search(
        r"flyer|conference|summit|concert|event|party|ticket|welcome to|month|festival|crusade",
        lower,
    ):
        return "Event Flyers"
    return "Social Media"


def generate_smart_title(cleaned_title: str, cleaned_desc: str, category: str, index: int) -> str:
    candidate = cleaned_title if cleaned_title else cleaned_desc
    candidate = re.sub(
        r"^(pin by|uploaded by|saved by|image|photo|img_\d+|untitled).*$",
        "",
        candidate,
        flags=re.IGNORECASE,
    ).strip()

    if candidate:
        first_clause = re.split(r"[.!?•|\n–—-]", candidate)[0].strip()
        words = [w for w in first_clause.split() if w]
        if len(words) >= 2:
            clipped = " ".join(words[:6])
            return " ".join(
                w if (len(w) > 1 and w.isupper()) else w.capitalize()
                for w in clipped.split()
            )

    pool_title, _, _ = FALLBACK_POOL[index % len(FALLBACK_POOL)]
    return f"{pool_title} #{index + 1}"


def generate_smart_caption(title: str, cleaned_desc: str, category: str, index: int) -> str:
    if len(cleaned_desc) >= 18 and cleaned_desc.lower() != title.lower():
        first_sentence = re.split(r"(?<=[.!?])\s+", cleaned_desc)[0].strip()
        words = first_sentence.split()
        concise = " ".join(words[:16]) + "..." if len(words) > 16 else first_sentence
        if not concise.endswith((".", "!")):
            concise += "."
        return concise[0].upper() + concise[1:]

    captions = {
        "Church & Ministry": "Dignified ministry visual crafted with bold typographic hierarchy and atmospheric lighting.",
        "Branding": "Modern brand identity composition engineered for clarity across digital and print touchpoints.",
        "Book Covers": "Editorial publication cover designed for strong shelf presence and instant reader connection.",
        "Celebrations": "Bespoke commemorative portrait composition with refined color grading and custom lettering.",
        "Corporate": "Strategic commercial design structured to elevate brand credibility and drive action.",
        "Event Flyers": "High-impact promotional event visual balanced for rapid mobile readability and engagement.",
    }
    if category in captions and index % 2 == 0:
        return captions[category]
    return FALLBACK_POOL[index % len(FALLBACK_POOL)][2]


def extract_high_res_image(html_desc: str) -> str:
    match = re.search(r'src=["\'](https?://[^"\']+)["\']', html_desc or "", re.IGNORECASE)
    if not match:
        return ""
    url = match.group(1)
    url = re.sub(r"/(236x|474x|170x)/", "/736x/", url)
    return url


def extract_image_hash(image_url: str) -> str:
    match = re.search(r"/([a-f0-9]{32})\.\w+$", image_url)
    return match.group(1) if match else ""


def extract_year(pub_date: str) -> str:
    match = re.search(r"\b(202\d)\b", pub_date or "")
    return match.group(1) if match else str(datetime.utcnow().year)


def extract_pin_id(link: str, index: int) -> str:
    match = re.search(r"/pin/(\d+)", link or "")
    return match.group(1) if match else f"pin-{index}"


def download_media_file(image_url: str, img_hash: str, pin_id: str) -> str:
    os.makedirs(MEDIA_DIR, exist_ok=True)
    ext_match = re.search(r"\.(jpg|jpeg|png|webp)$", image_url, re.IGNORECASE)
    ext = ext_match.group(1).lower() if ext_match else "jpg"
    filename = f"{img_hash or pin_id}.{ext}"
    local_path = f"{MEDIA_DIR}/{filename}"

    if os.path.exists(local_path) and os.path.getsize(local_path) > 0:
        return local_path

    try:
        req = urllib.request.Request(
            image_url,
            headers={
                "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
            },
        )
        with urllib.request.urlopen(req, timeout=15) as resp:
            data = resp.read()
        if data:
            with open(local_path, "wb") as out_f:
                out_f.write(data)
            return local_path
    except Exception as exc:
        print(f"Warning: could not download media {image_url}: {exc}")

    return image_url


def main():
    req = urllib.request.Request(
        RSS_URL,
        headers={
            "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
            "Accept": "application/rss+xml, application/xml, text/xml, */*",
        },
    )

    pins = []
    seen_images = set()

    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            xml_bytes = resp.read()
        root = ET.fromstring(xml_bytes)
        items = root.findall("./channel/item")

        for idx, item in enumerate(items):
            raw_title = item.findtext("title") or ""
            raw_desc = item.findtext("description") or ""
            link = (item.findtext("link") or item.findtext("guid") or PINTEREST_URL).strip()
            pub_date = item.findtext("pubDate") or ""

            image_url = extract_high_res_image(raw_desc)
            if not image_url or image_url in seen_images:
                continue
            seen_images.add(image_url)

            img_hash = extract_image_hash(image_url)
            pin_id = extract_pin_id(link, idx)
            local_or_remote_path = download_media_file(image_url, img_hash, pin_id)

            cleaned_title = clean_text(raw_title)
            cleaned_desc = clean_text(raw_desc)

            if img_hash in CURATED_BY_HASH and not cleaned_title and not cleaned_desc:
                curated = CURATED_BY_HASH[img_hash]
                title = curated["title"]
                category = curated["category"]
                caption = curated["caption"]
            else:
                combined = f"{cleaned_title} {cleaned_desc}".strip()
                if combined:
                    category = infer_category(combined)
                else:
                    category = FALLBACK_POOL[idx % len(FALLBACK_POOL)][1]
                title = generate_smart_title(cleaned_title, cleaned_desc, category, idx)
                caption = generate_smart_caption(title, cleaned_desc, category, idx)

            year = extract_year(pub_date)

            pins.append(
                {
                    "id": f"pinterest-{pin_id}",
                    "title": title,
                    "category": category,
                    "imagePath": local_or_remote_path,
                    "caption": caption,
                    "client": "AVO Media • Pinterest",
                    "year": year,
                    "deliverables": ["High-Res Visual", "Digital & Print"],
                    "tools": ["Photoshop", "Illustrator"],
                    "isFeatured": len(pins) < 3,
                    "sourceUrl": link,
                    "isFromPinterest": True,
                }
            )
        print(f"Synced {len(pins)} unique Pinterest pins + media files from {RSS_URL}")
    except Exception as exc:
        print(f"Warning: Could not fetch live RSS ({exc}). Keeping existing {OUTPUT_JSON} if present.")
        if os.path.exists(OUTPUT_JSON):
            return

    os.makedirs(os.path.dirname(OUTPUT_JSON), exist_ok=True)
    with open(OUTPUT_JSON, "w", encoding="utf-8") as f:
        json.dump(pins, f, indent=2, ensure_ascii=False)


if __name__ == "__main__":
    main()
