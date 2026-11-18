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
  final _contactController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedProjectType = 'Event Flyers';
  bool _submitted = false;

  final List<String> _projectTypes = [
    'Event Flyers',
    'Church & Ministry',
    'Brand Identity',
    'Social Media & Ads',
    'Corporate Graphics',
    'Book Covers',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.initialService != null &&
        _projectTypes.contains(widget.initialService)) {
      _selectedProjectType = widget.initialService!;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _sendToWhatsApp() async {
    final notes = StringBuffer();
    if (_contactController.text.trim().isNotEmpty) {
      notes.write('Contact: ${_contactController.text.trim()} | ');
    }
    if (_descriptionController.text.trim().isNotEmpty) {
      notes.write(_descriptionController.text.trim());
    }

    final url = PortfolioData.buildWhatsAppUrl(
      clientName: _nameController.text.trim(),
      service: _selectedProjectType,
      notes: notes.toString().trim(),
    );
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _sendToWhatsApp();
      setState(() => _submitted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 960;

    return Container(
      width: double.infinity,
      color: AppTheme.bgDark,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 40 : 20,
        vertical: 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Start a Project',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(isDesktop ? 32 : 20),
                decoration: BoxDecoration(
                  color: AppTheme.bgCard,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.borderSubtle),
                ),
                child: _submitted ? _buildSuccess() : _buildForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccess() {
    return Column(
      children: [
        const Icon(Icons.check_circle_outline, color: AppTheme.whatsappGreen, size: 42),
        const SizedBox(height: 12),
        const Text(
          'Brief Ready',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: _sendToWhatsApp,
          icon: const Icon(Icons.chat_bubble_outline, size: 16),
          label: const Text('Continue on WhatsApp'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.whatsappGreen,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => setState(() => _submitted = false),
          child: const Text('Reset', style: TextStyle(color: AppTheme.textMuted)),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _buildInput(
                  controller: _nameController,
                  label: 'Name',
                  hint: 'Your name',
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: _buildInput(
                  controller: _contactController,
                  label: 'Phone or Email',
                  hint: '+234... or email',
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Required' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Service',
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
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
                style: const TextStyle(color: Colors.white, fontSize: 13),
                items: _projectTypes
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedProjectType = val);
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildInput(
            controller: _descriptionController,
            label: 'Project Brief',
            hint: 'Key details, title, date, or style...',
            maxLines: 3,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'Required' : null,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _handleSubmit,
              icon: const Icon(Icons.arrow_forward_rounded, size: 16),
              label: const Text('Send Brief via WhatsApp'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          style: const TextStyle(color: Colors.white, fontSize: 13),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
            filled: true,
            fillColor: AppTheme.bgSurface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
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
              borderSide: const BorderSide(color: AppTheme.primaryBlue),
            ),
          ),
        ),
      ],
    );
  }
}
