import 'package:flutter/material.dart';
import '../models/project_item.dart';
import '../models/service_item.dart';
import '../models/package_item.dart';

class PortfolioData {
  static const String designerName = 'Ademola Victor Oluokun';
  static const String brandName = 'AVO Media';
  static const String titleTagline = 'Graphic Designer & Visual Creative';
  static const String heroHeadline = 'I Design Visuals That Make Brands Impossible to Ignore.';
  static const String heroSubheadline =
      'Helping businesses, churches, organizations, and creators communicate with authority. '
      'From high-impact event flyers and brand identity to social media campaigns, '
      'I craft visuals that command attention and drive real results.';

  static const String whatsappNumber = '+234 911 498 5251';
  static const String whatsappRaw = '2349114985251';
  static const String email = 'avomedia0@gmail.com';
  static const String location = 'Abuja & Nationwide Nigeria • Serving Global Clients';

  static const String pinterestUrl = 'https://www.pinterest.com/adevictorolu/';
  static const String instagramPersonalUrl = 'https://www.instagram.com/adevictorolu';
  static const String instagramBrandUrl = 'https://www.instagram.com/avomedia0';
  static const String behanceUrl = 'https://www.behance.net/ademolavictor1';

  static const int totalProjectsCompleted = 500;
  static const int satisfactionRate = 100;
  static const int averageTurnaroundHours = 48;

