import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class ClientInquirySection extends StatefulWidget {
  final String? initialService;

  const ClientInquirySection({
    super.key,
    this.initialService,
  });

  @override
  State<ClientInquirySection> createState() => _ClientInquirySectionState();
}

class _ClientInquirySectionState extends State<ClientInquirySection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController(text: 'Nigeria');
  final _businessController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _budgetController = TextEditingController();
  final _deadlineController = TextEditingController(text: '3–5 days');

  String _selectedProjectType = 'Event Flyer';
  bool _submitted = false;

  final List<String> _projectTypes = [
    'Event Flyer',
    'Church & Ministry Design',
    'Brand Identity / Logo',
    'Social Media Ads / Content',
    'Business / Corporate Graphics',
    'Book / Publication Cover',
    'Celebration / Birthday Tribute',
    'Other Custom Design',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.initialService != null && widget.initialService!.isNotEmpty) {
      if (_projectTypes.contains(widget.initialService)) {
        _selectedProjectType = widget.initialService!;
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    _businessController.dispose();
    _descriptionController.dispose();
    _budgetController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

  Future<void> _launchWhatsAppWithFormData() async {
    final url = PortfolioData.buildWhatsAppUrl(
      clientName: _nameController.text.trim(),
      service: _selectedProjectType,
      budget: _budgetController.text.trim(),
      deadline: _deadlineController.text.trim(),
      notes: '${_descriptionController.text.trim()}\n• Org: ${_businessController.text.trim()}\n• Country: ${_countryController.text.trim()}',
    );
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _submitted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 700;

    return Container(
      width: double.infinity,
      color: AppTheme.bgSurface,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : (isTablet ? 32 : 20),
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.goldAccent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'CLIENT ONBOARDING & INQUIRY',
                  style: TextStyle(
                    color: AppTheme.goldAccentLight,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Let’s Work Together',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Fill out the project brief below, or connect directly on WhatsApp for immediate discussion.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: AppTheme.textSecondary),
              ),
              const SizedBox(height: 48),

              // Form Container
              Container(
                width: isDesktop ? 860 : double.infinity,
                padding: EdgeInsets.all(isDesktop ? 40 : 24),
                decoration: BoxDecoration(
                  color: AppTheme.bgCard,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppTheme.borderCard, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 32,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: _submitted ? _buildSuccessMessage() : _buildFormContent(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppTheme.whatsappGreen.withValues(alpha: 0.15),
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.whatsappGreen),
          ),
          child: const Icon(Icons.check, color: AppTheme.whatsappGreen, size: 36),
        ),
        const SizedBox(height: 24),
        const Text(
          'Project Request Submitted!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Thank you for your inquiry. Ademola (AVO Media) will review your brief and reply within 12–24 business hours.',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppTheme.textSecondary, fontSize: 14, height: 1.5),
        ),
        const SizedBox(height: 32),
        ElevatedButton.icon(
          onPressed: _launchWhatsAppWithFormData,
          icon: const Icon(Icons.chat_bubble_outline, size: 18),
          label: const Text('Speed up: Continue on WhatsApp Now'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.whatsappGreen,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => setState(() => _submitted = false),
          child: const Text('Submit Another Request', style: TextStyle(color: AppTheme.textMuted)),
        ),
      ],
    );
  }

  Widget _buildFormContent(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Full Name & WhatsApp Number
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildFormField(
                  controller: _nameController,
                  label: 'Full Name *',
                  hint: 'e.g. Samuel Adeyemi',
                  icon: Icons.person_outline,
                  validator: (v) => v == null || v.trim().isEmpty ? 'Please enter your name' : null,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildFormField(
                  controller: _phoneController,
                  label: 'WhatsApp Phone Number *',
                  hint: 'e.g. +234 801 234 5678',
                  icon: Icons.phone_outlined,
                  validator: (v) => v == null || v.trim().isEmpty ? 'Please enter your phone' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Row 2: Email & Business / Organization
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildFormField(
                  controller: _emailController,
                  label: 'Email Address *',
                  hint: 'e.g. client@example.com',
                  icon: Icons.mail_outline,
                  validator: (v) => v == null || !v.contains('@') ? 'Enter a valid email' : null,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildFormField(
                  controller: _businessController,
                  label: 'Brand / Organization',
                  hint: 'e.g. Apex Fellowship / Timia Shoes',
                  icon: Icons.business_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Project Type Dropdown
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Project Type *', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppTheme.bgSurface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.borderSubtle),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedProjectType,
                    isExpanded: true,
                    dropdownColor: AppTheme.bgElevated,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    icon: const Icon(Icons.keyboard_arrow_down, color: AppTheme.textSecondary),
                    items: _projectTypes.map((type) {
                      return DropdownMenuItem(value: type, child: Text(type));
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) setState(() => _selectedProjectType = val);
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Row 3: Budget Range & Target Deadline
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildFormField(
                  controller: _budgetController,
                  label: 'Estimated Budget (NGN ₦ or USD \$)',
                  hint: 'e.g. ₦35,000 or \$120',
                  icon: Icons.payments_outlined,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildFormField(
                  controller: _deadlineController,
                  label: 'Target Deadline',
                  hint: 'e.g. 3–5 days, or Urgent',
                  icon: Icons.calendar_today_outlined,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Project Description / Brief
          _buildFormField(
            controller: _descriptionController,
            label: 'Project Brief & Requirements *',
            hint: 'Tell me about the event theme, text details, colors, dimensions, target audience, or paste reference links...',
            icon: Icons.description_outlined,
            maxLines: 4,
            validator: (v) => v == null || v.trim().length < 5 ? 'Please describe your project' : null,
          ),
          const SizedBox(height: 32),

          // Action Buttons
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              ElevatedButton.icon(
                onPressed: _handleSubmit,
                icon: const Icon(Icons.send_rounded, size: 16),
                label: const Text('Submit Project Request'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
              OutlinedButton.icon(
                onPressed: _launchWhatsAppWithFormData,
                icon: const Icon(Icons.chat_bubble_outline, size: 16, color: AppTheme.whatsappGreen),
                label: const Text('Send Directly to WhatsApp'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.whatsappGreen,
                  side: const BorderSide(color: AppTheme.whatsappGreen, width: 1.5),
                  backgroundColor: AppTheme.whatsappGreen.withValues(alpha: 0.08),
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppTheme.textMuted, fontSize: 13),
            prefixIcon: maxLines == 1 ? Icon(icon, color: AppTheme.textMuted, size: 18) : null,
            filled: true,
            fillColor: AppTheme.bgSurface,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.borderSubtle),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.borderSubtle),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
