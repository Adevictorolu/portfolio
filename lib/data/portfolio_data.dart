import 'package:flutter/material.dart';
import '../models/project_item.dart';
import '../models/service_item.dart';
import '../models/package_item.dart';

class PortfolioData {
  static const String designerName = 'AVO Media';
  static const String brandName = 'AVO Media';
  static const String titleTagline = 'Avomedia, Creating beyond limit';
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

  // Curated Portfolio Projects (100% Genuine Created Works from Instagram @adevictorolu / @avomedia0 & Behance ademolavictor1)
  static final List<ProjectItem> projects = [
    // 1. Featured Branding: AVO Media Identity System
    const ProjectItem(
      id: 'avomedia-brand-identity',
      title: 'AVO Media Visual Identity & Wordmark System',
      category: 'Branding',
      imagePath: 'assets/logo/avomedia_logo.png',
      client: 'AVO Media / Official Brand System',
      year: '2025',
      objective: 'Create a distinctive, modern visual identity and monogram mark that embodies fluid precision, creative mastery, and digital innovation.',
      creativeDirection: 'Fluid lowercase typographic geometry seamlessly linking the letters a, v, and o. Versatile multi-format styling across deep obsidian, studio white, and electric brand cyan.',
      designApproach: 'Engineered harmonious line weights and curvature continuity. Tested across tiny 16px digital favicons to massive outdoor signage.',
      deliverables: ['Primary Vector Monogram', 'Full Logotype Lockup', 'Color Palette & Typography Specs', 'Social Media Asset Suite'],
      tools: ['Adobe Illustrator', 'Adobe Photoshop'],
      isFeatured: true,
    ),

    // 2. Featured Church & Ministry: The Corridors of Favour
    const ProjectItem(
      id: 'corridors-of-favour',
      title: 'The Corridors of Favour — Apostolic Church Service Flyer',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/behance/church_service_flyer.jpg',
      client: 'Apostolic Assembly (Gwuduwi Junction, Abuja)',
      year: '2025',
      objective: 'Design an impactful, reverent Sunday service flyer focusing on divine grace and biblical encouragement for an Abuja congregation.',
      creativeDirection: 'Gilded gothic calligraphy headline with heavenly golden rays, ascending white dove of the Holy Spirit, and polished architectural dome background.',
      designApproach: 'Framed the minister’s portrait with high-contrast ambient lighting. Layered scripture reference (Esther 5:2) and service schedules (7:30am & 9:00am) for optimal mobile readability.',
      deliverables: ['Print-Ready Service Poster', 'Instagram Feed Square (1:1)', 'WhatsApp Status Broadcast'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 3. Featured Tech & Corporate: Tech Innovative Conference 2025
    const ProjectItem(
      id: 'tech-innovative-conference',
      title: 'Tech Innovative Conference 2025 — AVOTEK Summit',
      category: 'Event Flyers',
      imagePath: 'assets/portfolio/behance/tech_conference_flyer.jpg',
      client: 'AVOTEK by Victor (Live Stream: Bit.ly/AVOTEKBYVICTOR)',
      year: '2025',
      objective: 'Develop high-tech promotional visuals for a global virtual innovation conference featuring multi-speaker keynote sessions.',
      creativeDirection: 'Deep cyber-blue matrix backdrop, dynamic 3D ascending rocket icon, geometric digital typography, and futuristic speaker profile badges.',
      designApproach: 'Balanced equal hierarchy among all four verified speakers (Olusegun James, Nwonne Prince, Ademuyiwa Racheal, Ambode Joy) while emphasizing livestream access credentials.',
      deliverables: ['Keynote Event Poster', 'Speaker Spotlight Graphics', 'Livestream Screen Overlay'],
      tools: ['Adobe Photoshop', 'Adobe Illustrator'],
      isFeatured: true,
    ),

    // 4. Featured Book Cover: From Conversion to Maturity
    const ProjectItem(
      id: 'conversion-to-maturity-book',
      title: 'From Conversion to Maturity: A Guide for New Converts',
      category: 'Book Covers',
      imagePath: 'assets/portfolio/behance/book_cover_design.jpg',
      client: 'Christian Discipleship Publishing House',
      year: '2025',
      objective: 'Design a transformative editorial book cover and 3D promotional presentation mockup celebrating spiritual discipleship and personal growth.',
      creativeDirection: 'Vibrant ultraviolet to magenta sunset gradient, silhouette worshipper focal point, radiant spiritual light bursts, and brushed acrylic script title.',
      designApproach: 'Created a complete 3D photorealistic hardcover mockup demonstrating front cover artwork, printed spine typography, and comprehensive back cover synopsis.',
      deliverables: ['3D Hardcover Presentation Mockup', 'Print Paperback Wrap (Spine + Back)', 'Digital E-Book Cover File'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 5. Featured Celebration: Archbishop Francis Wale Oke 70th Diamond Jubilee
    const ProjectItem(
      id: 'archbishop-wale-oke-70th',
      title: 'Archbishop Francis Wale Oke 70th Diamond Jubilee Tribute',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/instagram/ig_agency_10.webp',
      client: 'The Sword of the Spirit Ministries',
      year: '2024',
      objective: 'Design an authoritative, regal commemoration flyer celebrating the 70th milestone jubilee of Pentecostal leader Archbishop Francis Wale Oke.',
      creativeDirection: 'Warm monarchial gold and amber radiance, architectural curved photo arc chronicling seven decades of ministry, dignified typography, and custom jubilee seal.',
      designApproach: 'Enhanced portrait clarity with high-end digital retouching. Crafted seamless biographical background typography commemorating Kasumu lineage and national evangelism.',
      deliverables: ['Commemorative Jubilee Poster', 'Church Service Screen Slides', 'Social Media Celebration Banner'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 6. Featured Sports Tribute: Thank You Messi 2006–2026
    const ProjectItem(
      id: 'thank-you-messi-tribute',
      title: 'Thank You Messi 2006–2026: The GOAT Career Tribute Graphic',
      category: 'Social Media',
      imagePath: 'assets/portfolio/instagram/ig_agency_1.webp',
      client: 'Sports Editorial & Digital Media',
      year: '2025',
      objective: 'Craft an explosive, museum-grade sports editorial tribute honoring Lionel Messi’s international career milestone.',
      creativeDirection: 'Atmospheric monochrome stadium background with silver foil typography, signature vector overlay, iconic GOAT typography emblem, and full-color Argentina kit spotlight.',
      designApproach: 'Engineered high-drama sports lighting and particle effects. Combined dynamic match ball elevation with commemorative 2006–2026 milestone framing.',
      deliverables: ['High-Res Editorial Print Poster', 'Instagram Feed Graphic (1:1)', 'Mobile Wallpaper Edition'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 7. Featured Commercial Catering: Every Bite Gives a Delicious Taste
    const ProjectItem(
      id: 'every-bite-delicious-catering',
      title: 'Every Bite Gives a Delicious Taste — Gourmet Catering Flyer',
      category: 'Corporate',
      imagePath: 'assets/portfolio/behance/food_flyer_design.jpg',
      client: "D'mumsys Kitchen & Catering Services",
      year: '2025',
      objective: 'Create a mouth-watering, sales-driving restaurant and event catering menu flyer showcasing authentic Nigerian cuisine.',
      creativeDirection: 'Warm earthy copper and mahogany tones, flying scotch bonnet peppers, appetizing top-down culinary plates (Jollof, Fried Rice, Amala & Ewedu), and charismatic chef hero portrait.',
      designApproach: 'Structured menu offerings into clean dual columns with translucent modern frosted glass service badges and an eye-catching call to action.',
      deliverables: ['Full Color Print Menu Flyer', 'WhatsApp Promotional Graphic', 'Instagram Sponsored Ad Creative'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 8. Featured Gospel Celebration: Minister Mercy Chinwo Birthday
    const ProjectItem(
      id: 'mercy-chinwo-birthday',
      title: 'Minister Mercy Chinwo Birthday Celebration',
      category: 'Celebrations',
      imagePath: 'assets/portfolio/instagram/ig_agency_11.webp',
      client: 'Gospel Broadcast Network',
      year: '2024',
      objective: 'Design an inspiring, joyful celebrity tribute flyer celebrating award-winning gospel music icon Minister Mercy Chinwo.',
      creativeDirection: 'Lush spring botanical ambiance with giant mint-green floral pedals, golden light streaks, and multiple joyous studio portrait angles.',
      designApproach: 'Executed meticulous hair extraction and skin retouching. Harmonized emerald and sunny yellow hues with sophisticated script lettering.',
      deliverables: ['Celebrity Birthday Tribute Poster', 'Instagram Square (1:1)', 'WhatsApp DP Banner'],
      tools: ['Adobe Photoshop'],
      isFeatured: true,
    ),

    // 9. Featured 3D Commercial Product: Smarter Life iPhone 15 Pro Max
    const ProjectItem(
      id: 'smarter-life-iphone-showcase',
      title: 'Smarter Life: iPhone 15 Pro Max 3D Product Showcase',
      category: 'Social Media',
      imagePath: 'assets/portfolio/behance/product_showcase_flyer.jpg',
      client: 'Premium Tech & Smartphone Retailer',
      year: '2025',
      objective: 'Design a sleek, high-converting e-commerce product advertisement emphasizing device craftsmanship and premium features.',
      creativeDirection: 'Forest green doodle pattern backdrop, photorealistic 3D dual-perspective phone renders with transparent bumper case reflections, and floating frosted glass info cards.',
      designApproach: 'Positioned pro-grade camera specs and battery highlights symmetrically around the device with subtle floor shadow depth.',
      deliverables: ['E-Commerce Hero Banner', 'Social Media Ad Creative', 'Digital Store Display Graphic'],
      tools: ['Adobe Photoshop', 'Blender 3D'],
      isFeatured: true,
    ),

    // Supporting Projects (All 100% Genuine Created Works)
    // 10. Church Milestone: Bishop David Oyedepo 72nd Birthday Tribute
    const ProjectItem(
      id: 'bishop-oyedepo-72nd',
      title: 'Bishop David Oyedepo 72nd Milestone Birthday Tribute',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/instagram/ig_agency_5.webp',
      client: 'Living Faith Church / Kingdom Impact Broadcast',
      year: '2024',
      objective: 'Commemorate the 72nd birthday of Bishop David Oyedepo with an inspiring, dignified apostolic tribute design.',
      creativeDirection: 'Rich crimson and warm amber stage lighting, multi-panel montage of pastoral worship and teaching, with an illuminated open Bible in the foreground.',
      designApproach: 'Blended historical preaching moments with sharp typographic hierarchy highlighting the September 27 milestone date.',
      deliverables: ['Commemorative Wall Print', 'Social Media Graphic', 'Broadcast Video Slide'],
      tools: ['Adobe Photoshop'],
    ),

    // 11. Creative Celebration: Agbi Emmanuel Birthday Tribute
    const ProjectItem(
      id: 'agbi-emmanuel-birthday',
      title: 'Happy Birthday Agbi Emmanuel — Man of God & Creative Creator',
      category: 'Celebrations',
      imagePath: 'assets/portfolio/instagram/ig_agency_6.webp',
      client: 'Kingdom Creative Network',
      year: '2024',
      objective: 'Create an electric, celebratory birthday flyer honoring digital creator Agbi Emmanuel.',
      creativeDirection: 'Vibrant magenta, electric yellow, and soft violet studio lights, three dynamic suited poses, and textured metallic lettering.',
      designApproach: 'Combined sharp studio lighting with modern celebratory brush strokes and crisp date badges.',
      deliverables: ['Birthday Tribute Poster', 'Instagram Feed 1:1', 'WhatsApp Story Banner'],
      tools: ['Adobe Photoshop'],
    ),

    // 12. Ministry Gathering: CAPACITY Tarry Night
    const ProjectItem(
      id: 'capacity-tarry-night',
      title: 'CAPACITY Tarry Night: Sept Edition — Holy Ghost Encounter',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/instagram/ig_personal_6.webp',
      client: 'Bro Ademola Victor (Convener) / Holy Ghost Encounter',
      year: '2025',
      objective: 'Promote an intensive 180-minute late-night spiritual tarry and prayer session on Telegram.',
      creativeDirection: 'Textured vintage film grain backdrop, bold modern typography, and a prominent warm amber minister roster badge.',
      designApproach: 'Emphasized Jude 1:3 anchor scripture alongside seamless event access via QR code and Telegram Call time badges.',
      deliverables: ['Event Promo Flyer', 'Telegram Session Banner', 'WhatsApp Broadcast Visual'],
      tools: ['Adobe Photoshop'],
    ),

    // 13. Church Marriage Event: Couple\'s Meeting — One Flesh
    const ProjectItem(
      id: 'summit-kabusa-couples-meeting',
      title: "Couple's Meeting: One Flesh — Summit Kabusa Abuja",
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/instagram/ig_agency_4.webp',
      client: 'Summit Bible Church Kabusa (Min Francisca & Gloria)',
      year: '2024',
      objective: 'Design a joyful, romantic marriage enrichment seminar flyer for Summit Bible Church Kabusa.',
      creativeDirection: 'Vibrant magenta skies with floating 3D glossy red balloons, smiling minister portraits, and architectural dome backdrop.',
      designApproach: 'Structured event highlights, 4pm time prompt, and Abuja road directions into an intuitive pill-shaped visual container.',
      deliverables: ['Church Handout Poster', 'Social Media Square', 'WhatsApp Group Broadcast Flyer'],
      tools: ['Adobe Photoshop'],
    ),

    // 14. Professional Training: Transition to Photoshop 1.0 Masterclass
    const ProjectItem(
      id: 'transition-to-photoshop',
      title: 'Transition to Photoshop 1.0: Professional Design Masterclass',
      category: 'Corporate',
      imagePath: 'assets/portfolio/instagram/ig_agency_9.webp',
      client: 'AVO Media Creative Academy',
      year: '2024',
      objective: 'Promote a comprehensive 6-week graphic design academy covering fundamentals, color theory, typography, and photo manipulation.',
      creativeDirection: 'Tech navy grid interface with floating Adobe Ps badges, 3D tool pallet wand remote, and coupon-style discounted enrollment ticket.',
      designApproach: 'Organized course curriculum modules and student certification benefits into scannable visual clusters.',
      deliverables: ['Course Launch Poster', 'Curriculum Syllabus Sheet', 'Digital Enrollment Card'],
      tools: ['Adobe Photoshop'],
    ),

    // 15. Brand Campaign: The Grinding Continues Mascot Campaign
    const ProjectItem(
      id: 'the-grinding-continues',
      title: 'The Grinding Continues — AVO Media Client Service Mascot',
      category: 'Social Media',
      imagePath: 'assets/portfolio/instagram/ig_agency_2.webp',
      client: 'AVO Media Agency Campaign',
      year: '2024',
      objective: 'Create an engaging brand personality graphic highlighting relentless work ethic and client design satisfaction.',
      creativeDirection: 'Deep navy studio grid, energetic 3D character straining on a tug-of-war rope, and flowing cyan ribbon footer.',
      designApproach: 'Integrated verified booking WhatsApp hotline (+234 911 498 5251) and quick-scan portfolio QR code for immediate leads.',
      deliverables: ['Brand Engagement Post', 'WhatsApp Status Graphic', 'Lead Generation Creative'],
      tools: ['Adobe Photoshop', 'Blender 3D'],
    ),

    // 16. National Holiday: Happy Independence Day Nigeria @ 64
    const ProjectItem(
      id: 'independence-day-nigeria',
      title: 'Happy Independence Day Nigeria @ 64 — National Unity Poster',
      category: 'Social Media',
      imagePath: 'assets/portfolio/instagram/ig_agency_3.webp',
      client: 'AVO Media Public Holiday Series',
      year: '2024',
      objective: 'Design a patriotic holiday tribute celebrating Nigerian resilience, creative culture, and hope for a better tomorrow.',
      creativeDirection: 'Dramatic stone cavern silhouette contouring the geographical map of Nigeria, silk green-white-green flag drape, and national stadium perspective.',
      designApproach: 'Harmonized emerald greens and bright white typography with a message inspiring national pride and community.',
      deliverables: ['National Holiday Poster', 'Instagram Feed Tribute', 'WhatsApp DP Creative'],
      tools: ['Adobe Photoshop'],
    ),

    // 17. Custom Typography Series: Welcome to May Calendar Series
    const ProjectItem(
      id: 'welcome-to-may-typography',
      title: 'Welcome to May: Custom Tribal Typography Calendar Series',
      category: 'Event Flyers',
      imagePath: 'assets/portfolio/behance/new_month_flyer_1.jpg',
      client: 'AVO Media Seasonal Series',
      year: '2025',
      objective: 'Craft an expressive, bespoke typographic calendar art piece ushering in the new month of May.',
      creativeDirection: 'Hand-drawn high-contrast black tribal letterforms on crumpled white parchment paper with dynamic notch styling and integrated calendar grid.',
      designApproach: 'Pushed expressive typography boundaries to demonstrate custom lettering capabilities for posters and merchandise.',
      deliverables: ['Social Calendar Greeting', 'Phone Wallpaper Artwork', 'Status Promo Card'],
      tools: ['Adobe Illustrator', 'Adobe Photoshop'],
    ),

    // 18. Seasonal Inspiration: Welcome to April Grace & Favor Series
    const ProjectItem(
      id: 'welcome-to-april-grace',
      title: "Welcome to April: God's Grace & Favor Seasonal Graphic",
      category: 'Event Flyers',
      imagePath: 'assets/portfolio/behance/new_month_flyer_2.jpg',
      client: 'AVO Media Seasonal Series',
      year: '2025',
      objective: 'Design a luminous, faith-filled monthly welcome graphic with dynamic textured typography.',
      creativeDirection: 'Vibrant neon green stone texture embedded inside sharp geometric lettering, rustic brush stroke banner, and uplifting prayer blurb.',
      designApproach: 'Balanced clean minimalist background with high-impact organic text treatments.',
      deliverables: ['New Month Greeting Card', 'WhatsApp Broadcast Flyer', 'Instagram Story Format'],
      tools: ['Adobe Photoshop'],
    ),

    // 19. Landmark Portfolio Showcase: 420+ Designs Retrospective
    const ProjectItem(
      id: 'portfolio-420-retrospective',
      title: '420+ Commercial & Church Designs — Annual Creative Retrospective',
      category: 'Branding',
      imagePath: 'assets/portfolio/instagram/ig_personal_5.webp',
      client: 'AVO Media / @adevictorolu',
      year: '2025',
      objective: 'Present an authoritative visual retrospective cataloguing more than 420 completed design projects across churches, commercial brands, and events.',
      creativeDirection: 'Expansive multi-row mosaic showing dozens of real flyer layouts, book covers, product ads, and ministry banners with emerald brand footer and verified handles.',
      designApproach: 'Serves as undeniable social proof of prolific creative output, versatility, and trusted delivery across all graphic design disciplines.',
      deliverables: ['Master Portfolio Retrospective Poster', 'Social Media Landmark Post', 'Brand Authority Asset'],
      tools: ['Adobe Photoshop', 'Adobe Illustrator'],
    ),

    // 20. Production Masterclass: Nathaniel Bassey Birthday Art — Live Photoshop PSD Canvas
    const ProjectItem(
      id: 'nathaniel-bassey-psd-production',
      title: 'Nathaniel Bassey Birthday Art — Studio Photoshop Production Canvas',
      category: 'Celebrations',
      imagePath: 'assets/portfolio/instagram/ig_agency_8.jpg',
      client: 'Gospel Music Commemoration (27th August)',
      year: '2024',
      objective: 'Provide transparent proof of craft through behind-the-scenes Photoshop workspace production of minister Nathaniel Bassey’s birthday tribute.',
      creativeDirection: 'Authentic 2000x2500px 300dpi Photoshop canvas displaying slice guides, adjustment layers, text paths, and composite trumpet performance photography.',
      designApproach: 'Demonstrates professional layer structuring, color grading, and meticulous compositing behind finished client artwork.',
      deliverables: ['Photoshop Master Production PSD', 'Exported Commemorative Poster', 'Process Breakdown Graphic'],
      tools: ['Adobe Photoshop (PSD Master)'],
    ),

    // 21. Church Giving Campaign: Ascension Army Strategic Support
    const ProjectItem(
      id: 'ascension-army-partner-campaign',
      title: 'Ascension Army — Strategic Kingdom Support Campaign',
      category: 'Church & Ministry',
      imagePath: 'assets/portfolio/design_2.jpg',
      client: 'Ascension Army International',
      year: '2024',
      objective: 'Create an urgent, faith-inspiring visual campaign to mobilize kingdom partners and missions support.',
      creativeDirection: 'Dynamic cobalt blue and golden aura tones, high-impact bold typography, and clear financial giving channel integration.',
      designApproach: 'Structured account credentials and giving channels into clean visual modules for fast mobile transaction completion.',
      deliverables: ['Missions Campaign Flyer', 'WhatsApp Status Graphics', 'Church Screen Slide'],
      tools: ['Adobe Photoshop'],
    ),

    // 22. Virtual Summit: SOSMI 2024 Global Ministry Summit
    const ProjectItem(
      id: 'sosmi-global-summit',
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
    final buffer = StringBuffer('Hello AVO Media, I would like to discuss a graphic design project.\n\n');
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