  // Curated Portfolio Projects
  static final List<ProjectItem> projects = [
    // 1. Featured Branding
    const ProjectItem(
      id: 'fred-relics',
      title: 'Fred Relics Luxury Identity & Monogram',
      category: 'Branding',
      imagePath: 'assets/portfolio/design_1.jpg',
      client: 'Fred Relics Luxury Goods',
      year: '2024',
      objective: 'Develop an opulent, timeless brand monogram and visual mark for a bespoke luxury leather and fashion label.',
      creativeDirection: 'Deep obsidian black background paired with burnished metallic gold. Intricate interlaced serif monogram with high-contrast prestige styling.',
      designApproach: 'Engineered an iconic emblem with precision geometry. Balanced classical typographic proportions with modern editorial simplicity.',
      deliverables: ['Primary Vector Monogram', 'Color Palette Guide', 'Embossing Specifications', 'Packaging Mockups'],
      tools: ['Adobe Photoshop', 'Adobe Illustrator'],
      isFeatured: true,
    ),

    // 2. Featured Event Flyer (USA)
    const ProjectItem(
      id: 'ijebu-boat-cruise-1',
      title: 'Ijebu Indigenes DFW Boat Cruise 2026 — Dallas, TX',
      category: 'Event Flyers',
      imagePath: 'assets/portfolio/design_6.jpg',
      client: 'Ijebu Indigenes Association (DFW Chapter, USA)',
      year: '2024',
      objective: 'Create a high-energy, prestigious promotional poster for an international summer yacht gala on Lake Ray Hubbard, Texas.',
      creativeDirection: 'Deep maritime navy with radiant sunlight highlights and gold foil typography. Cinematic 3D luxury yacht focal point with crystal-clear event hierarchy.',
      designApproach: 'Layered atmospheric ocean lighting with sharp metallic typography. Organized date, boarding details, and ticket tiers for instant legibility on mobile feeds.',
      deliverables: ['High-Res Print Poster (18x24)', 'Instagram Feed Square (1:1)', 'Instagram Story (9:16)', 'Digital VIP Ticket Pass'],
      tools: ['Adobe Photoshop', 'Canva'],
      isFeatured: true,
    ),

    // 3. Featured Event Flyer (USA VIP Edition)
    const ProjectItem(
      id: 'ijebu-boat-cruise-2',
      title: 'Summer Yacht Cruise — Lake Ray Hubbard VIP Suite',
      category: 'Event Flyers',
      imagePath: 'assets/portfolio/design_7.jpg',
      client: 'DFW Cultural Gala Committee (Texas, USA)',
      year: '2024',
      objective: 'Design a companion VIP campaign flyer focusing on ticket reservations, table packages, and entertainment lineup.',
      creativeDirection: 'Warm twilight lighting, glowing water reflections, and celebratory gold ribbons that establish exclusivity.',
      designApproach: 'Utilized contrasting color blocks to separate VIP table pricing, DJ roster, and dress-code requirements.',
      deliverables: ['Event Banner', 'WhatsApp Broadcast Flyer', 'Social Media Carousel'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 4. Featured Celebration
    const ProjectItem(
      id: 'mercy-chinwo-birthday',
      title: 'Minister Mercy Chinwo Birthday Celebration',
      category: 'Celebrations',
      imagePath: 'assets/portfolio/design_3.jpg',
      client: 'Gospel Broadcast Network',
      year: '2024',
      objective: 'Design an inspiring, angelic tribute flyer celebrating gospel icon Minister Mercy Chinwo.',
      creativeDirection: 'Soft royal amber and champagne backlight, subtle lens flares, and bespoke script typography.',
      designApproach: 'Seamless subject extraction with precise hair and skin retouching. Balanced reverence with festive energy.',
      deliverables: ['Celebrity Tribute Flyer', 'Instagram 1:1 Graphic', 'WhatsApp Story Banner'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 5. Featured Church & Ministry
    const ProjectItem(
      id: 'archbishop-wale-oke',
      title: 'Archbishop Francis Wale Oke 70th Diamond Jubilee',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/design_4.jpg',
      client: 'The Sword of the Spirit Ministries',
      year: '2024',
      objective: 'Commemorate a historic 70th milestone jubilee with an authoritative, dignified apostolic celebration design.',
      creativeDirection: 'Regal burgundy and antique gold embellishments, stately classical typography, radiant spiritual illumination.',
      designApproach: 'Framed the Archbishop’s portrait with baroque architectural depth. Established clear hierarchy between jubilee theme and dates.',
      deliverables: ['Commemorative Print Poster', 'Church Service Screen Graphics', 'Social Media Broadcast Kit'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 6. Featured Church & Ministry Campaign
    const ProjectItem(
      id: 'ascension-army',
      title: 'Ascension Army — Strategic Kingdom Support Campaign',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/design_2.jpg',
      client: 'Ascension Army International',
      year: '2024',
      objective: 'Create an urgent, faith-inspiring visual campaign to mobilize kingdom partners and missions giving.',
      creativeDirection: 'Dynamic cobalt blue tones, high-impact bold typography, and clear financial giving channel integration.',
      designApproach: 'Structured account credentials and giving channels into clean visual modules for fast mobile transaction completion.',
      deliverables: ['Missions Campaign Flyer', 'WhatsApp Status Graphics', 'Church Screen Slide'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 7. Featured Church Online Meeting
    const ProjectItem(
      id: 'sosmi-online-meeting',
      title: 'SOSMI 2024 Global Online Ministry Summit',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/design_9.jpg',
      client: 'SOSMI Ministries Worldwide',
      year: '2024',
      objective: 'Promote an international virtual ministry summit across Zoom and YouTube livestream platforms.',
      creativeDirection: 'Deep cosmic indigo gradient, geometric network lines, prominent broadcast badge and multi-timezone breakdown.',
      designApproach: 'Positioned speakers with equal visual weight while highlighting theme title with high-contrast glowing letters.',
      deliverables: ['Digital Livestream Flyer', 'YouTube Thumbnail', 'Social Media Promo Kit'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 8. Featured Corporate Campaign
    const ProjectItem(
      id: 'fine-paintings-architects',
      title: 'Fine Architects & Painting 4-Piece Corporate Campaign',
      category: 'Corporate',
      imagePath: 'assets/portfolio/design_5.jpg',
      client: 'Fine Contemporary Architecture & Coatings',
      year: '2024',
      objective: 'Showcase luxury architectural finishes, exterior paint endurance, and residential craftsmanship.',
      creativeDirection: 'Clean architectural grid, vibrant swatch overlays, modern Swiss-style typography, high-contrast imagery.',
      designApproach: 'Harmonized 4 distinct project photos into a cohesive multi-panel composition demonstrating range and quality.',
      deliverables: ['4-Piece Campaign Carousel', 'Company Brochure Cover', 'Social Media Ad Suite'],
      tools: ['Adobe Photoshop', 'Canva'],
      isFeatured: true,
    ),

    // 9. Featured Academic Celebration
    const ProjectItem(
      id: 'aanu-lasu-graduate',
      title: 'Aanu LASU Graduate Celebration & Thanksgiving',
      category: 'Celebrations',
      imagePath: 'assets/portfolio/work_11.jpg',
      client: 'Private Academic Celebration',
      year: '2024',
      objective: 'Design a joyful, distinguished graduation poster celebrating academic excellence at Lagos State University.',
      creativeDirection: 'Vibrant golden yellow and royal violet accents, dynamic celebratory particles, and clean portrait extraction.',
      designApproach: 'Highlighted degree honors with bold typography while keeping the graduate’s smile front and center.',
      deliverables: ['Commemorative Print Poster', 'Social Media Square', 'WhatsApp DP Flyer'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 10. Featured Apostolic Elevation
    const ProjectItem(
      id: 'apostle-aledare',
      title: 'Apostle Johnson Aledare — Apostolic Elevation Service',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/work_12.jpg',
      client: 'Grace Apostolic Center',
      year: '2024',
      objective: 'Promote a special apostolic milestone and spiritual impartation weekend.',
      creativeDirection: 'Deep purple and burnished gold atmospheric lighting, structured program details, dignified typography.',
      designApproach: 'Integrated church seal and date details with high-contrast text layout for effortless reading on phone screens.',
      deliverables: ['Service Program Flyer', 'Event Backdrop Design', 'Social Media Square'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 11. Featured Book Cover Mockup
    const ProjectItem(
      id: 'six-behind-six-ahead',
      title: 'Six Behind, Six Ahead — Mid-Year Reflection Editorial',
      category: 'Book Covers',
      imagePath: 'assets/portfolio/design_10.jpg',
      client: 'Inspirational Publishing House',
      year: '2024',
      objective: 'Design an editorial mid-year retrospective book cover and 3D promotional presentation mockup.',
      creativeDirection: 'Minimalist two-tone division, bold dual-tone typography, realistic 3D book mockup perspective.',
      designApproach: 'Used negative space and contrasting color planes to symbolize the pivot between past and future.',
      deliverables: ['Paperback Book Cover', 'Kindle E-Book Cover', '3D Promo Presentation Mockup'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 12. Featured Event Fellowship
    const ProjectItem(
      id: 'faith-and-fun',
      title: 'Faith & Fun Community Gathering — Agodi Gardens',
      category: 'Event Flyers',
      imagePath: 'assets/portfolio/work_14.jpg',
      client: 'Youth & Young Adults Fellowship',
      year: '2024',
      objective: 'Create an inviting, energetic outdoor community flyer for an afternoon picnic and games fellowship.',
      creativeDirection: 'Fresh botanical green and sunshine gold, playful badge typography, clean event itinerary icons.',
      designApproach: 'Balanced energetic outdoor photography with clear schedule icons for games, music, and food.',
      deliverables: ['Social Media Poster', 'WhatsApp Broadcast Flyer', 'Activity Schedule Card'],
      tools: ['Adobe Photoshop', 'Canva'],
      isFeatured: true,
    ),

    // Supporting Projects across categories
    const ProjectItem(
      id: 'apostle-orokpo-ministry',
      title: 'Apostolic Encounter Ministry Flyer',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/work_8.jpg',
      client: 'Kingdom Revival Ministries',
      year: '2024',
      objective: 'Design an intense, revival-themed service flyer with dynamic spiritual atmosphere.',
      creativeDirection: 'Golden fiery embers, deep blue cosmic backdrop, bold sans-serif lettering.',
      designApproach: 'Layered portrait blend with fiery ambient glow.',
      deliverables: ['Event Flyer', 'Screen Projection Slide'],
      tools: ['Adobe Photoshop'],
    ),

    const ProjectItem(
      id: 'tech-noir-poster',
      title: 'Tech Noir Nightclub Event Poster',
      category: 'Event Flyers',
      imagePath: 'assets/portfolio/work_49.png',
      client: 'Twisted Pepper Dublin / Nightclub Event',
      year: '2024',
      objective: 'Craft a cyber-retro electronic music night poster inspired by 80s synthwave aesthetics.',
      creativeDirection: 'Neon magenta and cyan duotone lighting, distressed film grain, vintage typography.',
      designApproach: 'High-contrast silhouette treatment with stylized typography.',
      deliverables: ['A3 Nightclub Poster', 'Story Promo'],
      tools: ['Adobe Photoshop'],
    ),

    const ProjectItem(
      id: 'timia-footcraft',
      title: 'Timia Footcraft Complete Brand Suite & Packaging',
      category: 'Branding',
      imagePath: 'assets/logo/banner_orig.jpg',
      client: 'Timia Footcraft Luxury Shoes',
      year: '2024',
      objective: 'Design an executive brand identity and luxury shoebox packaging system for artisanal footwear.',
      creativeDirection: 'Earthy luxury tones, minimalist emblem, sophisticated typography.',
      designApproach: 'Engineered cohesive brand marks applied across packaging, tags, and digital identity.',
      deliverables: ['Brand Identity Guide', 'Shoebox Packaging Mockup', 'Embossed Leather Tag Design'],
      tools: ['Adobe Photoshop', 'Illustrator'],
    ),

    const ProjectItem(
      id: 'sure-ride-mobility',
      title: 'Sure Ride Mobility Transport Brand Identity',
      category: 'Corporate',
      imagePath: 'assets/portfolio/work_10.jpg',
      client: 'Sure Ride Mobility Services',
      year: '2024',
      objective: 'Create modern, trustworthy corporate branding for a premium urban transport fleet.',
      creativeDirection: 'Vibrant cobalt blue with silver accents, dynamic forward-slant typography.',
      designApproach: 'Emphasized velocity, reliability, and security.',
      deliverables: ['Corporate Stationery', 'Fleet Decal Preview', 'Digital Promo Flyer'],
      tools: ['Adobe Photoshop'],
    ),

    const ProjectItem(
      id: 'fimol-homes-realty',
      title: 'Fimol Homes & Properties Real Estate Promo',
      category: 'Corporate',
      imagePath: 'assets/portfolio/work_15.jpg',
      client: 'Fimol Homes & Properties Ltd',
      year: '2024',
      objective: 'Design high-converting luxury property acquisition flyers for prime land and duplex estates.',
      creativeDirection: 'Clean real estate architectural grid with gold badges and property feature highlights.',
      designApproach: 'Structured payment plan tiers and location advantages for high-net-worth investors.',
      deliverables: ['Real Estate Flyer', 'WhatsApp Catalog Post'],
      tools: ['Adobe Photoshop'],
    ),

    const ProjectItem(
      id: 'summit-kabusa-church',
      title: 'Christ The Healer — Summit Kabusa Abuja',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/work_16.jpg',
      client: 'Summit Bible Church Kabusa (Pastor Andy Osakwe)',
      year: '2024',
      objective: 'Create a faith-building healing summit announcement flyer for the Abuja community.',
      creativeDirection: 'Bright heavenly blue and radiant gold lighting with uplifting typography.',
      designApproach: 'Communicated warmth, hope, and clear venue directions.',
      deliverables: ['Church Banner', 'Handout Flyer', 'Social Media Visuals'],
      tools: ['Adobe Photoshop'],
    ),

    const ProjectItem(
      id: 'social-media-promo-pack',
      title: 'Commercial Business Social Media Ad Suite',
      category: 'Social Media',
      imagePath: 'assets/portfolio/work_17.jpg',
      client: 'E-Commerce & Retail Brands',
      year: '2024',
      objective: 'Produce conversion-focused Instagram and Facebook feed creatives for commercial promotions.',
      creativeDirection: 'High visual contrast, scroll-stopping headline hooks, bold call-to-action badges.',
      designApproach: 'Engineered for instant thumb-stopping impact on mobile feeds.',
      deliverables: ['Instagram Feed (1:1)', 'Story Promo (9:16)'],
      tools: ['Adobe Photoshop', 'Canva'],
    ),

    const ProjectItem(
      id: 'birthday-glamour-tribute',
      title: 'Royalty & Grace Birthday Tribute Poster',
      category: 'Celebrations',
      imagePath: 'assets/portfolio/work_18.jpg',
      client: 'Private Celebration Client',
      year: '2024',
      objective: 'Create a glamorous, customized birthday tribute portrait design with opulent golden borders.',
      creativeDirection: 'Champagne gold accents, delicate cursive titles, and soft studio lighting.',
      designApproach: 'Delivered an elegant celebration visual suitable for framed printing and social media DP.',
      deliverables: ['High-Res Wall Print', 'Social Media DP'],
      tools: ['Adobe Photoshop'],
    ),

    const ProjectItem(
      id: 'corporate-product-launch',
      title: 'Executive Product Launch Announcement',
      category: 'Corporate',
      imagePath: 'assets/portfolio/work_19.jpg',
      client: 'Corporate Enterprise Client',
      year: '2024',
      objective: 'Design a sleek corporate announcement flyer for new enterprise software and service rollout.',
      creativeDirection: 'Deep navy, electric blue lines, modern sans-serif typography with corporate clarity.',
      designApproach: 'Structured key features with intuitive icon bullet points.',
      deliverables: ['Corporate One-Pager', 'Email Blast Header'],
      tools: ['Adobe Photoshop'],
    ),

    const ProjectItem(
      id: 'church-revival-conference',
      title: 'Supernatural Shift Annual Ministry Conference',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/work_20.jpg',
      client: 'International Fellowship',
      year: '2024',
      objective: 'Design a 3-day conference branding system with multiple guest minister profiles.',
      creativeDirection: 'Electric indigo, golden light rays, and balanced multiminister composite portraits.',
      designApproach: 'Ensured all speakers received equal prominence with legible session timestamps.',
      deliverables: ['Stage Backdrop (16:9)', 'Flyer Suite', 'Social Countdown Graphics'],
      tools: ['Adobe Photoshop'],
    ),

    const ProjectItem(
      id: 'luxury-fashion-flyer',
      title: 'Haute Couture Weekend Fashion Showcase',
      category: 'Event Flyers',
      imagePath: 'assets/portfolio/work_21.jpg',
      client: 'Boutique Fashion House',
      year: '2024',
      objective: 'Design an editorial runway show invitation flyer blending minimalist fashion with bold typography.',
      creativeDirection: 'High-fashion editorial layout, stark monochrome balance with subtle gold accents.',
      designApproach: 'Prioritized model photography and minimalist brand credits.',
      deliverables: ['Runway Invitation', 'VIP Digital Pass'],
      tools: ['Adobe Photoshop'],
    ),

    const ProjectItem(
      id: 'ebook-cover-design',
      title: 'The Purpose Code — Leadership Book Cover',
      category: 'Book Covers',
      imagePath: 'assets/portfolio/work_22.jpg',
      client: 'Leadership Author & Speaker',
      year: '2024',
      objective: 'Craft a compelling non-fiction book cover design that stands out on Amazon and digital bookstores.',
      creativeDirection: 'Bold conceptual typography, metallic foil emboss effect, strong symbolic imagery.',
      designApproach: 'Optimized title readability at Amazon thumbnail scale.',
      deliverables: ['Paperback Wrap', 'Kindle E-Book File', '3D Promo Render'],
      tools: ['Adobe Photoshop'],
    ),

    const ProjectItem(
      id: 'brand-identity-system',
      title: 'Apex Prime Visual Identity System',
      category: 'Branding',
      imagePath: 'assets/portfolio/work_23.jpg',
      client: 'Apex Prime Consulting',
      year: '2024',
      objective: 'Build a comprehensive corporate identity system for a management consulting group.',
      creativeDirection: 'Structured geometric logo mark, confident deep blue and charcoal brand palette.',
      designApproach: 'Crafted a scalable logo mark that functions seamlessly from business cards to billboards.',
      deliverables: ['Full Logo Suite (SVG, PNG, PDF)', 'Brand Guidelines (PDF)', 'Stationery System'],
      tools: ['Adobe Photoshop', 'Illustrator'],
    ),

    const ProjectItem(
      id: 'social-media-campaign',
      title: 'Monthly Social Media Ad Campaign Kit',
      category: 'Social Media',
      imagePath: 'assets/portfolio/work_24.jpg',
      client: 'Digital Agency Client',
      year: '2024',
      objective: 'Develop a cohesive 12-post social media campaign with recurring brand elements.',
      creativeDirection: 'Consistent brand colors, engaging typography hierarchy, clean product showcases.',
      designApproach: 'Created modular design templates for rapid campaign rollout.',
      deliverables: ['12 High-Res Posts', 'Story Variations', 'Editable Canva Templates'],
      tools: ['Adobe Photoshop', 'Canva'],
    ),
  ];

  // Services with Dual Pricing (NGN & USD)
  static final List<ServiceItem> services = [
    const ServiceItem(
      id: 'brand-identity',
      title: 'Brand Identity Design',
      description: 'Comprehensive logo suites, color palettes, typography systems, and brand style guides that build long-term trust and market authority.',
      iconData: Icons.auto_awesome,
      deliverables: ['Primary & Secondary Logo Marks', 'Vector Source Files (AI, EPS, SVG)', 'Typography & Color Guide', 'Brand Mockups & Stationery'],
      startingNgn: 100000,
      startingUsd: 300,
      turnaround: '5–10 Business Days',
    ),
    const ServiceItem(
      id: 'church-ministry',
      title: 'Church & Ministry Graphics',
      description: 'Spiritual, dignified graphics for sermon series, conference flyers, conventions, and weekly broadcast announcements that inspire attendance.',
      iconData: Icons.church,
      deliverables: ['Print-Ready Posters (A3/A4)', 'Social Media Square & Story', 'LED Screen / TV Backdrop', 'Speaker Promotion Banners'],
      startingNgn: 15000,
      startingUsd: 50,
      turnaround: '24–48 Hours',
    ),
    const ServiceItem(
      id: 'event-flyers',
      title: 'Flyer & Event Design',
      description: 'High-energy, eye-catching promotional flyers for boat cruises, concerts, trade fairs, parties, and conferences that sell tickets.',
      iconData: Icons.confirmation_number_outlined,
      deliverables: ['High-Resolution Print Flyer', 'Instagram / Facebook Formats', 'WhatsApp Broadcast Flyer', 'Digital Ticket Badges'],
      startingNgn: 15000,
      startingUsd: 45,
      turnaround: '24–48 Hours',
    ),
    const ServiceItem(
      id: 'business-corporate',
      title: 'Business & Corporate Graphics',
      description: 'Polished commercial graphics, marketing flyers, sales brochures, business proposals, and roll-up banners that elevate your company profile.',
      iconData: Icons.business_center_outlined,
      deliverables: ['Corporate One-Pager / Flyer', 'Roll-up Banner Design', 'Business Presentation Assets', 'Print-Ready PDF with Bleeds'],
      startingNgn: 20000,
      startingUsd: 60,
      turnaround: '2–4 Business Days',
    ),
    const ServiceItem(
      id: 'social-media',
      title: 'Social Media & Ad Creative',
      description: 'Scroll-stopping Instagram carousels, Facebook ad creatives, and promotional banners designed to boost engagement and click-through rates.',
      iconData: Icons.campaign_outlined,
      deliverables: ['Multi-Slide Carousel Posts', 'Single Feed Square Posts', 'Story / Reel Graphics', 'Conversion-Focused Ad Layouts'],
      startingNgn: 10000,
      startingUsd: 35,
      turnaround: '24–48 Hours',
    ),
    const ServiceItem(
      id: 'book-editorial',
      title: 'Book & Publication Covers',
      description: 'Captivating front, spine, and back covers for print books and Kindle e-books, formatted to Amazon KDP and print-house standards.',
      iconData: Icons.menu_book_outlined,
      deliverables: ['Full Wrap Cover (Spine + Back)', 'Amazon KDP / Kindle E-Book', '3D Photorealistic Book Mockup', 'Social Launch Announcement'],
      startingNgn: 25000,
      startingUsd: 75,
      turnaround: '3–6 Business Days',
    ),
    const ServiceItem(
      id: 'celebrations',
      title: 'Celebrations & Milestones',
      description: 'Glamorous, personalized birthday tributes, anniversary announcements, wedding cards, and graduation posters designed with celebratory grandeur.',
      iconData: Icons.celebration_outlined,
      deliverables: ['High-Res Framed Print File', 'Social Media DP Flyer', 'Short Animated/Story Version'],
      startingNgn: 15000,
      startingUsd: 45,
      turnaround: '24–48 Hours',
    ),
  ];

  // Commercial Packages
  static final List<PackageItem> packages = [
    const PackageItem(
      id: 'starter',
      name: 'Starter Design',
      targetAudience: 'Individuals & Small Businesses',
      description: 'Ideal for a single high-impact promotion, single event flyer, or quick campaign post.',
      priceNgn: 15000,
      priceUsd: 45,
      features: [
        '1 High-Resolution Flyer / Graphic',
        'Instagram (1:1) & Story (9:16) Sizes',
        'Print-Ready 300 DPI PDF + JPEG',
        '2 Rounds of Revisions',
        '48-Hour Standard Turnaround',
      ],
    ),
    const PackageItem(
      id: 'business-growth',
      name: 'Business Growth Pack',
      badge: 'Most Popular',
      isPopular: true,
      targetAudience: 'Growing Brands & Event Organizers',
      description: 'A complete promotional kit covering your main event or campaign across all digital and print touchpoints.',
      priceNgn: 60000,
      priceUsd: 180,
      features: [
        '3 Master Designs (Event Flyer + Promo Post + Story)',
        'Roll-Up Banner or LED Screen Variant',
        'WhatsApp Broadcast & DP Optimization',
        'High-Resolution Print-Ready Exports',
        '3 Rounds of Revisions',
        'Priority 24–48h Turnaround',
      ],
    ),
    const PackageItem(
      id: 'brand-identity-pack',
      name: 'Complete Brand Identity',
      targetAudience: 'Startups & Rebranding Companies',
      description: 'A professional brand foundation that positions your business for premium client acquisition.',
      priceNgn: 250000,
      priceUsd: 550,
      features: [
        'Primary & Secondary Logo Concepts',
        'Full Vector Source Files (AI, SVG, EPS, PDF)',
        'Color Palette & Font Pairings Guide',
        'Brand Stationery (Business Card, Letterhead)',
        'Social Media Profile & Banner Kit',
        'Full Copyright Handoff',
      ],
    ),
    const PackageItem(
      id: 'ministry-retainer',
      name: 'Ministry / Monthly Retainer',
      badge: 'Best Value',
      targetAudience: 'Churches & Active Creators',
      description: 'Consistent, premium weekly graphics for Sunday services, mid-week fellowships, and special announcements.',
      priceNgn: 120000,
      priceUsd: 320,
      features: [
        'Up to 8 Custom Designs per Month',
        'Weekly Service & Sermon Graphics',
        'LED Stage Backdrop Screen Adapters',
        'Speaker & Guest Announcement Banners',
        'Dedicated VIP Turnaround (24 Hours)',
        'Direct WhatsApp Priority Line',
      ],
    ),
  ];

  // Helper method to format currency
  static String formatCurrency(int amount, bool isNgn) {
    if (isNgn) {
      // e.g. ₦15,000
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

  // Pre-formatted WhatsApp link generator
  static String buildWhatsAppUrl({
    String? service,
    String? projectTitle,
    String? budget,
    String? deadline,
    String? clientName,
    String? notes,
  }) {
    final buffer = StringBuffer('Hello Ademola (AVO Media), I would like to discuss a graphic design project.\n\n');
    if (clientName != null && clientName.isNotEmpty) {
      buffer.write('• My Name: $clientName\n');
    }
    if (service != null && service.isNotEmpty) {
      buffer.write('• Service: $service\n');
    }
    if (projectTitle != null && projectTitle.isNotEmpty) {
      buffer.write('• Project / Reference: $projectTitle\n');
    }
    if (budget != null && budget.isNotEmpty) {
      buffer.write('• Budget: $budget\n');
    }
    if (deadline != null && deadline.isNotEmpty) {
      buffer.write('• Target Deadline: $deadline\n');
    }
    if (notes != null && notes.isNotEmpty) {
      buffer.write('• Notes: $notes\n');
    }
    buffer.write('\nLet’s discuss the scope and next steps!');

    final encoded = Uri.encodeComponent(buffer.toString());
    return 'https://wa.me/$whatsappRaw?text=$encoded';
  }
}
