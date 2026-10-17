import 'package:flutter/material.dart';

import 'category_screen.dart';
import '../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color backgroundColor = AppColors.background;
  static const Color primaryColor = AppColors.primary;
  static const Color secondaryColor = AppColors.secondary;
  static const Color textColor = AppColors.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. Header
                        _buildHeader(),

                        const SizedBox(height: 32),

                        // 2. Welcome card
                        _buildHeroCard(),

                        const SizedBox(height: 28),

                        // 3. Feature highlights
                        _buildFeatureGrid(),

                        const SizedBox(height: 24),

                        // 4. Motivational card
                        _buildChallengeCard(),

                        const SizedBox(height: 20),

                        // 5. Featured quiz
                        _buildFeaturedCard(context),

                        const Spacer(),

                        const SizedBox(height: 28),

                        // 6. Main action
                        _buildGetStartedButton(context),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // App header
  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: primaryColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.quiz_rounded, color: primaryColor, size: 24),
        ),
        const SizedBox(width: 12),
        const Text(
          'QuizzApp',
          style: TextStyle(
            color: textColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  // Hero card
  Widget _buildHeroCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryColor, secondaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.22),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Challenge Your Mind',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Jump into fast-paced trivia across '
            'multiple topics. Fast rounds, instant results.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15.5,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  // Two-by-two feature grid
  Widget _buildFeatureGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildFeatureCard(Icons.bolt_rounded, 'Instant Feedback'),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _buildFeatureCard(Icons.category_rounded, 'Multi-Topic'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildFeatureCard(
                Icons.check_circle_outline_rounded,
                'True or False',
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _buildFeatureCard(Icons.timer_rounded, 'Quick Rounds'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureCard(IconData icon, String label) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: primaryColor, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // Motivational card
  Widget _buildChallengeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softPurple,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.emoji_events_rounded,
              color: primaryColor,
              size: 25,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ready for a Challenge?',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Pick a topic and test your knowledge!',
                  style: TextStyle(
                    color: AppColors.mutedText,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Featured quiz card
  Widget _buildFeaturedCard(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => _openCategories(context),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.star_rounded,
                  color: primaryColor,
                  size: 25,
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pick a Quiz Category',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Six topics, 10 questions each',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Main button
  Widget _buildGetStartedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        onPressed: () => _openCategories(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'Get Started',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }

  // Navigation to the Categories page
  void _openCategories(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CategoryScreen()),
    );
  }
}
