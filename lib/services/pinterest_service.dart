import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import '../data/portfolio_data.dart';
import '../models/project_item.dart';

class PinterestService {
  PinterestService._();
  static final PinterestService instance = PinterestService._();

  static const String username = PortfolioData.pinterestUsername;
  static const String profileUrl = PortfolioData.pinterestUrl;
  static const String rssUrl = PortfolioData.pinterestRssUrl;

  static const Map<String, Map<String, String>> _curatedByHash = {
    'f85ae3cd0bac09a68b8fed444d23594d': {
      'title': 'Oil Resources — Energy & Logistics Banner',
      'category': 'Corporate',
      'caption':
          'Web hero visual for an international fuel logistics, tank storage, and maritime energy firm.',
    },
    'dbae13d58abfa5a4ba8481d69149bbd7': {
      'title': 'Bimps Delights — Event Catering Flyer',
      'category': 'Corporate',
      'caption':
          'Vibrant culinary promotional flyer showcasing event catering, cakes, and small chops in Ibadan.',
    },
    '879cde61fbdb6690b3ce4b51d2065c6f': {
      'title': 'Ascension Army — Brand Logotype',
      'category': 'Branding',
      'caption':
          'Authoritative navy and gold winged wordmark identity designed for Ascension Army.',
    },
    '5b086e22008452d94b1a5c78d9e9090c': {
      'title': 'Ascension Army — Winged Crest Emblem',
      'category': 'Branding',
      'caption':
          'Symbolic \'A\' monogram integrating golden wings, halo, and cross negative space.',
    },
    '41ffc42ff05e5fd67440c9dab7afb6ad': {
      'title': 'Welcome to September — AVO Media',
      'category': 'Event Flyers',
      'caption':
          '3D paper-plane typographic poster crafted for AVO Media\'s monthly creative series.',
    },
    '71a21dc80fc2959bbe999a932d5de882': {
      'title': 'Archbishop Francis Wale Oke @ 70',
      'category': 'Celebrations',
      'caption':
          'Monochrome editorial birthday tribute celebrating Archbishop Francis Wale Oke\'s 70th milestone.',
    },
    '7bcd6577a4c0d53cff45535427dfc588': {
      'title': 'Ascension Army — Call for Support',
      'category': 'Church & Ministry',
      'caption':
          '3D royal scroll partnership graphic structured for seamless ministry support.',
    },
    '71501b4f9044354df421b23885d998fd': {
      'title': 'Atmosphere of Ascension — Parlor Worship',
      'category': 'Church & Ministry',
      'caption':
          'Radiant gold and cobalt worship encounter poster featuring minister portraits.',
    },
    'b6ee2ce5c352fb93f603ea91f80ca270': {
      'title': 'Fred Relics — Luxury Brand Mark',
      'category': 'Branding',
      'caption':
          'Minimalist gold monogram icon and classic serif logotype for Fred Relics.',
    },
    '357d75b7fd6151db964b72bfdebf4125': {
      'title': 'The Rebirth — Dominion University Carol Night',
      'category': 'Church & Ministry',
      'caption':
          'Symbolic botanical emergence and custom cross typography for Dominion University Carol Night.',
    },
    'adc6a3de4aa4807347e62996e0d656ad': {
      'title': 'Stand Out Campaign — Jenios Agency',
      'category': 'Social Media',
      'caption':
          'Chess-king visual metaphor crafted for Jenios Agency\'s media management campaign.',
    },
    'b667462fc4f9c7cdbdaeb3185e3ffa53': {
      'title': 'Cybersecurity Suite — Jenios Agency',
      'category': 'Corporate',
      'caption':
          '3D metallic shield and lock composition for enterprise cybersecurity marketing.',
    },
    'a2b7415c424ba83ca1a88a7a5ba6aadb': {
      'title': 'UI/UX Studio Showcase — Jenios Agency',
      'category': 'Social Media',
      'caption':
          'Multi-device 3D mockup ad highlighting intuitive UI/UX product design.',
    },
    '1ed61016275cf6964c280719e59220bb': {
      'title': 'Web & App Development — Jenios Agency',
      'category': 'Corporate',
      'caption':
          'Frosted 3D code brackets visual promoting full-stack web and mobile development.',
    },
    'cbcdb6350e1af9d126f8b7f40ab67c52': {
      'title': 'Fred Daniel — Convocation Portrait',
      'category': 'Celebrations',
      'caption':
          'Prismatic convocation portrait celebrating Dominion University Software Engineering graduate Fred Daniel.',
    },
    '8da929030e54314cedd1e5bf29ca4753': {
      'title': 'Avotek App — Official Launch Creative',
      'category': 'Social Media',
      'caption':
          'Dual-phone fintech app showcase announcing instant wallet funding and bill payments.',
    },
    'baa61e902bf384c0f8baf2c7add5c52b': {
      'title': 'Avotek Is Back — Fintech Campaign',
      'category': 'Social Media',
      'caption':
          'High-energy product relaunch poster for Avotek\'s bill payment and e-pin platform.',
    },
    'e104cdfaab0ee5efbfc47fb440444e8d': {
      'title': 'Nigeria @ 66 Independence Tribute',
      'category': 'Social Media',
      'caption':
          'Rock-cave silhouette of Nigeria\'s map paired with emerald flag drapery and stadium backdrop.',
    },
    '8e4c7938c97b836083621d7c5a61079b': {
      'title': 'Olits Enterprise — Beverage Distributors',
      'category': 'Corporate',
      'caption':
          'Clean retail product display flyer for soft drinks, bottled water, and yogurt distribution.',
    },
    '671b006c124156776935f0b3028fd93f': {
      'title': 'Eva Heavenly Collection & Store',
      'category': 'Corporate',
      'caption':
          'Structured multi-grid retail flyer showcasing footwear, bags, and cosmetics in Festac Town.',
    },
    '61a8fb9e9d6a45fdeb2e4e6bd295bd62': {
      'title': 'The Grinding Continues — AVO Media',
      'category': 'Social Media',
      'caption':
          '3D character tug-of-war artwork spotlighting AVO Media\'s relentless creative delivery.',
    },
    'bfd5b028ff564e15baafab3416f9c20c': {
      'title': 'Thank You Messi 2006–2026 (Gold Edition)',
      'category': 'Social Media',
      'caption':
          'Warm stadium gold sports poster celebrating Lionel Messi\'s international legacy.',
    },
    '5c3acd202db078d4f0db576b4654bc19': {
      'title': 'Thank You Messi 2006–2026 (Noir Edition)',
      'category': 'Social Media',
      'caption':
          'High-contrast monochrome and Argentina blue tribute graphic honoring Lionel Messi.',
    },
  };

