# Setup and Running the App

## Requirements

- Flutter SDK installed and available in the terminal as `flutter`.
- Dart SDK satisfying the constraint in `pubspec.yaml` (`^3.13.5`).
- A device, emulator, browser, or desktop target supported by your Flutter
  installation.
- Visual Studio Code with the Flutter and Dart extensions is recommended.

Run these commands in PowerShell to check your setup:

```powershell
flutter doctor
flutter devices
```

## Open the project in Visual Studio Code

1. Open Visual Studio Code.
2. Choose **File > Open Folder...**.
3. Select the project folder containing `pubspec.yaml`.
4. Choose **Terminal > New Terminal** to open a terminal at the project root.

Alternatively, open PowerShell and run:

```powershell
cd C:\Projects\quizz-app
code .
```

If `code` is not recognized, open the folder using VS Code's **Open Folder**
menu instead.

## Get dependencies and run

From the project root, fetch the packages and start the app:

```powershell
flutter pub get
flutter run
```

If more than one device is available, specify one listed by `flutter devices`.
For example:

```powershell
flutter run -d windows
flutter run -d chrome
```

To run from VS Code, select a device in the status bar and press **F5**.

## Hot reload and stop

While `flutter run` is active:

- Press `r` to hot reload code changes.
- Press `R` to restart the app and reset its in-memory state.
- Press `q` to stop the app.

## Run validation

```powershell
flutter analyze
flutter test
```

For an introduction to the code patterns used in this app, read
[concepts.md](./concepts.md).
