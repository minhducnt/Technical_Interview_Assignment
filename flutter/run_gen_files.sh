# Flutter
flutter clean; flutter pub get
dart run flutter_native_splash:create
dart run build_runner build --delete-conflicting-outputs

# Android
cd android; gradle clean; cd ..

# IOS
cd ios; pod install; pod install --repo-update; cd ..