# Concepts Used in QuizzApp

This guide introduces the Dart and Flutter concepts used in the project and
where to find them.

## Dart fundamentals

- **Classes and objects:** `Category` and `Question` represent quiz data in
  `lib/models/`.
- **Constructors and named parameters:** calls such as
  `Question(text: ..., answer: ...)` make object creation clear.
- **Types and null safety:** fields have explicit types, and nullable values
  such as `bool?` represent a value that may not have been selected yet.
- **`final` and `const`:** `final` prevents reassignment; `const` marks
  compile-time immutable data and widgets.
- **Lists and iteration:** categories and questions are stored as lists in
  `lib/data/quizz_data.dart`, then used to build UI and run quizzes.

## Flutter UI

- **Widgets:** Flutter interfaces are composed from widgets such as `Scaffold`,
  `AppBar`, `Text`, `Image`, and buttons.
- **Widget composition:** screens combine small widgets to build larger layouts.
  Examples include `Column`, `Row`, `Stack`, `GridView`, and `Padding`.
- **Stateless widgets:** `HomeScreen`, `CategoryScreen`, and `ScoreScreen`
  render UI that does not own changing quiz state.
- **Stateful widgets:** `DetailedView` keeps track of which question is active,
  which answer was selected, and the current score.
- **Responsive layout:** `SafeArea`, scrolling widgets, and layout constraints
  help content fit on different screen sizes.
- **Styling and themes:** colors, gradients, shadows, and rounded corners are
  shared through `lib/theme/app_colors.dart`.

## State and user interaction

- **State:** the question index, selected answer, and score describe the current
  quiz session.
- **`setState`:** calling `setState` in `DetailedView` asks Flutter to rebuild
  the screen after quiz values change.
- **Callbacks:** button callbacks connect taps to actions such as checking an
  answer or continuing to the next question.
- **Conditional rendering:** answer feedback and the continue button appear
  after the user selects an answer.

## Data, assets, and navigation

- **Data-driven UI:** `QuizData.categories` holds categories, their image asset
  paths, and their questions. The category grid is generated from this data.
- **Asset bundles:** images in `assets/` are listed under `flutter.assets` in
  `pubspec.yaml`, then loaded with `Image.asset`.
- **Navigation stack:** `Navigator.push` opens categories and a quiz;
  `Navigator.pushReplacement` moves from the completed quiz to its score;
  `popUntil` returns to the home screen.
- **Passing data between screens:** the selected `Category` and quiz score are
  passed through screen constructors.

## Testing and development tools

- **Widget tests:** `test/widget_test.dart` taps through a quiz and checks answer
  feedback, score, and navigation back home.
- **Static analysis:** `flutter analyze` checks Dart code without running the
  app.
- **Hot reload and hot restart:** hot reload applies many UI/code changes to a
  running app; hot restart restarts the Dart program and resets its state.
