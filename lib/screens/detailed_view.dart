import 'package:flutter/material.dart';

import '../models/category.dart';
import '../theme/app_colors.dart';
import 'score_screen.dart';

class DetailedView extends StatefulWidget {
  const DetailedView({required this.category, super.key});

  final Category category;

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  int _questionIndex = 0;
  int _score = 0;
  bool? _selectedAnswer;

  void _answer(bool answer) {
    if (_selectedAnswer != null) return;

    final isCorrect =
        answer == widget.category.questions[_questionIndex].answer;
    setState(() {
      _selectedAnswer = answer;
      if (isCorrect) _score++;
    });
  }

  void _continueQuiz() {
    if (_questionIndex == widget.category.questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ScoreScreen(category: widget.category, score: _score),
        ),
      );
      return;
    }

    setState(() {
      _questionIndex++;
      _selectedAnswer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = widget.category.questions;
    final question = questions[_questionIndex];
    final answered = _selectedAnswer != null;
    final isCorrect = _selectedAnswer == question.answer;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.text),
        title: Text(
          widget.category.name,
          style: const TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'YOUR PROGRESS',
                    style: TextStyle(
                      color: AppColors.mutedText,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    '${_questionIndex + 1} / ${questions.length}',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: (_questionIndex + 1) / questions.length,
                  minHeight: 8,
                  backgroundColor: Colors.white,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 22),
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  widget.category.imageAsset,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.08),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Text(
                  question.text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    height: 1.35,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: _AnswerButton(
                      label: 'True',
                      icon: Icons.check_rounded,
                      selected: _selectedAnswer == true,
                      enabled: !answered,
                      onPressed: () => _answer(true),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _AnswerButton(
                      label: 'False',
                      icon: Icons.close_rounded,
                      selected: _selectedAnswer == false,
                      enabled: !answered,
                      onPressed: () => _answer(false),
                    ),
                  ),
                ],
              ),
              if (answered) ...[
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? const Color(0xFFE7F6EC)
                        : const Color(0xFFFFE9E8),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isCorrect ? Icons.check_circle : Icons.cancel,
                        color: isCorrect
                            ? const Color(0xFF21864A)
                            : const Color(0xFFC43D3D),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          isCorrect
                              ? 'Correct!'
                              : 'Not quite. Try the next one!',
                          style: TextStyle(
                            color: isCorrect
                                ? const Color(0xFF176B39)
                                : const Color(0xFF9B2C2C),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _continueQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      _questionIndex == questions.length - 1
                          ? 'See Your Score'
                          : 'Next Question',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({
    required this.label,
    required this.icon,
    required this.selected,
    required this.enabled,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final buttonColor = selected
        ? AppColors.primary.withValues(alpha: 0.12)
        : Colors.white;
    final foregroundColor = selected
        ? AppColors.primary
        : enabled
        ? AppColors.primary
        : AppColors.mutedText;
    final borderColor = enabled || selected
        ? AppColors.primary
        : AppColors.mutedText.withValues(alpha: 0.35);

    return SizedBox(
      height: 56,
      child: OutlinedButton.icon(
        onPressed: enabled ? onPressed : null,
        icon: Icon(icon),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor,
          disabledForegroundColor: foregroundColor,
          backgroundColor: buttonColor,
          disabledBackgroundColor: buttonColor,
          side: BorderSide(color: borderColor, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