  static const List<Map<String, String>> _fallbackPool = [
    {
      'title': 'Editorial Key Visual',
      'category': 'Social Media',
      'caption':
          'Bold typographic composition and high-contrast lighting crafted for instant feed authority.',
    },
    {
      'title': 'Brand Campaign Artwork',
      'category': 'Corporate',
      'caption':
          'Strategic commercial layout designed to elevate brand perception and audience trust.',
    },
    {
      'title': 'Visual Identity Showcase',
      'category': 'Branding',
      'caption':
          'Distilled mark and visual system built for clarity across digital and print platforms.',
    },
    {
      'title': 'Event Spotlight Poster',
      'category': 'Event Flyers',
      'caption':
          'Dynamic promotional artwork structured for rapid mobile readability and engagement.',
    },
    {
      'title': 'Ministry Encounter Graphic',
      'category': 'Church & Ministry',
      'caption':
          'Atmospheric key art combining expressive typography with balanced visual hierarchy.',
    },
    {
      'title': 'Milestone Tribute Design',
      'category': 'Celebrations',
      'caption':
          'Commemorative portrait composition finished with refined color grading and custom type.',
    },
  ];

  final ValueNotifier<List<ProjectItem>> projectsNotifier =
      ValueNotifier<List<ProjectItem>>(List<ProjectItem>.from(PortfolioData.projects));

