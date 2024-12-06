flutter clean; flutter pub get
dart run flutter_native_splash:create
dart run build_runner build --delete-conflicting-outputs
cd android; gradle clean; cd ..