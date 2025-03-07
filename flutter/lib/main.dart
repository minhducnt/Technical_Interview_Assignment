import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sof_tracker/app.dart';
import 'package:sof_tracker/app/data/di.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      if (!kIsWeb) {
        await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
        );

        await $storage.initHive();
        await $log.initLogger();
      }

      runApp(const MyApp());
    },
    (error, stackTrace) {
      $log.handle(error, stackTrace);
    },
  );
}