  final ValueNotifier<bool> isSyncingNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<DateTime?> lastSyncedNotifier = ValueNotifier<DateTime?>(null);
  final ValueNotifier<int> syncedCountNotifier = ValueNotifier<int>(0);

  final Map<String, ProjectItem> _pinterestPins = {};
  Timer? _autoSyncTimer;
  bool _initialized = false;

  void startAutoSync() {
    _autoSyncTimer?.cancel();
    if (!_initialized) {
      _initialized = true;
      syncNow();
    }
    _autoSyncTimer = Timer.periodic(const Duration(minutes: 2), (_) {
      syncNow();
    });
  }

  void stopAutoSync() {
    _autoSyncTimer?.cancel();
    _autoSyncTimer = null;
  }

  Future<void> syncNow() async {
    if (isSyncingNotifier.value) return;
    isSyncingNotifier.value = true;

    try {
      await _loadBundledPins();
      await _fetchLivePinterestFeed();
      lastSyncedNotifier.value = DateTime.now();
    } catch (_) {
      // Keep existing projects if offline or blocked
    } finally {
      _rebuildProjectsList();
      isSyncingNotifier.value = false;
    }
  }

  String _pinKey(ProjectItem pin) {
    final hash = _extractImageHash(pin.imagePath);
    if (hash.isNotEmpty) return hash;
    return pin.id;
  }

  Future<void> _loadBundledPins() async {
    try {
      final rawJson = await rootBundle.loadString('assets/data/pinterest_pins.json');
      if (rawJson.trim().isEmpty) return;
      final decoded = jsonDecode(rawJson);
      if (decoded is List) {
        for (final item in decoded) {
          if (item is Map<String, dynamic>) {
            final pin = _normalizePin(ProjectItem.fromJson(item));
            if (pin.imagePath.isNotEmpty) {
              _pinterestPins[_pinKey(pin)] = pin;
            }
          }
        }
      }
    } catch (_) {
      // Asset may not exist or be empty in test environments
    }
  }

  Future<void> _fetchLivePinterestFeed() async {
    final encodedRss = Uri.encodeComponent(rssUrl);
    final endpoints = <String>[
      'https://api.rss2json.com/v1/api.json?rss_url=$encodedRss',
      'https://api.allorigins.win/raw?url=$encodedRss',
      'https://corsproxy.io/?$encodedRss',
      rssUrl,
    ];

    for (final endpoint in endpoints) {
      try {
        final response = await http
            .get(Uri.parse(endpoint))
            .timeout(const Duration(seconds: 7));

        if (response.statusCode == 200 && response.body.trim().isNotEmpty) {
          final parsed = parseFeedPayload(response.body);
          if (parsed.isNotEmpty) {
            for (final pin in parsed) {
              final key = _pinKey(pin);
              final existing = _pinterestPins[key];
              // Preserve local bundled media asset path if already downloaded
              if (existing != null && !existing.isNetworkImage) {
                continue;
              }
              _pinterestPins[key] = pin;
            }
            return;
          }
        }
      } catch (_) {
        continue;
      }
    }
  }

  void _rebuildProjectsList() {
    final existingKeys = <String>{};
    final combined = <ProjectItem>[];

    // Add live/synced Pinterest pins first so new uploads appear immediately at the top
    int uniquePinCount = 0;
    for (final pin in _pinterestPins.values) {
      final key = _pinKey(pin);
      if (existingKeys.add(key)) {
        combined.add(pin);
        uniquePinCount++;
      }
    }
    syncedCountNotifier.value = uniquePinCount;

    // Add curated local portfolio works
    for (final project in PortfolioData.projects) {
      if (existingKeys.add(project.imagePath)) {
        combined.add(project);
      }
    }

    projectsNotifier.value = combined;
  }

  @visibleForTesting
  List<ProjectItem> parseFeedPayload(String body) {
    final trimmed = body.trim();
    if (trimmed.startsWith('{')) {
      return _parseRss2Json(trimmed);
    } else if (trimmed.contains('<item>')) {
      return _parseRssXml(trimmed);
    }
    return const [];
  }

