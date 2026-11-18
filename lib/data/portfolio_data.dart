import 'package:flutter/material.dart';
import '../models/project_item.dart';
import '../models/service_item.dart';
import '../models/package_item.dart';

class PortfolioData {
  static const String designerName = 'AVO Media';
  static const String brandName = 'AVO Media';
  static const String titleTagline = 'Visual Design Studio';
  static const String heroHeadline = 'Visuals Built for Impact.';
  static const String heroSubheadline =
      'Brand identity, event flyers, and digital campaigns crafted with clarity.';

  static const String whatsappNumber = '+234 911 498 5251';
  static const String whatsappRaw = '2349114985251';
  static const String email = 'avomedia0@gmail.com';
  static const String location = 'Abuja, Nigeria • Worldwide';

  static const String pinterestUsername = 'adevictorolu';
  static const String pinterestUrl = 'https://www.pinterest.com/adevictorolu/';
  static const String pinterestRssUrl = 'https://www.pinterest.com/adevictorolu/feed.rss';
  static const String instagramPersonalUrl = 'https://www.instagram.com/adevictorolu';
  static const String instagramBrandUrl = 'https://www.instagram.com/avomedia0';
  static const String behanceUrl = 'https://www.behance.net/ademolavictor1';

  static const int totalProjectsCompleted = 500;
  static const int satisfactionRate = 100;
  static const int averageTurnaroundHours = 48;

  // Official AVO Media Design & Editing Stack
  static const List<String> workStack = [
    'Photoshop',
    'Adobe Lightroom',
    'Canva',
    'PixelLab',
    'Photopea',
    'Affinity',
  ];

