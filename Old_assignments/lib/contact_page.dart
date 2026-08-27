import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  // Helper method to display interactive toast feedback on tap
  void _showFeedback(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),

      // ==========================================
      // APP BAR
      // ==========================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Contact & Services',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showFeedback(context, 'Help & Support clicked'),
            icon: const Icon(Icons.help_outline, color: Colors.black),
          ),
        ],
      ),

      // ==========================================
      // BODY
      // ==========================================
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ======================================
                // HEADER BANNER CARD
                // ======================================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFFD54F),
                        Color(0xFFFF7043),
                        Color(0xFFE91E63),
                        Color(0xFF673AB7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.support_agent_rounded,
                        size: 54,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'How can we help you?',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Explore our services or get in touch below.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // ======================================
                // SERVICES SECTION
                // ======================================
                const Text(
                  'Our Services',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),

                // Service 1: App Development
                _buildServiceCard(
                  context: context,
                  icon: Icons.flutter_dash,
                  iconColor: const Color(0xFF02569B),
                  iconBgColor: const Color(0xFFE1F5FE),
                  title: 'App Development',
                  description:
                      'Cross-platform iOS and Android apps built with Flutter.',
                  buttonLabel: 'Explore',
                ),

                const SizedBox(height: 12),

                // Service 2: UI/UX Design
                _buildServiceCard(
                  context: context,
                  icon: Icons.palette_outlined,
                  iconColor: const Color(0xFFE91E63),
                  iconBgColor: const Color(0xFFFCE4EC),
                  title: 'UI/UX Design',
                  description:
                      'Modern, user-friendly interface designs and wireframes.',
                  buttonLabel: 'View',
                ),

                const SizedBox(height: 12),

                // Service 3: Cloud & Backend
                _buildServiceCard(
                  context: context,
                  icon: Icons.cloud_done_outlined,
                  iconColor: const Color(0xFFFF9800),
                  iconBgColor: const Color(0xFFFFF3E0),
                  title: 'Cloud & Backend',
                  description:
                      'Firebase integration, real-time sync, and scalable APIs.',
                  buttonLabel: 'Connect',
                ),

                const SizedBox(height: 12),

                // Service 4: Optimization & Support
                _buildServiceCard(
                  context: context,
                  icon: Icons.build_circle_outlined,
                  iconColor: const Color(0xFF4CAF50),
                  iconBgColor: const Color(0xFFE8F5E9),
                  title: 'Optimization & Support',
                  description:
                      'Performance audits, code reviews, and maintenance.',
                  buttonLabel: 'Request',
                ),

                const SizedBox(height: 24),

                // ======================================
                // CONTACT CHANNELS
                // ======================================
                const Text(
                  'Get in Touch',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),

                Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFFE3F2FD),
                          child: Icon(Icons.email_outlined, color: Colors.blue),
                        ),
                        title: const Text(
                          'Email Us',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('support@flutterapp.dev'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () => _showFeedback(context, 'Email button tapped'),
                      ),
                      Divider(height: 1, indent: 64, color: Colors.grey.shade200),
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFFE8F5E9),
                          child: Icon(Icons.phone_outlined, color: Colors.green),
                        ),
                        title: const Text(
                          'Call Us',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('+1 (555) 019-2834'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () => _showFeedback(context, 'Call button tapped'),
                      ),
                      Divider(height: 1, indent: 64, color: Colors.grey.shade200),
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFFF3E5F5),
                          child: Icon(Icons.chat_bubble_outline, color: Colors.purple),
                        ),
                        title: const Text(
                          'Live Chat',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('Typical reply time: 5 mins'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () => _showFeedback(context, 'Live chat opened'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // ======================================
                // FEEDBACK BUTTON
                // ======================================
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => _showFeedback(context, 'Feedback form opened!'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    icon: const Icon(Icons.rate_review_outlined),
                    label: const Text(
                      'Send Feedback',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable Service Card Component
  Widget _buildServiceCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String description,
    required String buttonLabel,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon in rounded container
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(width: 14),

            // Service Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // Action Button
            FilledButton.tonal(
              onPressed: () => _showFeedback(context, '$title action tapped'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(buttonLabel),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward_ios, size: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}