  List<ProjectItem> _parseRss2Json(String jsonStr) {
    final results = <ProjectItem>[];
    final seenImages = <String>{};
    try {
      final data = jsonDecode(jsonStr);
      if (data is! Map<String, dynamic>) return results;
      final items = data['items'];
      if (items is! List) return results;

      for (int i = 0; i < items.length; i++) {
        final item = items[i];
        if (item is! Map<String, dynamic>) continue;
        final rawTitle = (item['title'] ?? '').toString();
        final rawDesc = (item['description'] ?? item['content'] ?? '').toString();
        final link = (item['link'] ?? item['guid'] ?? profileUrl).toString();
        final pubDate = (item['pubDate'] ?? '').toString();
        final thumbnail = (item['thumbnail'] ?? '').toString();

        final imageUrl = _extractHighResImage(rawDesc, fallbackUrl: thumbnail);
        if (imageUrl.isEmpty || !seenImages.add(imageUrl)) continue;

        final pin = buildCaptionedPin(
          rawTitle: rawTitle,
          rawDescription: rawDesc,
          imageUrl: imageUrl,
          link: link,
          pubDate: pubDate,
          index: results.length,
        );
        results.add(pin);
      }
    } catch (_) {}
    return results;
  }

  List<ProjectItem> _parseRssXml(String xmlStr) {
    final results = <ProjectItem>[];
    final seenImages = <String>{};
    final itemMatches = RegExp(r'<item>([\s\S]*?)<\/item>', caseSensitive: false)
        .allMatches(xmlStr);

    for (final match in itemMatches) {
      final itemXml = match.group(1) ?? '';
      final rawTitle = _extractXmlTag(itemXml, 'title');
      final rawDesc = _extractXmlTag(itemXml, 'description');
      final link = _extractXmlTag(itemXml, 'link');
      final guid = _extractXmlTag(itemXml, 'guid');
      final pubDate = _extractXmlTag(itemXml, 'pubDate');

      final imageUrl = _extractHighResImage(rawDesc);
      if (imageUrl.isEmpty || !seenImages.add(imageUrl)) continue;

      final pin = buildCaptionedPin(
        rawTitle: rawTitle,
        rawDescription: rawDesc,
        imageUrl: imageUrl,
        link: link.isNotEmpty ? link : (guid.isNotEmpty ? guid : profileUrl),
        pubDate: pubDate,
        index: results.length,
      );
      results.add(pin);
    }
    return results;
  }

  String _extractXmlTag(String xml, String tag) {
    final regex = RegExp('<$tag[^>]*>([\\s\\S]*?)<\\/$tag>', caseSensitive: false);
    final match = regex.firstMatch(xml);
    if (match == null) return '';
    var content = match.group(1) ?? '';
    content = content.replaceAll(RegExp(r'<!\[CDATA\[|\]\]>'), '');
    return _decodeHtmlEntities(content).trim();
  }

  String _extractHighResImage(String htmlContent, {String fallbackUrl = ''}) {
    final imgRegex = RegExp(r'src=["\x27](https?:\/\/[^"\x27]+)["\x27]', caseSensitive: false);
    final match = imgRegex.firstMatch(htmlContent);
    String url = match?.group(1) ?? fallbackUrl;
    if (url.isEmpty) return '';

    // Upgrade Pinterest 236x / 474x thumbnails to crisp 736x high-resolution artwork
    url = url.replaceFirst(RegExp(r'\/(236x|474x|170x)\/'), '/736x/');
    return url;
  }