  // Curated Portfolio Projects
  static final List<ProjectItem> projects = [
    const ProjectItem(
      id: 'avomedia-brand-identity',
      title: 'AVO Media Brand Identity',
      category: 'Branding',
      imagePath: 'assets/logo/avomedia_logo.png',
      caption: 'Fluid geometric monogram and visual identity engineered for digital and print scale.',
      client: 'AVO Media',
      year: '2025',
      deliverables: ['Brand Mark', 'Brand Guidelines', 'Social Suite'],
      tools: ['Photoshop', 'Affinity'],
      isFeatured: true,
    ),
    const ProjectItem(
      id: 'corridors-of-favour',
      title: 'The Corridors of Favour',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/behance/church_service_flyer.jpg',
      caption: 'Radiant golden editorial poster crafted for Apostolic Assembly Sunday service.',
      client: 'Apostolic Assembly',
      year: '2025',
      deliverables: ['Print Poster', 'Social Feed 1:1', 'Status Graphic'],
      tools: ['Photoshop', 'Adobe Lightroom'],
      isFeatured: true,
    ),
    const ProjectItem(
      id: 'tech-innovative-conference',
      title: 'AVOTEK Tech Conference 2025',
      category: 'Event Flyers',
      imagePath: 'assets/portfolio/behance/tech_conference_flyer.jpg',
      caption: 'Futuristic keynote visual system for a multi-speaker global technology summit.',
      client: 'AVOTEK Summit',
      year: '2025',
      deliverables: ['Keynote Poster', 'Speaker Cards', 'Stream Overlay'],
      tools: ['Photoshop', 'Affinity'],
      isFeatured: true,
    ),
    const ProjectItem(
      id: 'conversion-to-maturity-book',
      title: 'From Conversion to Maturity',
      category: 'Book Covers',
      imagePath: 'assets/portfolio/behance/book_cover_design.jpg',
      caption: 'Full-wrap editorial book cover and photorealistic hardcover presentation.',
      client: 'Discipleship Publishing',
      year: '2025',
      deliverables: ['Hardcover Mockup', 'Print Wrap', 'E-Book Cover'],
      tools: ['Photoshop', 'Adobe Lightroom'],
      isFeatured: true,
    ),
    const ProjectItem(
      id: 'archbishop-wale-oke-70th',
      title: 'Archbishop Wale Oke @ 70',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/instagram/ig_agency_10.webp',
      caption: 'Regal diamond jubilee commemorative artwork honoring seven decades of impact.',
      client: 'Sword of the Spirit Ministries',
      year: '2024',
      deliverables: ['Jubilee Poster', 'Stage Backdrop', 'Social Banner'],
      tools: ['Photoshop', 'Adobe Lightroom'],
      isFeatured: true,
    ),
    const ProjectItem(
      id: 'thank-you-messi-tribute',
      title: 'Messi 2006–2026 Career Tribute',
      category: 'Social Media',
      imagePath: 'assets/portfolio/instagram/ig_agency_1.webp',
      caption: 'High-contrast sports editorial artwork celebrating an iconic international legacy.',
      client: 'Sports Editorial',
      year: '2025',
      deliverables: ['Editorial Poster', 'Instagram 1:1', 'Mobile Wallpaper'],
      tools: ['Photoshop', 'Adobe Lightroom'],
      isFeatured: true,
    ),
    const ProjectItem(
      id: 'every-bite-delicious-catering',
      title: "D'mumsys Gourmet Kitchen",
      category: 'Corporate',
      imagePath: 'assets/portfolio/behance/food_flyer_design.jpg',
      caption: 'Warm, appetite-driven commercial menu design tailored for instant food orders.',
      client: "D'mumsys Kitchen",
      year: '2025',
      deliverables: ['Print Menu Flyer', 'Ad Creative', 'WhatsApp Promo'],
      tools: ['Photoshop', 'Canva'],
      isFeatured: true,
    ),
    const ProjectItem(
      id: 'mercy-chinwo-birthday',
      title: 'Mercy Chinwo Celebration',
      category: 'Celebrations',
      imagePath: 'assets/portfolio/instagram/ig_agency_11.webp',
      caption: 'Botanical studio portrait composition crafted with vibrant emerald and gold tones.',
      client: 'Gospel Broadcast Network',
      year: '2024',
      deliverables: ['Tribute Poster', 'Social Square'],
      tools: ['Photoshop', 'Adobe Lightroom'],
      isFeatured: true,
    ),
    const ProjectItem(
      id: 'smarter-life-iphone-showcase',
      title: 'iPhone 15 Pro Max Showcase',
      category: 'Social Media',
      imagePath: 'assets/portfolio/behance/product_showcase_flyer.jpg',
      caption: 'Sleek product advertisement highlighting flagship hardware and glass depth.',
      client: 'Tech Retail Campaign',
      year: '2025',
      deliverables: ['E-Commerce Banner', 'Social Ad'],
      tools: ['Photoshop', 'Photopea'],
      isFeatured: true,
    ),
    const ProjectItem(
      id: 'bishop-oyedepo-72nd',
      title: 'Bishop David Oyedepo @ 72',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/instagram/ig_agency_5.webp',
      caption: 'Warm crimson and amber milestone tribute with structured typographic hierarchy.',
      client: 'Kingdom Impact Broadcast',
      year: '2024',
      deliverables: ['Print Poster', 'Broadcast Slide'],
      tools: ['Photoshop', 'Adobe Lightroom'],
    ),
    const ProjectItem(
      id: 'agbi-emmanuel-birthday',
      title: 'Agbi Emmanuel Creative Tribute',
      category: 'Celebrations',
      imagePath: 'assets/portfolio/instagram/ig_agency_6.webp',
      caption: 'Electric studio lighting and metallic typography celebrating a creative leader.',
      client: 'Kingdom Creative Network',
      year: '2024',
      deliverables: ['Birthday Poster', 'Social Feed'],
      tools: ['Photoshop', 'Adobe Lightroom'],
    ),
    const ProjectItem(
      id: 'capacity-tarry-night',
      title: 'CAPACITY Tarry Night',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/instagram/ig_personal_6.webp',
      caption: 'Textured grain poster with bold minimal typography for a live prayer encounter.',
      client: 'Holy Ghost Encounter',
      year: '2025',
      deliverables: ['Event Flyer', 'Telegram Banner'],
      tools: ['Photoshop', 'PixelLab'],
    ),
    const ProjectItem(
      id: 'summit-kabusa-couples-meeting',
      title: 'One Flesh — Couples Seminar',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/instagram/ig_agency_4.webp',
      caption: 'Vibrant marriage seminar campaign featuring custom accents and clear event routing.',
      client: 'Summit Bible Church',
      year: '2024',
      deliverables: ['Event Poster', 'Social Square'],
      tools: ['Photoshop', 'Canva'],
    ),
    const ProjectItem(
      id: 'transition-to-photoshop',
      title: 'Transition to Photoshop 1.0',
      category: 'Corporate',
      imagePath: 'assets/portfolio/instagram/ig_agency_9.webp',
      caption: 'Structured masterclass launch graphic designed for high student conversion.',
      client: 'AVO Media Academy',
      year: '2024',
      deliverables: ['Launch Poster', 'Syllabus Card'],
      tools: ['Photoshop', 'PixelLab'],
    ),
    const ProjectItem(
      id: 'the-grinding-continues',
      title: 'The Grinding Continues Campaign',
      category: 'Social Media',
      imagePath: 'assets/portfolio/instagram/ig_agency_2.webp',
      caption: 'Character campaign spotlighting creative consistency and rapid client booking.',
      client: 'AVO Media',
      year: '2024',
      deliverables: ['Campaign Graphic', 'Status Promo'],
      tools: ['Photoshop', 'Affinity'],
    ),
    const ProjectItem(
      id: 'independence-day-nigeria',
      title: 'Nigeria @ 64 Unity Poster',
      category: 'Social Media',
      imagePath: 'assets/portfolio/instagram/ig_agency_3.webp',
      caption: 'Architectural map silhouette and emerald silk composition celebrating national unity.',
      client: 'AVO Media Series',
      year: '2024',
      deliverables: ['Holiday Poster', 'Social Graphic'],
      tools: ['Photoshop', 'Adobe Lightroom'],
    ),
    const ProjectItem(
      id: 'welcome-to-may-typography',
      title: 'Welcome to May — Custom Type',
      category: 'Event Flyers',
      imagePath: 'assets/portfolio/behance/new_month_flyer_1.jpg',
      caption: 'Bespoke tribal letterforms paired with a clean monthly calendar layout.',
      client: 'AVO Media Series',
      year: '2025',
      deliverables: ['Calendar Artwork', 'Wallpaper'],
      tools: ['Photoshop', 'Affinity'],
    ),
    const ProjectItem(
      id: 'welcome-to-april-grace',
      title: 'Welcome to April — Seasonal Art',
      category: 'Event Flyers',
      imagePath: 'assets/portfolio/behance/new_month_flyer_2.jpg',
      caption: 'Minimalist light composition anchored by textured geometric typography.',
      client: 'AVO Media Series',
      year: '2025',
      deliverables: ['Monthly Card', 'Story Format'],
      tools: ['Photoshop', 'Photopea'],
    ),
    const ProjectItem(
      id: 'portfolio-420-retrospective',
      title: '420+ Designs Retrospective',
      category: 'Branding',
      imagePath: 'assets/portfolio/instagram/ig_personal_5.webp',
      caption: 'Curated visual archive showcasing over 420 delivered brand and event campaigns.',
      client: 'AVO Media',
      year: '2025',
      deliverables: ['Archive Mosaic', 'Brand Asset'],
      tools: ['Photoshop', 'Canva'],
    ),
    const ProjectItem(
      id: 'nathaniel-bassey-psd-production',
      title: 'Nathaniel Bassey Studio Tribute',
      category: 'Celebrations',
      imagePath: 'assets/portfolio/instagram/ig_agency_8.jpg',
      caption: 'Master composite artwork showcasing precision lighting and layered typography.',
      client: 'Gospel Music Tribute',
      year: '2024',
      deliverables: ['Master PSD', 'Print Poster'],
      tools: ['Photoshop', 'Adobe Lightroom'],
    ),
    const ProjectItem(
      id: 'ascension-army-partner-campaign',
      title: 'Ascension Army Support Campaign',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/design_2.jpg',
      caption: 'High-clarity mission partner graphic designed for frictionless mobile giving.',
      client: 'Ascension Army',
      year: '2024',
      deliverables: ['Campaign Flyer', 'Screen Slide'],
      tools: ['Photoshop', 'Affinity'],
    ),
    const ProjectItem(
      id: 'sosmi-global-summit',
      title: 'SOSMI Global Online Summit',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/design_9.jpg',
      caption: 'International broadcast visual balanced for multi-timezone digital audiences.',
      client: 'SOSMI Worldwide',
      year: '2024',
      deliverables: ['Livestream Flyer', 'YouTube Thumbnail'],
      tools: ['Photoshop', 'Adobe Lightroom'],
    ),
  ];

