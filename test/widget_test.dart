// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:quizz_app/data/quizz_data.dart';
import 'package:quizz_app/main.dart';

void main() {
  testWidgets('a category quiz completes and shows its score', (tester) async {
    expect(QuizData.categories, hasLength(6));
    for (final category in QuizData.categories) {
      expect(category.questions, hasLength(10));
    }

    await tester.pumpWidget(const QuizApp());
    await tester.ensureVisible(find.text('Get Started'));
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    final category = QuizData.categories.first;
    await tester.ensureVisible(find.text(category.name));
    await tester.tap(find.text(category.name));
    await tester.pumpAndSettle();

    for (var index = 0; index < category.questions.length; index++) {
      final question = category.questions[index];
      expect(find.text(question.text), findsOneWidget);

      final answerCorrectly = index != 0;
      final answer = answerCorrectly ? question.answer : !question.answer;
      await tester.tap(find.text(answer ? 'True' : 'False'));
      await tester.pumpAndSettle();
      expect(
        find.text(
          answerCorrectly ? 'Correct!' : 'Not quite. Try the next one!',
        ),
        findsOneWidget,
      );

      final nextButton = index == category.questions.length - 1
          ? 'See Your Score'
          : 'Next Question';
      await tester.ensureVisible(find.text(nextButton));
      await tester.tap(find.text(nextButton));
      await tester.pumpAndSettle();
    }

    expect(find.text('9 / 10'), findsOneWidget);
    expect(find.text('90% correct'), findsOneWidget);

    await tester.tap(find.text('Back to Home'));
    await tester.pumpAndSettle();
    expect(find.text('Get Started'), findsOneWidget);
  });
}
