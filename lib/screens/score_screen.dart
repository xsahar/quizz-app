import 'package:flutter/material.dart';

import '../models/category.dart';
import '../theme/app_colors.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({required this.category, required this.score, super.key});

  final Category category;
  final int score;

  @override
  Widget build(BuildContext context) {
    final total = category.questions.length;
    final percentage = (score / total * 100).round();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Quiz Complete',
          style: TextStyle(color: AppColors.text, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.emoji_events_rounded,
                      color: Colors.white,
                      size: 56,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      category.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$score / $total',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$percentage% correct',
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                score == total
                    ? 'Perfect score! Amazing work.'
                    : score >= total / 2
                    ? 'Nice work. Keep learning!'
                    : 'Good try. Play again to improve!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                height: 58,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  icon: const Icon(Icons.home_rounded),
                  label: const Text('Back to Home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
