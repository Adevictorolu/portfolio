# AVO Media — Graphic Design & Visual Creative Portfolio

[![Flutter Web](https://img.shields.io/badge/Flutter-Web-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Vercel Ready](https://img.shields.io/badge/Vercel-Ready-000000?logo=vercel&logoColor=white)](https://vercel.com)
[![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub_Actions-2088FF?logo=github-actions&logoColor=white)](https://github.com)
[![WhatsApp Routing](https://img.shields.io/badge/WhatsApp-Connected-25D366?logo=whatsapp&logoColor=white)](https://wa.me/2349114985251)

Official high-performance web portfolio for **Ademola Victor Oluokun (AVO Media)** — Graphic Designer and Visual Creative serving clients across Nigeria and globally.

---

## 🎨 Visual Identity & Design System

- **Typography**: **Montserrat** across all headings, body text, buttons, and navigation (powered by Google Fonts).
- **Brand Colors**:
  - **Electric Azure**: `#31ADE1` (Primary Brand Mark & CTAs)
  - **Light Azure Glow**: `#5AC2ED` / `rgba(49, 173, 225, 0.23)`
  - **Obsidian Dark Mode**: `#070E17` (Deep Cyan Undertones)
  - **Gilded Accent**: `#F59E0B` (Star Ratings & Featured Badges)
  - **WhatsApp Green**: `#22C55E` (Instant Conversion Channels)

---

## 📲 Direct WhatsApp Conversion Engine

All inquiry forms, custom quote calculators, and project booking triggers across the site are directly connected to Ademola's official WhatsApp (`+234 911 498 5251`):

1. **Client Onboarding Form**: Automatically gathers Client Name, Phone, Email, Organization, Location, Project Type, Estimated Budget, Deadline, and Project Brief — compiling a structured message and opening WhatsApp instantly.
2. **Interactive Quote Calculator**: Computes dual-currency (NGN / USD) project estimates and transmits itemized scopes (complexity, quantity, rush turnaround, add-ons) directly to WhatsApp.
3. **Curated Showcase Inquiries**: Allows visitors to inquire about specific design projects with one click.

---

## 🚀 Deployment Guides

### Option 1: Deploy on Vercel (Recommended)

This repository includes a pre-configured [`vercel.json`](vercel.json) optimized for Flutter Web single-page applications (SPA) with automated asset caching.

#### Deploy via Vercel Dashboard:
1. Push this repository to your GitHub account.
2. Log in to [Vercel](https://vercel.com) and click **"Add New Project"**.
3. Import your GitHub repository.
4. Set **Output Directory** to `build/web`.
5. Under Build Settings:
   - If using Vercel CLI locally: run `flutter build web --release` before `vercel --prod`.
   - If deploying pre-built files: set build command to `echo "Using pre-built web"` or install Flutter in the Vercel build step.
6. Click **Deploy**!

#### Deploy via Vercel CLI:
```bash
# 1. Build the production bundle
flutter build web --release

# 2. Deploy directly to Vercel
vercel --prod
```

---

### Option 2: Deploy on GitHub Pages

This repository includes a ready-to-run GitHub Actions workflow at [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml).

1. Push your code to the `main` branch.
2. In your GitHub repository settings, navigate to **Settings > Pages**.
3. Under **Build and deployment > Source**, choose **GitHub Actions**.
4. The workflow will automatically test, build, and publish your portfolio!

---

## 💻 Local Development

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.35+ recommended)
- Google Chrome or Edge

### Running Locally
```bash
# Get dependencies
flutter pub get

# Run on Chrome
flutter run -d chrome

# Run tests
flutter test

# Code analysis
flutter analyze
```

### Production Build
```bash
flutter build web --release
```
The compiled, production-ready static site will be located in the `build/web` directory.

---

## 👤 Designer Profile

- **Designer**: Ademola Victor Oluokun
- **Brand**: AVO Media
- **WhatsApp**: [+234 911 498 5251](https://wa.me/2349114985251)
- **Email**: [avomedia0@gmail.com](mailto:avomedia0@gmail.com)
- **Instagram**: [@adevictorolu](https://www.instagram.com/adevictorolu) • [@avomedia0](https://www.instagram.com/avomedia0)
- **Behance**: [ademolavictor1](https://www.behance.net/ademolavictor1)
- **Pinterest**: [adevictorolu](https://www.pinterest.com/adevictorolu/)