  // Minimalist Services List
  static final List<ServiceItem> services = [
    const ServiceItem(
      id: 'brand-identity',
      title: 'Brand Identity',
      description: 'Logos, color systems, and guidelines built for lasting authority.',
      iconData: Icons.auto_awesome_outlined,
      deliverables: ['Logo Suite', 'Style Guide', 'Brand Mockups'],
      startingNgn: 100000,
      startingUsd: 300,
      turnaround: '5–10 Days',
    ),
    const ServiceItem(
      id: 'church-ministry',
      title: 'Church & Ministry',
      description: 'Dignified sermon series, conference posters, and broadcast visuals.',
      iconData: Icons.church_outlined,
      deliverables: ['Print Poster', 'Social Feed & Story', 'Stage Screen Slide'],
      startingNgn: 15000,
      startingUsd: 50,
      turnaround: '24–48h',
    ),
    const ServiceItem(
      id: 'event-flyers',
      title: 'Event Flyers',
      description: 'High-converting promotional flyers for conferences, concerts, and summits.',
      iconData: Icons.confirmation_number_outlined,
      deliverables: ['Print-Ready Flyer', 'Social Formats', 'WhatsApp Broadcast'],
      startingNgn: 15000,
      startingUsd: 45,
      turnaround: '24–48h',
    ),
    const ServiceItem(
      id: 'business-corporate',
      title: 'Corporate Graphics',
      description: 'Clean commercial flyers, brochures, and pitch visuals for growing brands.',
      iconData: Icons.business_center_outlined,
      deliverables: ['Corporate Flyer', 'Roll-up Banner', 'Print PDF'],
      startingNgn: 20000,
      startingUsd: 60,
      turnaround: '2–4 Days',
    ),
    const ServiceItem(
      id: 'social-media',
      title: 'Social Media & Ads',
      description: 'Scroll-stopping ad creatives and carousels engineered for engagement.',
      iconData: Icons.campaign_outlined,
      deliverables: ['Feed & Story Sizes', 'Carousel Layouts', 'Ad Creatives'],
      startingNgn: 10000,
      startingUsd: 35,
      turnaround: '24–48h',
    ),
    const ServiceItem(
      id: 'book-editorial',
      title: 'Book Covers',
      description: 'Print and Kindle covers with presentation mockups.',
      iconData: Icons.menu_book_outlined,
      deliverables: ['Full Wrap Cover', 'Kindle E-Book', 'Book Mockup'],
      startingNgn: 25000,
      startingUsd: 75,
      turnaround: '3–5 Days',
    ),
  ];

