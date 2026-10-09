import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'theme/app_theme.dart';
import 'data/portfolio_data.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/metrics_strip.dart';
import 'widgets/featured_section.dart';
import 'widgets/portfolio_gallery_section.dart';
import 'widgets/services_section.dart';
import 'widgets/pricing_section.dart';
import 'widgets/quote_calculator_section.dart';
import 'widgets/about_section.dart';
import 'widgets/process_section.dart';
import 'widgets/client_inquiry_section.dart';
import 'widgets/footer.dart';

void main() {
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

  // Section Keys for smooth scrolling
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _featuredKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _pricingKey = GlobalKey();
  final GlobalKey _quoteKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _inquiryKey = GlobalKey();

  String? _preselectedService;

  void _scrollToSection(String section) {
    GlobalKey? targetKey;
    switch (section) {
      case 'hero':
        targetKey = _heroKey;
        break;
      case 'featured':
        targetKey = _featuredKey;
        break;
      case 'portfolio':
        targetKey = _portfolioKey;
        break;
      case 'services':
        targetKey = _servicesKey;
        break;
      case 'pricing':
        targetKey = _pricingKey;
        break;
      case 'quote':
        targetKey = _quoteKey;
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
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
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
          // Main Scrollable Body
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // 1. Navigation Offset / Top Padding
                const SizedBox(height: 80),

                // 2. Hero Section
                Container(
                  key: _heroKey,
                  child: HeroSection(
                    onStartProject: () => _scrollToSection('inquiry'),
                    onViewWork: () => _scrollToSection('featured'),
                  ),
                ),

                // 3. Metrics Strip
                const MetricsStrip(),

                // 4. Featured Case Studies
                Container(
                  key: _featuredKey,
                  child: FeaturedSection(
                    onStartProject: () => _scrollToSection('inquiry'),
                    onViewAllProjects: () => _scrollToSection('portfolio'),
                  ),
                ),

                // 5. Complete Portfolio Gallery
                Container(
                  key: _portfolioKey,
                  child: PortfolioGallerySection(
                    onStartProject: () => _scrollToSection('inquiry'),
                  ),
                ),

                // 6. Professional Services
                Container(
                  key: _servicesKey,
                  child: ServicesSection(
                    onRequestService: _handleServiceSelection,
                  ),
                ),

                // 7. Transparent Pricing & Packages
                Container(
                  key: _pricingKey,
                  child: PricingSection(
                    onSelectPackage: _handleServiceSelection,
                  ),
                ),

                // 8. Custom Quote Estimator
                Container(
                  key: _quoteKey,
                  child: QuoteCalculatorSection(
                    onRequestFinalQuote: () => _scrollToSection('inquiry'),
                  ),
                ),

                // 9. About Designer
                Container(
                  key: _aboutKey,
                  child: AboutSection(
                    onStartProject: () => _scrollToSection('inquiry'),
                  ),
                ),

                // 10. Client Workflow Process
                const ProcessSection(),

                // 11. Client Inquiry Form
                Container(
                  key: _inquiryKey,
                  child: ClientInquirySection(
                    initialService: _preselectedService,
                  ),
                ),

                // 12. Footer
                Footer(
                  onNavClick: _scrollToSection,
                ),
              ],
            ),
          ),

          // Sticky Top Navbar
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

      // Floating WhatsApp Speed Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _launchWhatsApp,
        backgroundColor: AppTheme.whatsappGreen,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.chat_bubble_outline_rounded, size: 20),
        label: const Text(
          'Chat on WhatsApp',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
        ),
        elevation: 6,
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
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppTheme.primaryBlue.withValues(alpha: 0.5),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/logo/avomedia_badge.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        PortfolioData.brandName,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
                      ),
                      Text(
                        PortfolioData.titleTagline,
                        style: TextStyle(color: AppTheme.primaryBlueLight, fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(color: AppTheme.borderSubtle),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  _DrawerItem(
                    title: 'Featured Work',
                    icon: Icons.star_border_rounded,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('featured');
                    },
                  ),
                  _DrawerItem(
                    title: 'Full Portfolio Archive',
                    icon: Icons.grid_view_rounded,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('portfolio');
                    },
                  ),
                  _DrawerItem(
                    title: 'Services & Scope',
                    icon: Icons.design_services_outlined,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('services');
                    },
                  ),
                  _DrawerItem(
                    title: 'Pricing & Packages',
                    icon: Icons.payments_outlined,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('pricing');
                    },
                  ),
                  _DrawerItem(
                    title: 'Quote Calculator',
                    icon: Icons.calculate_outlined,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('quote');
                    },
                  ),
                  _DrawerItem(
                    title: 'About AVO Media',
                    icon: Icons.person_outline_rounded,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('about');
                    },
                  ),
                  _DrawerItem(
                    title: 'Contact / Inquiry',
                    icon: Icons.mail_outline_rounded,
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToSection('inquiry');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _scrollToSection('inquiry');
                },
                icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                label: const Text('Start a Project'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryBlue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
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
      leading: Icon(icon, color: AppTheme.primaryBlueLight, size: 20),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      hoverColor: AppTheme.bgElevated,
    );
  }
}