  ProjectItem _normalizePin(ProjectItem item) {
    final hash = _extractImageHash(item.imagePath);
    if (hash.isNotEmpty && _curatedByHash.containsKey(hash)) {
      final curated = _curatedByHash[hash]!;
      return ProjectItem(
        id: item.id,
        title: curated['title']!,
        category: curated['category']!,
        imagePath: item.imagePath,
        caption: curated['caption']!,
        client: item.client,
        year: item.year,
        deliverables: item.deliverables,
        tools: item.tools,
        isFeatured: item.isFeatured,
        sourceUrl: item.sourceUrl ?? profileUrl,
        isFromPinterest: true,
      );
    }
    if (item.caption.trim().isNotEmpty && item.title.trim().isNotEmpty) {
      return item;
    }
    return buildCaptionedPin(
      rawTitle: item.title,
      rawDescription: item.caption,
      imageUrl: item.imagePath,
      link: item.sourceUrl ?? profileUrl,
      pubDate: item.year,
      index: 0,
    );
  }

  /// Smart Caption & Categorization Engine for Pinterest uploads
  ProjectItem buildCaptionedPin({
    required String rawTitle,
    required String rawDescription,
    required String imageUrl,
    required String link,
    required String pubDate,
    required int index,
  }) {
    final cleanedTitle = _cleanText(rawTitle);
    final cleanedDesc = _cleanText(rawDescription);
    final combinedContext = '$cleanedTitle $cleanedDesc'.trim();
    final imageHash = _extractImageHash(imageUrl);

    String category;
    String title;
    String caption;

    if (imageHash.isNotEmpty &&
        _curatedByHash.containsKey(imageHash) &&
        combinedContext.isEmpty) {
      final curated = _curatedByHash[imageHash]!;
      title = curated['title']!;
      category = curated['category']!;
      caption = curated['caption']!;
    } else {
      category = combinedContext.isNotEmpty
          ? inferCategory(combinedContext)
          : _fallbackPool[index % _fallbackPool.length]['category']!;
      title = generateSmartTitle(cleanedTitle, cleanedDesc, category, index);
      caption = generateSmartCaption(title, cleanedDesc, category, index: index);
    }

    // If this pin's hash is one of our bundled assets, resolve directly to the bundled media file
    final resolvedImagePath = (imageHash.isNotEmpty && _curatedByHash.containsKey(imageHash))
        ? 'assets/portfolio/pinterest/$imageHash.jpg'
        : imageUrl;

    final year = _extractYear(pubDate);
    final id = _extractPinId(link, imageUrl, index);

    return ProjectItem(
      id: 'pinterest-$id',
      title: title,
      category: category,
      imagePath: resolvedImagePath,
      caption: caption,
      client: 'AVO Media • Pinterest',
      year: year,
      deliverables: const ['High-Res Visual', 'Digital & Print'],
      tools: const ['Photoshop', 'Illustrator'],
      isFeatured: index < 3,
      sourceUrl: link.isNotEmpty ? link : profileUrl,
      isFromPinterest: true,
    );
  }

  static String inferCategory(String text) {
    final lower = text.toLowerCase();
    if (RegExp(
            r'church|ministry|sermon|worship|sunday|pastor|apostolic|bible|revival|prayer|gospel|bishop|tarry|fellowship|carol')
        .hasMatch(lower)) {
      return 'Church & Ministry';
    }
    if (RegExp(r'logo|brand|identity|monogram|wordmark|guideline|rebrand|emblem|crest')
        .hasMatch(lower)) {
      return 'Branding';
    }
    if (RegExp(r'book|cover|ebook|author|publishing|novel|manual')
        .hasMatch(lower)) {
      return 'Book Covers';
    }
    if (RegExp(
            r'birthday|anniversary|jubilee|wedding|celebration|congrat|tribute|milestone|convocation|graduation')
        .hasMatch(lower)) {
      return 'Celebrations';
    }
    if (RegExp(
            r'corporate|business|menu|catering|food|kitchen|company|training|masterclass|academy|real estate|enterprise|logistics|store')
        .hasMatch(lower)) {
      return 'Corporate';
    }
    if (RegExp(
            r'flyer|conference|summit|concert|event|party|ticket|welcome to|month|festival|crusade')
        .hasMatch(lower)) {
      return 'Event Flyers';
    }
    return 'Social Media';
  }