  // Minimalist Commercial Packages
  static final List<PackageItem> packages = [
    const PackageItem(
      id: 'starter',
      name: 'Single Flyer',
      targetAudience: 'Quick Campaigns',
      description: 'One high-impact flyer formatted for print and social feeds.',
      priceNgn: 15000,
      priceUsd: 45,
      features: [
        '1 Custom Master Design',
        'Feed (1:1) & Story (9:16)',
        '300 DPI Print-Ready File',
        '48-Hour Delivery',
      ],
    ),
    const PackageItem(
      id: 'business-growth',
      name: 'Campaign Pack',
      badge: 'Popular',
      isPopular: true,
      targetAudience: 'Events & Launches',
      description: 'Complete visual kit for events, conferences, or product launches.',
      priceNgn: 60000,
      priceUsd: 180,
      features: [
        '3 Coordinated Designs',
        'Banner or Stage Screen Size',
        'Social & WhatsApp Formats',
        'Priority 24–48h Delivery',
      ],
    ),
    const PackageItem(
      id: 'ministry-retainer',
      name: 'Monthly Retainer',
      badge: 'Best Value',
      targetAudience: 'Churches & Brands',
      description: 'Ongoing weekly visuals with dedicated priority turnaround.',
      priceNgn: 120000,
      priceUsd: 320,
      features: [
        'Up to 8 Designs / Month',
        'Weekly Service & Promo Art',
        'LED Screen Adaptations',
        '24-Hour VIP Turnaround',
      ],
    ),
    const PackageItem(
      id: 'brand-identity-pack',
      name: 'Brand Identity',
      targetAudience: 'New & Rebranding',
      description: 'Complete logo system, typography, color palette, and brand guide.',
      priceNgn: 250000,
      priceUsd: 550,
      features: [
        'Primary & Secondary Logos',
        'High-Res Source Files',
        'Brand Style Guideline',
        'Stationery & Social Kit',
      ],
    ),
  ];

  static String formatCurrency(int amount, bool isNgn) {
    if (isNgn) {
      final str = amount.toString();
      final buffer = StringBuffer();
      int count = 0;
      for (int i = str.length - 1; i >= 0; i--) {
        buffer.write(str[i]);
        count++;
        if (count % 3 == 0 && i != 0) {
          buffer.write(',');
        }
      }
      return '₦${buffer.toString().split('').reversed.join('')}';
    } else {
      return '\$$amount';
    }
  }

  static String buildWhatsAppUrl({
    String? service,
    String? projectTitle,
    String? budget,
    String? deadline,
    String? clientName,
    String? notes,
  }) {
    final buffer = StringBuffer('Hello AVO Media, I’d like to start a design project.\n\n');
    if (clientName != null && clientName.isNotEmpty) {
      buffer.write('• Name: $clientName\n');
    }
    if (service != null && service.isNotEmpty) {
      buffer.write('• Service: $service\n');
    }
    if (projectTitle != null && projectTitle.isNotEmpty) {
      buffer.write('• Reference: $projectTitle\n');
    }
    if (budget != null && budget.isNotEmpty) {
      buffer.write('• Budget: $budget\n');
    }
    if (deadline != null && deadline.isNotEmpty) {
      buffer.write('• Timeline: $deadline\n');
    }
    if (notes != null && notes.isNotEmpty) {
      buffer.write('• Brief: $notes\n');
    }
    final encoded = Uri.encodeComponent(buffer.toString().trim());
    return 'https://wa.me/$whatsappRaw?text=$encoded';
  }
}
