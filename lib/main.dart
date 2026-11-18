import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'theme/app_theme.dart';
import 'data/portfolio_data.dart';
import 'services/pinterest_service.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/metrics_strip.dart';
import 'widgets/portfolio_gallery_section.dart';
import 'widgets/services_section.dart';
import 'widgets/pricing_section.dart';
import 'widgets/about_section.dart';
import 'widgets/client_inquiry_section.dart';
import 'widgets/footer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${PortfolioData.brandName} — ${PortfolioData.titleTagline}',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _pricingKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _inquiryKey = GlobalKey();

  String? _preselectedService;
  bool _precached = false;

  @override
  void initState() {
    super.initState();
    PinterestService.instance.startAutoSync();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_precached) {
      _precached = true;
      _precacheInitialMedia();
    }
  }

  void _precacheInitialMedia() {
    const heroAssets = [
      'assets/logo/avomedia_badge.png',
      'assets/logo/pinterest_logo.png',
      'assets/logo/avomedia_logo.png',
      'assets/portfolio/behance/church_service_flyer.jpg',
      'assets/portfolio/behance/tech_conference_flyer.jpg',
      'assets/portfolio/behance/book_cover_design.jpg',
    ];
    for (final path in heroAssets) {
      precacheImage(AssetImage(path), context);
    }

    final initialProjects = PinterestService.instance.projectsNotifier.value.take(15);
    for (final project in initialProjects) {
      if (!project.isNetworkImage) {
        precacheImage(
          ResizeImage(AssetImage(project.imagePath), width: 560),
          context,
        );
      }
    }
  }

  void _scrollToSection(String section) {
    GlobalKey? targetKey;
    switch (section) {
      case 'hero':
        targetKey = _heroKey;
        break;
      case 'featured':
      case 'portfolio':
        targetKey = _portfolioKey;
        break;
      case 'services':
        targetKey = _servicesKey;
        break;
      case 'pricing':
      case 'quote':
        targetKey = _pricingKey;
        break;
      case 'about':
        targetKey = _aboutKey;
        break;
      case 'contact':
      case 'inquiry':
        targetKey = _inquiryKey;
        break;
    }

    if (targetKey != null && targetKey.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey.currentContext!,
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _handleServiceSelection(String serviceName) {
    setState(() {
      _preselectedService = serviceName;
    });
    _scrollToSection('inquiry');
  }

  Future<void> _launchWhatsApp() async {
    final url = PortfolioData.buildWhatsAppUrl();
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  void dispose() {
    PinterestService.instance.stopAutoSync();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgDark,
      endDrawer: _buildMobileDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 88),

                // 1. Minimalist Hero
                Container(
                  key: _heroKey,
                  child: HeroSection(
                    onStartProject: () => _scrollToSection('inquiry'),
                    onViewWork: () => _scrollToSection('portfolio'),
                  ),
                ),

                // 2. Metrics Strip
                const MetricsStrip(),

                // 3. Selected Works + Live Pinterest Auto-Sync Gallery
                Container(
                  key: _portfolioKey,
                  child: PortfolioGallerySection(
                    onStartProject: () => _scrollToSection('inquiry'),
                  ),
                ),

                // 4. Services
                Container(
                  key: _servicesKey,
                  child: ServicesSection(
                    onRequestService: _handleServiceSelection,
                  ),
                ),

                // 5. Pricing
                Container(
                  key: _pricingKey,
                  child: PricingSection(
                    onSelectPackage: _handleServiceSelection,
                  ),
                ),

                // 6. About
                Container(
                  key: _aboutKey,
                  child: AboutSection(
                    onStartProject: () => _scrollToSection('inquiry'),
                  ),
                ),

                // 7. Start a Project
                Container(
                  key: _inquiryKey,
                  child: ClientInquirySection(
                    initialService: _preselectedService,
                  ),
                ),

                // 8. Footer
                Footer(
                  onNavClick: _scrollToSection,
                ),
              ],
            ),
          ),

          // Sticky Minimal Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Navbar(
              onNavClick: _scrollToSection,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchWhatsApp,
        tooltip: 'WhatsApp',
        backgroundColor: AppTheme.whatsappGreen,
        foregroundColor: Colors.white,
        elevation: 4,
        child: const Icon(Icons.chat_bubble_outline_rounded, size: 22),
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: AppTheme.bgSurface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/logo/avomedia_badge.png',
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    PortfolioData.brandName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: AppTheme.borderSubtle, height: 1),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                children: [
                  _DrawerItem(
                    title: 'Work',
                    icon: Icons.grid_view_rounded,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('portfolio');
                    },
                  ),
                  _DrawerItem(
                    title: 'Services',
                    icon: Icons.design_services_outlined,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('services');
                    },
                  ),
                  _DrawerItem(
                    title: 'Pricing',
                    icon: Icons.payments_outlined,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('pricing');
                    },
                  ),
                  _DrawerItem(
                    title: 'About',
                    icon: Icons.person_outline_rounded,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('about');
                    },
                  ),
                  _DrawerItem(
                    title: 'Contact',
                    icon: Icons.mail_outline_rounded,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('inquiry');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primaryBlueLight, size: 19),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
