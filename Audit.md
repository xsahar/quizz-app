# Project Audit

## Functional requirements

- [x] **Runs without crashing:** `flutter test test/widget_test.dart` exercises
  the full quiz flow, and `flutter analyze` completes without issues.
- [x] **Changes state during use:** answering updates feedback and score;
  continuing advances the question.
- [x] **At least five categories:** the app has six categories.
- [x] **At least ten questions per category:** each category contains ten.
- [x] **At least ten questions per quiz:** each quiz contains ten.
- [x] **Relevant category names and images:** every category uses its own
  registered image asset.
- [x] **Category selection opens `DetailedView`:** selecting a category pushes
  the `DetailedView` route.
- [x] **Question page contents:** `DetailedView` displays the question, category
  image, and True/False buttons.
- [x] **Answer progression:** a submitted answer is evaluated once; the user can
  proceed to the next question and then to the score.
- [x] **Answer feedback:** the app indicates whether the selected answer is
  correct.
- [x] **Score and return home:** the score screen displays the result and has a
  Back to Home button.

## Optional bonus requirements

These are not required for the core app:

- [ ] Individual images for every question.
- [ ] A timer for each question.
- [ ] Automatic handling of unanswered timed questions.
- [ ] Shuffling questions for each playthrough.
- [ ] Difficulty levels.
- [ ] A leaderboard.