  static String generateSmartTitle(
    String cleanedTitle,
    String cleanedDesc,
    String category,
    int index,
  ) {
    String candidate = cleanedTitle.isNotEmpty ? cleanedTitle : cleanedDesc;
    candidate = candidate
        .replaceAll(
            RegExp(
                r'^(pin by|uploaded by|saved by|image|photo|img_\d+|untitled).*$',
                caseSensitive: false),
            '')
        .trim();

    if (candidate.isNotEmpty) {
      final firstClause = candidate.split(RegExp(r'[.!?•|\n–—-]')).first.trim();
      final words =
          firstClause.split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
      if (words.length >= 2) {
        final clipped = words.take(6).join(' ');
        return _toTitleCase(clipped);
      }
    }

    final poolEntry = _fallbackPool[index % _fallbackPool.length];
    return '${poolEntry['title']} #${index + 1}';
  }

  static String generateSmartCaption(
    String title,
    String cleanedDesc,
    String category, {
    int index = 0,
  }) {
    if (cleanedDesc.length >= 18 &&
        cleanedDesc.toLowerCase() != title.toLowerCase()) {
      final firstSentence =
          cleanedDesc.split(RegExp(r'(?<=[.!?])\s+')).first.trim();
      final words = firstSentence.split(RegExp(r'\s+'));
      final concise = words.length > 16
          ? '${words.take(16).join(' ')}...'
          : firstSentence;
      final punctuated = concise.endsWith('.') || concise.endsWith('!')
          ? concise
          : '$concise.';
      return '${punctuated[0].toUpperCase()}${punctuated.substring(1)}';
    }

    if (index % 2 == 1) {
      return _fallbackPool[index % _fallbackPool.length]['caption']!;
    }

    switch (category) {
      case 'Church & Ministry':
        return 'Dignified ministry visual crafted with bold typographic hierarchy and atmospheric lighting.';
      case 'Branding':
        return 'Modern brand identity composition engineered for clarity across digital and print touchpoints.';
      case 'Book Covers':
        return 'Editorial publication cover designed for strong shelf presence and instant reader connection.';
      case 'Celebrations':
        return 'Bespoke commemorative portrait composition with refined color grading and custom lettering.';
      case 'Corporate':
        return 'Strategic commercial design structured to elevate brand credibility and drive action.';
      case 'Event Flyers':
        return 'High-impact promotional event visual balanced for rapid mobile readability and engagement.';
      default:
        return 'High-contrast social media visual crafted by AVO Media for maximum audience attention.';
    }
  }

  static String _extractImageHash(String imageUrl) {
    final match = RegExp(r'([a-f0-9]{32})\.\w+$').firstMatch(imageUrl);
    return match?.group(1) ?? '';
  }

  static String _cleanText(String input) {
    var text = input.replaceAll(RegExp(r'<[^>]*>'), ' ');
    text = _decodeHtmlEntities(text);
    text = text.replaceAll(RegExp(r'https?:\/\/\S+'), '');
    text = text.replaceAll(RegExp(r'#\S+'), '');
    text = text.replaceAll(RegExp(r'\s+'), ' ').trim();
    return text;
  }

  static String _decodeHtmlEntities(String text) {
    return text
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&apos;', "'")
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&nbsp;', ' ');
  }

  static String _toTitleCase(String input) {
    return input.split(' ').map((word) {
      if (word.isEmpty) return word;
      if (word.length > 1 && word == word.toUpperCase()) return word;
      return '${word[0].toUpperCase()}${word.substring(1)}';
    }).join(' ');
  }

  static String _extractYear(String pubDate) {
    final match = RegExp(r'\b(202\d)\b').firstMatch(pubDate);
    return match?.group(1) ?? DateTime.now().year.toString();
  }

  static String _extractPinId(String link, String imageUrl, int index) {
    final pinMatch = RegExp(r'\/pin\/(\d+)').firstMatch(link);
    if (pinMatch != null) return pinMatch.group(1)!;
    final hash = imageUrl.hashCode.abs();
    return '$hash-$index';
  }
}
