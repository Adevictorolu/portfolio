# AVO Media — Visual Design & Brand Portfolio

[![Live Site](https://img.shields.io/badge/GitHub_Pages-Live-31ADE1?logo=github&logoColor=white)](https://adevictorolu.github.io/portfolio/)
[![Flutter Web](https://img.shields.io/badge/Flutter-Web-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Pinterest Sync](https://img.shields.io/badge/Pinterest-Auto_Synced-E60023?logo=pinterest&logoColor=white)](https://www.pinterest.com/adevictorolu/)
[![WhatsApp Routing](https://img.shields.io/badge/WhatsApp-Connected-25D366?logo=whatsapp&logoColor=white)](https://wa.me/2349114985251)

Minimalist, high-performance web portfolio for **Ademola Victor Oluokun (AVO Media)** — Graphic Designer & Visual Creative.

**Live URL:** [https://adevictorolu.github.io/portfolio/](https://adevictorolu.github.io/portfolio/)

---

## ✨ Key Features

- **Minimalist Figtree UI**: Built with **Figtree** typography across all headings, body copy, and interactive controls for a crisp, modern editorial look.
- **Automated Pinterest Tracking & Smart Captioning**:
  - Automatically tracks uploads to [@adevictorolu on Pinterest](https://www.pinterest.com/adevictorolu/) (`https://www.pinterest.com/adevictorolu/feed.rss`).
  - Live client-side sync in [`lib/services/pinterest_service.dart`](lib/services/pinterest_service.dart) + scheduled CI sync in [`scripts/sync_pinterest.py`](scripts/sync_pinterest.py) catch new Pinterest pins, upgrade images to `736x` high-resolution, categorize the work, and generate concise editorial captions.
- **Direct WhatsApp Conversion**: One-click project inquiries, pricing package selection, custom quote calculator (NGN/USD), and brief submission routed directly to WhatsApp (`+234 911 498 5251`).

---

## 🚀 GitHub Pages & CI/CD

- **Deploy Workflow** ([`.github/workflows/deploy.yml`](.github/workflows/deploy.yml)):
  - Runs on every push to `main`, manual dispatch, and scheduled every 2 hours to sync new Pinterest uploads.
  - Builds Flutter Web with `--base-href "/portfolio/"` and publishes to GitHub Pages.
- **Dart & Flutter CI** ([`.github/workflows/dart.yml`](.github/workflows/dart.yml)):
  - Verifies `flutter pub get`, `flutter analyze`, and `flutter test`.

---

## 💻 Local Development

```bash
# Sync latest Pinterest pins
python3 scripts/sync_pinterest.py

# Install dependencies & run
flutter pub get
flutter run -d chrome

# Analyze & test
flutter analyze
flutter test

# Production build for GitHub Pages
flutter build web --release --base-href "/portfolio/"
```

---

## 👤 Designer Profile

- **Designer**: Ademola Victor Oluokun (**AVO Media**)
- **Live Portfolio**: [https://adevictorolu.github.io/portfolio/](https://adevictorolu.github.io/portfolio/)
- **Pinterest**: [@adevictorolu](https://www.pinterest.com/adevictorolu/)
- **Instagram**: [@adevictorolu](https://www.instagram.com/adevictorolu) • [@avomedia0](https://www.instagram.com/avomedia0)
- **Behance**: [ademolavictor1](https://www.behance.net/ademolavictor1)
- **WhatsApp**: [+234 911 498 5251](https://wa.me/2349114985251)
