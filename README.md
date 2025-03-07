# TechChallenge

## Mobile Developer Code Challenge

### Submission

Please read the README.md to run the project.

An application allow user to view list of StackOverflow (SOF) user, their reputation history and bookmark their favorite user.

### Getting Started

To run the app, clone the repository and follow the setup instructions. Once setup is complete, run the app.

### Initial Setup

To set up the project, run the following command to activate the project:

```bash
git clone https://github.com/minhducnt/TechChallenge.git
./run_gen_files.sh (Terminal)
```

Once the project is activated, run the following command to run the app:

```bash
flutter run
```

Or you can run by use F5 in Visual Studio Code.

### Features

- **User List**: Users can view a list of StackOverflow users.
- **Bookmark/de-bookmark** Users can bookmark their favorite users.
- **State Management**: GetX is used for efficient and fast state management throughout the application.
- **Local Database**: Hive is used for storing bookmarked users.
- **Internationalization**: Intl, Flutter Localization is used for internationalization in the application.
- **Network**: Retrofit is used for network calls in the application.

### Tech Stack

- Flutter
- GetX (State Management)
- Retrofit (Network)
- Hive (Local Database)
- Intl (Internationalization)
- Flutter Native Splash (Splash Screen)
- Lazy Loading (Infinite Scroll)
- Shimmer Effect (Loading)
- Lottie (Animation)
- Flutter Launcher Icons (App Icon)
- and other Flutter packages

### Screenshots

| Screen | Preview |
|--------|---------|
| **Splash** | ![Splash](screenshots/splash_screen.jpg){width=250} |
| **Home** | ![Home](screenshots/dashboard_screen.jpg){width=250} |
| **Bookmark** | ![Bookmark](screenshots/bookmark_screen.jpg{width=250}) |
| **Reputation History** | ![Reputation](screenshots/reputation_screen.jpg){width=250} |
